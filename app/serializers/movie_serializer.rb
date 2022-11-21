class MovieSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :genre, :images_url

  has_one :genre

  def images_url
    array = []
    if object.images.attached?
      object.images.each do |image|
        array.append rails_blob_path(image, only_path: true)
      end
    end
    array
  end
end
