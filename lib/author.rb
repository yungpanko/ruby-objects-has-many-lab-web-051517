require 'pry'

class Author
  attr_accessor :name, :posts

  @@all_authors = []
  @@post_count = 0

  def initialize(name)
    @name = name
    @posts = []
    @@all_authors << self
  end

  def add_post(post)
    @posts << post
    post.author = self
  end

  def add_post_by_title(title)
    post = Post.new(title)
    post.author = self
    @posts << post
  end

  def self.all
    @@all_authors
  end

  def self.post_count
    self.all.each do |author|
      unless author.posts[0] == nil
        @@post_count += 1
      end
    end
    @@post_count
  end

end
