class CatFactAPI
  BASE_URL = "https://cat-fact.herokuapp.com"

  def get_cat_facts
    cat_facts = HTTParty.get(BASE_URL + "/facts")
    # iterate through the array of cat facts in the response and build a CatFact object (instance) with each hash

    cat_facts["all"].each do |cat_fact_hash|
      CatFact.new(cat_fact_hash["text"], cat_fact_hash["upvotes"])
    end

  end
end
