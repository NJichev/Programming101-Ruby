module Posts
  @posts ||= {}
  @id ||= 1

  extend self

  def id
    @id
  end

  # def self.all
  #   @posts
  # end

  def all
    # self.class.posts
    @posts
  end

  def <<(post)
    @posts[@id] = post
    @id += 1
  end
end

class Post
  attr_accessor :name, :content

  def initialize(name, content)
    @name = name
    @content = content
  end

  def save
    Posts << self
  end
end
