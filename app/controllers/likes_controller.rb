class LikesController < HomeController
  def create
    respond_to do |format|
      if user_signed_in?.present?
        like = current_user.likes.where(like_params).first_or_create
        format.json do
          render json: {
            id: like.id,
            message: 'Successfully saved.'
          }, status: :ok
        end
      else
        format.json do
          render json: { message: 'Unautorized' }, status: :unauthorized
        end
      end
    end
  end

  def destroy
    respond_to do |format|
      if user_signed_in?.present?
        if current_user.likes.find_by_id(params[:id]).destroy
          format.json do
            render json: { message: 'Successfully removed.'}, status: :ok
          end
        else
          format.json do
            render json: { message: 'Error while removing.'}, status: 500
          end
        end
      else
        format.json do
          render json: { message: 'Unautorized' }, status: :unauthorized
        end
      end
    end
  end

  private

    def like_params
      params.require(:like).permit(:id, :recipe_id)
    end
end
