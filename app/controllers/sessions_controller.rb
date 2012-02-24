class SessionsController < Devise::SessionsController
  # GET /resource/sign_in
  def new    
    resource = build_resource
    clean_up_passwords(resource)
    # respond_with(resource, serialize_options(resource))
    render 'devise/sessions/new'
  end

  # POST /resource/sign_in
  # def create
  #   resource = warden.authenticate!(auth_options)
  #   set_flash_message(:notice, :signed_in) if is_navigational_format?
  #   sign_in(resource_name, resource)
  #   respond_with resource, :location => after_sign_in_path_for(resource)
  # end

  def create    
    resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#new")
    set_flash_message(:notice, :signed_in) if is_navigational_format?
    sign_in(resource_name, resource)
    redirect_path = resource.role?("admin") ? rails_admin_path : root_path
    respond_with resource, :location => redirect_path
  end
end