class UsersController < ApplicationController

   def index
      @users = User.all
   end

   def new
      @user = User.new
   end

   def show
      @user = User.find(params['id'])
   end

   def edit
   end

   def update
   end

   def create
      uploaded_io = params[:user][:picture]
      pic_path = Rails.root.join('public', 'uploads', uploaded_io.original_filename)
      File.open(pic_path, 'wb') do |file|
        file.write(uploaded_io.read)
      end
      # byebug
      params[:user][:pic_path] = '/uploads/' + uploaded_io.original_filename
      @user = User.new(user_params)
      if @user.save
         redirect_to users_path
      else
         render 'new'
      end
   end

   def destroy
   end

   private
      def user_params
         params.require(:user).permit(:name, :age, :gender, :email, :address, :phone, :pic_path)
      end

end
