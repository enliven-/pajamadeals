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

	    actions
	end

  collection_action :import_csv, :method => :post do
    # Do some CSV importing work here...
    redirect_to :action => :index, :notice => "CSV imported successfully!"
  end
end