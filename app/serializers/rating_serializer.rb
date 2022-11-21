class RatingSerializer < ActiveModel::Serializer
  attributes :id, :grade, :comment, :movie

  def movie
    {id: object.movie.id, name: object.movie.name}
  end
end
