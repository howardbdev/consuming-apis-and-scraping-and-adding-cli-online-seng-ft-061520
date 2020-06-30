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

  def self.prints_all_cat_facts
    # this is a violation of SRP!
    all.each do |cat_fact|
      puts ""
      puts cat_fact.text
      puts ""
    end
    nil
  end

end
