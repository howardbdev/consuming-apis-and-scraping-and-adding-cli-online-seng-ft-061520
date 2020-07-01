class CatFact
  attr_accessor :text, :upvotes

  @@all = []

  def initialize(text, upvotes)
    @text = text
    @upvotes = upvotes
    @@all << self
  end

  def self.all
    @@all
  end

  def self.top_ten
    all.sort {|a, b| b.upvotes <=> a.upvotes }[0..9]
  end

end
