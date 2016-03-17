class MlAuthorsController < ApplicationController
   layout "main"

   def index
     @authors = MlAuthor.search(params['user_input']) \
                                    .paginate(:page => params[:page], :per_page => 12) \
                                    .order('n_appeared desc')
     @users = User.all
   end

   def show
     #TODO: show ml author page
     @ml_author = MlAuthor.find(params[:id])
     @users = User.all
   end

   def edit
     #TODO: edit author details
   end

end
