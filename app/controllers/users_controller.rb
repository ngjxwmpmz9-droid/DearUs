class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @currentUserEntry = Entry.where(user_id: current_user.id)
    @userEntry = Entry.where(user_id: @user.id)
    if @user.id == current_user.id
      @msg = "他のユーザーとDMしてみよう！"
    else
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end

      if @isRoom != true
        @room = Room.new
        @entry = Entry.new
      end
    end
  end

  def update
    @user = User.find(params[:id])

    if params[:user][:music_url].present?
      musicurl = params[:user][:music_url].dup
      musicurl.slice!(0, 23) if musicurl.start_with?("https://music.apple.com") || musicurl.start_with?("https://embed.music.apple")
      params[:user][:music_url] = musicurl
    end

    if @user.update(user_params)
      redirect_to @user, notice: "更新しました"
    else
      render :edit
    end
  end

  private

   def user_params
    params.require(:user).permit(
      :name, :profile, :email, :music_url, :age, :bloodtype, 
      :zodiac, :bodyflame, :personalcolor, :hobby, :mbti, 
      :lovetype, :fashion, :encounter, :descript, :fashion_image, :place, :place_image, :place_url
    )
  end
end