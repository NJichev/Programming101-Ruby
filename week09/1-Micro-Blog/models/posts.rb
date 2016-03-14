class Posts
  @posts ||= {}
  @id ||= 1

  def self.id
    @id
  end

  def self.posts
    @posts
  end

  def posts
    self.class.posts
  end

  def self.<<(post)
    @posts[@id] = post
    @id += 1
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
end
