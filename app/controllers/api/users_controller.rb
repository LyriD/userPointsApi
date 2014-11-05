module Api
  class UsersController < Api::BaseController
    before_action :set_resource, only: [:change_rate, :user_data]
    rescue_from ActiveRecord::RecordNotFound, :with => :not_found
    rescue_from ActiveRecord::RecordInvalid, :with => :record_invalid


    def change_rate
      if @user.update!(user_points_params)
        PrivatePub.publish_to "/change_user_rate/change", {user_id: @user.id, user_total: @user.total_points} unless Rails.env.test?
        render nothing: true #возвращаем 200 статус если все ок
      else
        render json: get_resource.errors, status: :unprocessable_entity
      end
    end


    def get_all_users
       @users = User.all
    end


    def user_data

    end


  private

    def not_found
      render text: 'Пользователь с запрашиваемым id не найден'
    end
    def record_invalid
      render text: 'Входные данные не верны'
    end

    def user_params
      params.require(:user).permit(:name)
    end



    def user_points_params
      params.permit(:increase, :decrease)
    end

  end
end
