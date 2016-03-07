class MoviesController < ApplicationController

    def index
      @movies = Movie.all
      if params[:search]
        search(params[:search])
      end
    end

    def search(param)
      # MM2: You could have rendered the index view instead of making a search view like this:
      # @movies = Movie.search(param).order("title")
      # if @movies.present?
      #   render :index
      # This way you avoid having an extra view
      @search_results = Movie.search(param).order("title")
      if @search_results.present?
        render :search
      else 
        flash[:notice] = "There are no posts containing the term(s) #{param}"
      end
    end

   def show
     @movie = Movie.find(params[:id])
   end

   def new
     @movie = Movie.new
   end

   def edit
     @movie = Movie.find(params[:id])
   end

   def create
     @movie = Movie.new(movie_params)

     if @movie.save
      redirect_to movies_path, notice: "#{@movie.title} was submitted successfully!"
     else
       render :new
     end
   end

   def update
     @movie = Movie.find(params[:id])

     if @movie.update_attributes(movie_params)
       redirect_to movie_path(@movie)
     else
       render :edit
     end
   end

   def destroy
     # MM3: There isn't any need to have @movie declared here since you aren't going to be using it in a view
     # Movie.find(params[:id]).destroy
     # redirect_to movies_path
     @movie = Movie.find(params[:id])
     @movie.destroy
     redirect_to movies_path
   end

   protected

   def movie_params
     params.require(:movie).permit(
       :title, :release_date, :director, :runtime_in_minutes, :image, :description
     )
   end
end
