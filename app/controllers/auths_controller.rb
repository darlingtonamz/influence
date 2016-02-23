class AuthsController < ApplicationController
	def instagram
		response = HTTParty.get('https://api.instagram.com/oauth/authorize/?client_id=fdaf0607c4c04ac5b0dd5c2e30f56fd3&redirect_uri=http://localhost/ambassadors&response_type=json')
		binding.pry
		puts response
		puts
	end
end
