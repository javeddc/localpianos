require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the PianosHelper. For example:
#
# describe PianosHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe PianosHelper, type: :helper do
  describe "capitalize all" do
    it "capitalizes each word in a string" do
      expect(helper.capitalize_all("259 wellesby street, south yarra")).to eq("259 Wellesby Street, South Yarra")
    end
  end
end
