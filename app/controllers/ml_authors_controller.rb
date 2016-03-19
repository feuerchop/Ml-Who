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

   def pull
      # TODO: fetch profile from scholar.google.com
      @ml_author = MlAuthor.find(params[:id])
      # ml_author_gsprofile = gs_pull(@ml_author.name)
      # @ml_author.affiliation = ml_author_gsprofile
      # @ml_author.save
      # after retrieving all info of the author, refresh the show view
      @users = User.all
      render 'show', object: [@ml_author, @users]
   end

   private
      def ml_author_params
         params.require(:ml_author).permit(:affiliation, :country, :email)
      end

      def gs_pull(author_name)
         # TODO: retrieve gs profile
      end

end
