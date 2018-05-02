require 'securerandom'

class Blockchain

	def initialize
		@chain =[] #'@'가 붙은 내용은 이하의 모든 클래스에 다 적용됨 / chain 값을 리스트화 한다.
		@trans =[] 
		@wallet = {} 
	end

	def show show_all_wallet
		@wallet
	end

	#

	def make_a_new_wallet
		address = SecureRandom.uuid.gsub("-","") #SecureRandom 대문자, 소문자 주의!!!, gusb: ("앞내용", "뒷내용") 으로 대체한다.
		@wallet[address] = 1000 #생성된 wallet에 1000코인을 넣어라.
		@wallet
	end

	def make_a_trans(s,r,a) #
		if @wallet[s].nil?
			"보내는 주소가 잘못되었습니다."
		elsif @wallet[r].nil?
			"받는 주소가 잘못되었습니다."
		elsif @wallet[s].to_f < a.to_f #to_f : 유리수로 바꾸어 주는 명령어
			"코인이 부족합니다"
		else

		@wallet[s] = @wallet[s].to_f - a.to_f
		@wallet[r] = @wallet[r].to_f + a.to_f

		trans = {
			"보낸사람" => s, #sender는 s
			"받은사람" => r, #receiver는 r
			"코인" => a #amount는 a
		}
		@trans << trans
		@trans #end 위의 값은 출력
		# @trans []
	end
	end

	def mining
		history =[] #nonce 값을 찾는데 들어간 내역을 리스트화 한다
		current_time = Time.now.to_f #1970.1.1부터 얼마나 걸렸는지를 마이크로세컨드 단위로 알려줌
		begin 
			nonce = rand(100000)
			history << nonce
			hashed = Digest::SHA256.hexdigest(nonce.to_s) #nonce 값을 문자열화 한 다음, SHA256 값으로 hash 함
		end while hashed[0..3] != "0000"   

		#hashed의 값이 0000이 나올 때까지.
		#end while nonce != 0 #100000 중에 랜덤으로 숫자를 뽑는데, 0이 나올 때까지.
		#Time.now.to_f - current_time

		#bb = [] #시간과 nonce 값을 동시에 나타내주는 리스트를 만듦

		#bb << Time.now.to_f - current_time
		#bb << nonce
		#history.size : '0'을 찾는데 들어간 시도 횟수

		block = {
			"index" => @chain.size + 1,
			"time" => Time.now,
			"nonce" => nonce,
			"previous_adress" => Digest::SHA256.hexdigest(last_block.to_s), #이전의 블록을 문자열로 바꿔서 암호화를 시킨다.
			"transactions" => @trans
		}
		 # {} --> 안에 들어가는 내용을 해시 데이터화 한다.
		@chain << block
	end

	def last_block
		@chain[-1] #체인에 있는 마지막 블럭을 가지고 온다.
	end

	def all_blocks
		@chain		
	end

end