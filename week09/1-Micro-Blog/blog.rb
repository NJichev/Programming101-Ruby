require 'rubygems'
require 'sinatra/base'
require_relative 'models/posts'

class BlogApp < Sinatra::Base
  before do
    @posts ||= Posts.posts
  end

  get '/' do
    if @posts.empty?
      'Welcome to our blog!'
    else
      erb :index
    end
  end

  get '/new/' do
    erb :new
  end

  post '/new/' do
    name = params[:name]
    content = params[:content]
    post = Posts::Post.new(name, content)
    id = Posts.id
    post.save
    redirect "/#{id}"
  end

  get '/:id' do
    @post = @posts[params[:id].to_i]

    if @post.nil?
      erb :deleted
    else
      erb :post
    end
  end

  delete '/:id' do
    @posts[params[:id].to_i] = nil
  end
end

BlogApp.run!
