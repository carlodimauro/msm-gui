class MoviesController < ApplicationController
  def index
    matching_movies = Movie.all
    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movie_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_movies = Movie.where({ :id => the_id })
    @the_movie = matching_movies.at(0)

    render({ :template => "movie_templates/show" })
  end

  def create
  # retrieve records & create new record in tbl
    m = Movie.new
    m.title = params.fetch("the_title")
    m.year = params.fetch("the_year")
    m.duration = params.fetch("the_duration")
    m.description = params.fetch("the_description")
    m.image = params.fetch("the_image")
    m.director_id = params.fetch("the_director_id")
  
    #save

  m.save

  #redirect back to movies url
  redirect_to("/movies")
  end

  def destroy
  d_id = params.fetch("destroy_id")
  matching_record = Movie.where({:id => d_id}).first

  matching_record.destroy

  redirect_to("/movies")
  end

  def update
    
    update_m_id = params.fetch("the_id")
    matching_record = Movie.where({:id=>update_m_id}).first

    matching_record.title = params.fetch("the_title")
    matching_record.year = params.fetch("the_year")
    matching_record.duration = params.fetch("the_duration")
    matching_record.description = params.fetch("the_description")
    matching_record.image = params.fetch("the_image")
    matching_record.director_id = params.fetch("the_director_id")
  
    #save

    matching_record.save

    redirect_to("/movies/#{update_m_id}")
  end

end
