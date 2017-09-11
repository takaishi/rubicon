class Health
  attr_accessor :status, :node, :name, :service_id

  def initialize(param)
    @param = param
    @node = param['node']
    @check_id = param['check_id']
    @name = param['name']
    @status = param['status']
    @notes = param['notes']
    @output = param['output']
    @service_id = param['service_id']
    @service_name = param['service_name']
    @service_tags = param['service_tags']
    @create_index = param['create_index']
    @modify_intex = param['modify_intex']
  end
end
