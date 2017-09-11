
class Event
  attr_reader :healths, :nodes

  def initialize(healths)
    @healths = healths
    @nodes = []
    @healths.each do |event|
      unless @nodes.any?{|n| event.node == n.name}
        @nodes << Node.new(event.node)
      end
      @nodes.find{|n| event.node == n.name}.healths << event
    end
  end
end
