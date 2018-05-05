
class Blockchain

	def mining
		history =[]
		current-time = Time.now.to_f
		begin
			nonce = rand(1000000)
			history << nonce
		end
	end

end


