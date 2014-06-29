class BooksController < ApplicationController
	def search
		search = Sunspot.search(Book) do
			fulltext params[:search] do
				fields(:title)
			end
		end
		@books = search.results
	end
end
