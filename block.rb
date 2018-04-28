class Blockchain

	def mining
		history =[] #nonce 값을 찾는데 들어간 내역을 리스트화 한다
		current_time = Time.now.to_f #1970.1.1부터 얼마나 걸렸는지를 알려줌 
		begin 
			nonce = rand(100000)
			history << nonce
			hashed = Digest::SHA256.hexdigest(nonce.to_s) #nonce 값을 문자열화 한 다음, SHA256 값으로 hash 함
		 end while hashed[0..3] != '0000' #	hashed의 값이 0000이 나올 때까지.
		#end while nonce != 0 #100000 중에 랜덤으로 숫자를 뽑는데, 0이 나올 때까지.
		#Time.now.to_f - current_time

		bb = []

		bb << Time.now.to_f - current_time
		bb << nonce
		
		#history.size : '0'을 찾는데 들어간 시도 횟수
	end

	def transaction
		"거래완료!"		
	end

end