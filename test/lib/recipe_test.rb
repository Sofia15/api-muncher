require 'test_helper'

describe Recipe do
  describe "get_recipes" do
    it "Can get recipes" do
      VCR.use_cassette("recipes") do
        recipes = Recipe.get_recipes('o', 0)
        recipes.count.must_equal 10
      end
    end
    it "Fails to get recipes for a bogus search term" do
      VCR.use_cassette("recipes") do
        recipes = Recipe.get_recipes('kjhgkjh', 0)
        recipes.count.must_equal 0
      end
    end
      it "Fails to get recipes for a blank search term" do
        VCR.use_cassette("recipes") do
          recipes = Recipe.get_recipes('', 0)
          recipes.count.must_equal 0
        end
    end
  end

end
