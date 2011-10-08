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
      f.input :shirt_size, :as => :select, :collection => ["Baby Look","P", "M", "G", "GG"]
      f.input :department
      f.input :cpf
      f.input :birth_date
      f.input :role, :as => :select, :collection => ["corredor","admin"], :selected => "corredor", :include_blank => false
      f.input :password, :as => :password, :input_html => {:autocomplete => "off"}
      f.input :password_confirmation, :as => :password
    end
    f.buttons
  end
end