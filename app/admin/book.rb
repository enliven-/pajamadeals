ActiveAdmin.register Book do
	index do
	    selectable_column
	    id_column
	    column :title
	    column :isbn
	    column :author
	    column :publisher
	    column :edition
	    column :released_year
	    column :retail_price
	    column :university
	    column :image

	    actions
	end
end