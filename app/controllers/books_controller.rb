class BooksController < ApplicationController
  def search
    results = Book.search(params[:keywords], fields: ["title^10", :author],
                          operator: 'or', page: params[:page], per_page: 20)
    bucket = []
    results.each do |b|
      bucket << { book: b, image_url: b.image.thumb.url }
    end
    p bucket
    render json: bucket
  end
end
