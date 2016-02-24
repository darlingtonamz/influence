class Users::SessionsController < Devise::SessionsController < DeviseController
	def new
		super
		#@role = params[:role] 	
	end
end