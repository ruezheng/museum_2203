class Museum
	attr_reader :name,
							:exhibits,
							:patrons

	def initialize(name)
		@name = name
		@exhibits = []
		@patrons = []
	end

	def add_exhibit(exhibit)
		@exhibits << exhibit
	end

	def recommend_exhibits(patron)
		exhibits_to_recommend = []
		@exhibits.each do |exhibit|
			if patron.interests.include?(exhibit.name)
				exhibits_to_recommend << exhibit
			end
		end
		return exhibits_to_recommend
	end

	def admit(patron)
		@patrons << patron
	end

	def patrons_by_exhibit_interest
		patrons_by_exhibit_interest_hash = {}
		@exhibits.each do |exhibit|
			patrons_by_exhibit_interest_hash[exhibit] = patrons_interested_in(exhibit)
		end
		patrons_by_exhibit_interest_hash
	end

	def patrons_interested_in(exhibit)
		@patrons.find_all {|patron| patron.interests.include?(exhibit.name)}
	end

	def ticket_lottery_contestants(exhibit)
		patrons_interested_in(exhibit).select {|patron| patron.spending_money < exhibit.cost}
	end

	def draw_lottery_winner(exhibit)
		if ticket_lottery_contestants(exhibit) == []
			nil
		else ticket_lottery_contestants(exhibit).sample.name
		end
	end
end
