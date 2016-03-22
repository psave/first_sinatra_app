# Homepage (Root path)
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
    title: params[:title],
    content: params[:content],
    author: params[:author]
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