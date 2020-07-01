class CLI
  attr_accessor :input
  # Some good general rules to keep in mind...
  # Make sure the program doesn't crash, even with bad input.
  # The program should exit ONLY when the user has explicitly chosen to do so.
  def initialize
    @input = ""
  end

  def run
    # welcome prompt
    welcome
    # get all the things -- or enough things to get started
    CatFactAPI.new.get_cat_facts
    CatFact.top_ten
    # or get enough user input to ^^
    # show some kind of menu
    main_menu
    # allow the user to interact with that menu -- looking at details of the things
    # show a submenu
    # end
  end

  def welcome
    puts "Welcome to Cat Facts"
  end

  def main_menu
    # functionality
    # show the most upvoted
    # input a number to show a particular fact
    # show random facts
    # maybe go page by page - showing x facts per page

    get_input

    while input != 'q' do
      if input.length > 1
        puts "Invalid choice.  Please try again."
      elsif input == 'm'
        # run most upvoted - get the top 10
        print_top_ten
      elsif input == 'a'
        print_all_cat_facts
      end
      get_input
    end
  end

  def get_input
    puts "What do you want to do?"
    puts "Enter 'q' to quit"
    puts "Enter 'm' to see most upvoted"
    puts "Enter 'a' to see all"
    puts "Enter 'r' to see random fact"
    self.input = gets.chomp
  end

  def print_all_cat_facts
    CatFact.all.each do |cat_fact|
      puts ""
      puts cat_fact.text
      puts "this fact had #{cat_fact.upvotes} upvotes"
      puts ""
    end
    nil
  end

  # This is not DRY!  it's too much like #print_all_cat_facts!  How could we DRY it up?
  def print_top_ten
    CatFact.top_ten.each do |cat_fact|
      puts ""
      puts cat_fact.text
      puts "this fact had #{cat_fact.upvotes} upvotes"
      puts ""
    end
    nil
  end
end
