# Add 50 random airports.
airport_names = Array.new(50).map{ (0...3).map { (65 + rand(26)).chr }.join }

airport_names.each do |name|
	Airport.create!(
			name: name
		)
end