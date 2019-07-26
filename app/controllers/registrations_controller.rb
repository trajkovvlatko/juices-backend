class RegistrationsController < DeviseTokenAuth::RegistrationsController
  def render_create_success
    render json: { name: @resource.name }
  end

  def render_update_success
    render json: { name: @resource.name }
  end
end