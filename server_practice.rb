require 'sinatra'
requre './block'

aaa = Blockchain.new

get '/'  do
	
end

get '/mine' do 
	aaa.mining.to_s
	
end
