class SessionsController < Devise::SessionsController

def new
  super
end

def create
  self.resource = warden.authenticate!(auth_options)
  unless resource.banned?
    set_flash_message(:notice, :signed_in) if is_navigational_format? 
  end
  sign_in(resource_name, resource)
  if !session[:return_to].blank?
    redirect_to session[:return_to]
    session[:return_to] = nil unless resource.banned?
  else
    respond_with resource, :location => member_path(resource) unless resource.banned?
  end
  if resource.banned?
    flash[:notice] = "you've been banned"
    sign_out resource
    redirect_to root_path
  end
end

protected



end