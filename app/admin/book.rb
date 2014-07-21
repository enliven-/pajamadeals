ActiveAdmin.register Book do

  index do
    selectable_column
    id_column

    column :created_at
    actions
  end

  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :title, :description, :publisher, :author, :isbn, :edition,
    :released_year, :university, :image, :department, :semester, :pages
end
