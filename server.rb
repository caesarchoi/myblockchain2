require 'sinatra'
require './block' # '/' 이후에 폴더명을 쓰면 그 폴더에 있는 파일을 가지고 옴

aaa = Blockchain.new  #Blockchain 클래스를 계속 바꿀 건데, 그 이름이 aaa

get '/' do 
	"블럭 리스트 입니다."
end

get '/mine' do
  aaa.mining.to_s
end

get '/transaction' do
  aaa.transaction
end