class Node
  attr_accessor :name, :healths

  def initialize(name)
    @name = name
    @healths = []
  end

  def critical?(service_id)
    @healths.any? { |health| health.service_id == service_id && health.status == 'critical'}
  end
end
