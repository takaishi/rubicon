module Rubicon
  class Watcher
    class << self
      def start
        watcher = new(@watch_block)
        watcher.watch('health/state/critical')
      end

      def watch_critical(&block)
        @watch_block = block
      end
    end

    def initialize(block)
      @block = block
    end

    def get_index(path)
      http = HttpRequest.new
      url = "http://localhost:8500/v1/#{path}"
      res = http.get(url)

      res.header['X-Consul-Index'].to_i
    end

    def watch(path)
      index = get_index(path)
      puts "index: #{index}"

      loop do
        http = HttpRequest.new
        res = http.get("http://localhost:8500/v1/#{path}", {index: index + 1})

        index = res.header['X-Consul-Index'].to_i
        healths = JSON.parse(res.body).map do |h|
          Health.new(_health(h))
        end

        event = Event.new(healths)
        @block.call(event)
      end
    end

   private

    def _health(h)
      {
          'node' => h['Node'],
          'check_id' => h['CheckID'],
          'name' => h['Name'],
          'status' => h['Status'],
          'notes' => h['Notes'],
          'output' => h['Output'],
          'service_id' => h['ServiceID'],
          'service_name' => h['ServiceName'],
          'service_tags' => h['ServiceTags'],
          'create_index' => h['CreateIndex'],
          'modify_index' => h['ModifyIndex']
      }
    end
  end
end
