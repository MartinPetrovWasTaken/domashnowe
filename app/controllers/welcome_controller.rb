$uid = 0

def getid()
	$uid += 1
	return $uid
end

class WelcomeController < ApplicationController

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

end
