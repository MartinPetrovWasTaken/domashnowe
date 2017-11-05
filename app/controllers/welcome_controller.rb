require 'nokogiri'

$uid = 0

def getid()
	$uid += 1
	return $uid
end

class WelcomeController < ApplicationController
	protect_from_forgery unless: -> {request.format.json?}

	def index
	end

	def read
		uid = params[:id]
		a = Danni.find(uid.to_i)
		b = a.send(:text)
		render plain: b
		Danni.destroy(uid.to_i)
	end

	def put
		text = params[:text]
		num = getid()
		Danni.create(:id => num.to_i, :text => text)
		render plain: num
	end
	
	def curl
		if request.headers["Content-Type"] == "application/json"
			text = params[:message]
			id = getid()
			value = {"url" => "https://dom-mitov-msg.herokuapp.com/messages/ + id.to_s"}
			Danni.create(:id => id, :text => text)
			render json: value
		elsif request.headers["Content-Type"] == "text/xml"
			text = Nokogiri::XML(request.body.read).content
			id = getid()
			value = {"url" => "https://dom-mitov-msg.herokuapp.com/messages/ + id.to_s"}
			Danni.create(:id => id, :text => text)
			render xml: value
		end
	end

end
