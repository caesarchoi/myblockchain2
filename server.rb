require 'sinatra'
require './block' # '/' 이후에 폴더명을 쓰면 그 폴더에 있는 파일을 가지고 옴

aaa = Blockchain.new  #Blockchain 클래스를 계속 바꿀 건데, 그 이름이 aaa

get '/' do 

	message = "<center>"
	aaa.all_blocks.each do |b|
		message << "번호:" + b['index'].to_s + "<br>"
		message << "시간:" + b['time'].to_s + "<br>" # br: 한 줄 띄우기
		message << "Nonce:" + b['nonce'].to_s + "<br>"
		message << "앞 주소:" + b['previous_adress'].to_s + "<br>"
		message << "내 주소:" + Digest::SHA256.hexdigest(b.to_s) + "<br>"
		message << "Transactions:"  + b['transactions'].to_s + "<br>"
		message << "<hr>" # "<hr>" : 구분선 주기 
end

message

end

get '/mine' do
  aaa.mining.to_s #to_s : 숫자를 문자로 바꾸어주는 명령어
end

get '/trans' do
	aaa.make_a_trans(params["sender"], params["recv"], params["amount"]).to_s
  #params["sender"] + params["recv"] + params["amount"] 코인을 보내는 사람/받는 사람/코인의 양 값을 읽어라. 
end