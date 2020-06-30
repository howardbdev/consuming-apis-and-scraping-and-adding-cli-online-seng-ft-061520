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

end
