class Blockchain

	def initialize
		@chain =[] #'@'가 붙은 내용은 이하의 모든 클래스에 다 적용됨
	end

	def mining
		history =[] #nonce 값을 찾는데 들어간 내역을 리스트화 한다
		current_time = Time.now.to_f #1970.1.1부터 얼마나 걸렸는지를 알려줌 
		begin 
			nonce = rand(100000)
			history << nonce
			hashed = Digest::SHA256.hexdigest(nonce.to_s) #nonce 값을 문자열화 한 다음, SHA256 값으로 hash 함
		 end while hashed[0..3] != '0000'#	hashed의 값이 0000이 나올 때까지.
		#end while nonce != 0 #100000 중에 랜덤으로 숫자를 뽑는데, 0이 나올 때까지.
		#Time.now.to_f - current_time
		nonce

		#bb = [] #시간과 nonce 값을 동시에 나타내주는 리스트를 만듦

		#bb << Time.now.to_f - current_time
		#bb << nonce
		#history.size : '0'을 찾는데 들어간 시도 횟수

		block = {
			"index" => @chain.size + 1,
			"time" => Time.now,
			"nonce" => nonce,
			"previous_adress" => Digest::SHA256.hexdigest(last_block.to_s)
		}

		@chain << block
		block
	end

	def last_block
		@chain[-1] #체인에 있는 마지막 블럭을 가지고 온다.
	end

	def all_blocks
		@chain		
	end

end