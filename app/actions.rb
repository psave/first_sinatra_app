# Homepage (Root path)
# Time.zone = 'Pacific Time (US & Canada)'
# ActiveRecord::Base.default_timezone = :pacfic

get '/' do
  erb :index
end

get '/messages' do 
  @messages = Message.all
  erb :messages
end

get '/new' do
  erb :new
end

post '/messages' do
  @message = Message.new(
    # title: params[:title],
    content: params[:content],
    author: params[:author],
    url: params[:url]
    )
  if @message.save
    redirect '/messages'
  else
    erb :new
  end
end

get '/messages/:id' do
  @message = Message.find params[:id]
  erb :'show'
end

get '/show/:userid' do
  @messages = Message.where(:author => params[:userid])
  erb :authormessages
end
