class BooksController < ApplicationController
  def search
    results = Book.select(:title, :author, :publisher, :image)
    .search(params[:keywords], fields: ["title^10", :author],
            operator: 'or' )
    bucket = []
    results.each do |b|
      bucket << { book: b, image_url: b.image.thumb.url }
    end
    render json: bucket
  end
end
