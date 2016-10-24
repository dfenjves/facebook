require 'pry'

class User
  @@all_users = []
  attr_accessor :name, :username, :password, :friends, :picture, :posts

# create users
  def initialize(name, username, password)
    if(@@all_users.detect{|x| x==username})
      puts "Username already exits"
    else
      @username = username
      @name = name
      @password = password
      @posts = []
      @pictures = []
      @friends = []
      @@all_users << self
    end
  end

# add messages to an array
  def post(message)
    posts << message
  end

# add friends to an array
  def add_friend(friend)
    self.friends << friend
    friend.friends << self
  end

  # def receive_friend(friend)
  #   self.add_friend(friend)
  # end

# add pictures to an array
  def add_picture(picture)
    pictures << picture
  end

  def show_feed
    friends.each do |f|
      puts "#{f.name}: #{f.posts.last}"
    end
  end

  def view_own_posts
    posts.each {|b| puts b}
  end

  def view_friends
    friends.each {|b| puts b}
  end

  def self.all_users
    @@all_users
  end

end

danny = User.new("danny f", "dfenjves", "12345")
saber = User.new("saber k", "saber", "12345")
aaron = User.new("aaron g", "ag", "12345")
joe = User.new("joe p", "joe", "12345")
helen = User.new("helen h", "helen", "12345")
juliet = User.new("Juliet g", "jjjulie", "12345")
danny.post("hello world")
danny.post("hello world")
danny.post("Game of Thrones")
saber.post("hello test")
saber.post("WestWorld")
aaron.post("one more")
aaron.post("Arrested Development")
helen.post("Silicon Valley")
juliet.post("Jeopardy")
danny.add_friend(saber)
aaron.add_friend(saber)
joe.add_friend(saber)
helen.add_friend(saber)
juliet.add_friend(saber)
helen.add_friend(aaron)
juliet.add_friend(danny)

binding.pry
