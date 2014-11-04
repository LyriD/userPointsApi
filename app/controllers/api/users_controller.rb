module Api
  class UsersController < Api::BaseController
    before_action :set_resource, only: [:change_rate, :user_data]
    rescue_from ActiveRecord::RecordNotFound, :with => :show_errors


    def change_rate
      if @user.update!(user_params)
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

    def show_errors
      render text: 'Пользователь с запрашиваемым id не найден'
    end

    def user_params
      params.permit(:increase, :decrease)
    end

    def query_params
      params.permit(:id)
    end
  end
end
