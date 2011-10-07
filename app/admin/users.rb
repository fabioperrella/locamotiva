ActiveAdmin.register User do
  index do
    column :name
    column :email
    column :shirt_size
    column :department
  end

  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :email
      f.input :shirt_size, :as => :select, :collection => ["P", "M", "G"]
      f.input :department
      f.input :cpf
      f.input :born_at
    end
    f.buttons
  end
end