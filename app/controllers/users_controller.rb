class UsersController < ApplicationController
    before_action :set_user, only: %i[ show edit update destroy]

    def index
        @users = User.all
    end

    def show
    end

    def new
        @user = User.new(user_params)
    end

    def edit
    end

    def create
        @user = User.new(user_params)
        respond_to do |format|
            if @user.save
                # リクエストされるフォーマットがHTML形式の場合
                format.html { redirect_to user_url(@user), notice: '更新しました'}
                # リクエストされるフォーマットがjson形式の場合
                format.json { render :show, status: :ok, location: @user }
            else
                # リクエストされるフォーマットがHTML形式の場合
                format.html { render :edit, status: :unprocessable_entity }
                # リクエストされるフォーマットがjson形式の場合
                format.json { render json: @user.errors, status: :unprocessable_entity  }
            end
        end
    end

    def update
    end

    def destroy
        @user.destroy

        respond_to do |format|
            format.html { redirect_to users_urlm notice: '削除しました'}
            format.json { head :no_content }
        end
    end

    private
        def set_user
            @user = User.find(params[:id])
        end

        def user_params
            params.require(:user).permit(:user_id, :relation_user_id, :relation_cd,
                                        :user_name, :birthday, :hobby, :comment,
                                        :gazo, :update_date
                                    )
        end
end
