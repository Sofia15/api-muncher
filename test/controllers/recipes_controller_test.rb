require "test_helper"

describe RecipesController do
  describe "index" do
    it "succeeds with serach terms" do
      VCR.use_cassette("recipes") do
        get index_path(:q => "o")
        must_respond_with :success
      end
    end
  end
end
