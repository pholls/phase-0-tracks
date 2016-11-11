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

end