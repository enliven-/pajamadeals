module InheritedResources
  module BaseHelpers
    protected
    def build_resource
      get_resource_ivar || set_resource_ivar(end_of_association_chain.send(method_for_build, request.get? ? {} : resource_params))
    end

    def update_resource(object, attributes)
      object.update_attributes(attributes)
    end
  end
end

class StudentAmbassadorsController < InheritedResources::Base
  
  def create
    @sa = StudentAmbassador.new(resource_params)
    
    respond_to do |format|
      if @sa.save
          format.js
      else
          format.js { alert("Something went wrong, we are sorry for inconvinence") }
      end
    end
  end

  private
  
  def resource_params
    params.require(:student_ambassador).permit!
  end
end
