class SessionsController < DeviseTokenAuth::SessionsController
  def render_create_success
    render json: { name: @resource.name }
  end
end