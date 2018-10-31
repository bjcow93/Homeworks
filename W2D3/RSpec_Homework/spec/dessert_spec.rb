require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "Boyardee") }
  let(:test_brownie) {Dessert.new("fudge", 10, chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(test_brownie.type).to eq("fudge")
    end

    it "sets a quantity" do
      expect(test_brownie.quantity).to eq(10)
    end

    it "starts ingredients as an empty array" do
      expect(test_brownie.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect {Dessert.new("cake", "ten", chef)}.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      test_brownie.add_ingredient("sprinkles")
      expect(test_brownie.ingredients).to include("sprinkles")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ["fudge", "eggs", "flour", "sugar", "butter"]
      ingredients.each do |ingredient|
        test_brownie.add_ingredient(ingredient)
      end

      expect(test_brownie.ingredients).to eq(ingredients)
      test_brownie.mix!
      expect(test_brownie.ingredients).not_to eq(ingredients)
      expect(test_brownie.ingredients.sort).to eq(ingredients.sort)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      test_brownie.eat(2)
      expect(test_brownie.quantity).to eq(8)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { test_brownie.eat(20)}.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Boyardee")
      expect(test_brownie.serve).to eq("Chef Boyardee has made 10 fudges!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(test_brownie)
      test_brownie.make_more
    end
  end
end
