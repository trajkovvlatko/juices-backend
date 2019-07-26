class CurrentUserController < HomeController
  def show
    respond_to do |format|
      if user_signed_in?.present?
        format.json do
          render json: { name: current_user.name }, status: :ok
        end
      else
        format.json do
          render json: { message: 'Unautorized' }, status: :unauthorized
        end
      end
    end
  end
end
