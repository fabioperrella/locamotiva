ActiveAdmin.register User do

  filter :email
  filter :name
  filter :department
  filter :cpf

  index do
    column :name
    column :email
    column :shirt_size
    column :department
    column :role
    column "Actions" do |user|
      links = link_to I18n.t('active_admin.edit'), edit_admin_user_path(user), :class => "member_link edit_link"
      links += link_to I18n.t('active_admin.delete'), admin_user_path(user), :method => :delete, :confirm => I18n.t('active_admin.delete_confirmation'), :class => "member_link delete_link"
      links
    end
  end

  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :email
      f.input :shirt_size, :as => :select, :collection => AppConfig.shirt_sizes
      f.input :department
      f.input :cpf
      f.input :birth_date, :start_year => 1960, :include_blank => true
      f.input :role, :as => :select, :collection => ["user","admin"], :selected => "user", :include_blank => false
    end
    f.buttons
  end
end