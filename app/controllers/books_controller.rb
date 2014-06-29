class BooksController < ApplicationController
	def search
		search = Sunspot.search(Book) do
      p params[:keywords]
			fulltext params[:keywords] do
				fields(:title)
			end
		end
    bucket = []
    search.results.each do |b|
      bucket << { book: b, image_url: b.image.thumb.url }
    end
    render json: bucket
	end
end
