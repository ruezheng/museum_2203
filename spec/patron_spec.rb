require './lib/exhibit'
require './lib/patron'
require 'rspec'

describe Patron do
	let(:patron_1) { Patron.new("Bob", 20) }
	let(:patron_2) { Patron.new("Sally", 20) }

	describe "Iteration 1" do
		it "exists" do
			expect(patron_1).to be_a Patron
		end

		it "has attributes" do
			expect(patron_1.name).to eq "Bob"
			expect(patron_1.spending_money).to eq 20
		end

		it "starts with no interests" do
			expect(patron_1.interests).to eq []
		end
	end

	describe "Iteration 2" do
		before :each do
			patron_1.add_interest("Dead Sea Scrolls")
			patron_1.add_interest("Gems and Minerals")
			patron_2.add_interest("IMAX")
		end

		it "can add interests" do
			expect(patron_1.interests).to eq ["Dead Sea Scrolls", "Gems and Minerals"]
		end
	end
end
