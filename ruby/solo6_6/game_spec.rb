require_relative 'game'

describe Game do
  let (:game) { Game.new }

  it "initializes with default guess count" do
    expect(game.guess_count).to eq 0
  end
  
  it "initializes with is_over" do
    expect(game.is_over).to eq false
  end

  it "converts word to underscores" do
    expect(game.hide_word("sugar")).to eq "_____"
  end

  it "checks the secret word for the letter" do
    game.secret_word = "sugar"
    game.hide_word("sugar")
    expect(game.check_guess("s")).to eq "s"
  end
end

# How do I test with Driver Code/User interface?