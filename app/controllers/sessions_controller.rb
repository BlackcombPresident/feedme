class SessionsController < ApplicationController
	include SessionsHelper
  def new
  end

  def create
	  # TODO(dalegg): Add local user sessions based on this, use devise
	  auth_hash = request.env['omniauth.auth']

	  @authorization = Authorization.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
	  if @authorization
	  	  flash[:notice] = "Welcome back #{@authorization.user.name}!"
	  else
		  user = User.new :name => auth_hash["info"]["name"], :email => auth_hash["info"]["email"]
		  user.authorizations.build :provider => auth_hash["provider"], :uid => auth_hash["uid"]
		  user.save

		  flash[:notice] = "What it do, #{user.name}? You're all set."
	  end

	  session[:omniauth] = auth_hash.except('extra')
  end

  def failure
	  flash[:notice] = "Sorry, but you didn't allow access to FeedMe!"
  end

  def destroy
  		session[:user_id] = nil
  		flash[:notice] = "You've logged out!"
  end
end
