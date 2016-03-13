require 'rubygems'
require 'sinatra/base'
require_relative 'helpers/posts'

class BlogApp < Sinatra::Base
  before do
    @@posts ||= {}
    @@id ||= 0
  end

  get '/' do
    @posts = @@posts
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
    post = Post.new(name, content)
    @@id += 1
    @@posts[@@id] = post
    redirect "/#{@@id}"
  end

  get '/:id' do
    @post = @@posts[params[:id].to_i]
    puts @post

    if @post.nil?
      erb :deleted
    else
      erb :post
    end
  end

  delete '/:id' do
    @@posts[params[:id].to_i] = nil
  end
end

BlogApp.run!
