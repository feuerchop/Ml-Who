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
     @ml_author = MlAuthor.find(params[:id])
   end

   def update
      @ml_author = MlAuthor.find(params[:id])
      if @ml_author.update(ml_author_params)
         redirect_to @ml_author
      else
         render 'edit'
      end
   end

   def fetch
      # TODO: fetch profile from scholar.google.com

   end

   private
      def ml_author_params
         params.require(:ml_author).permit(:affiliation, :country, :email)
      end

end
