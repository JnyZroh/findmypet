user1 = User.create!(first_name: "Stephane", last_name: "LaFontaine", phone_number: "514-123-4567", email: "steph@lf.ca", password: "mypassword", address: '5333 Avenue Casgrain Suite 102, Montréal QC' )
#file1 = URI.open('https://avatars.githubusercontent.com/u/37821714?v=4')
#user1.photo.attach(io: file1, filename: 'dp.png', content_type: 'image/png')

user2 = User.create!(first_name: "Louis-Olivier", last_name: "Pelletier", phone_number: "514-987-6543", email: "louis@olivier.ca", password: "mypassword", address: '5333 Avenue Casgrain Suite 102, Montréal QC')
#file2 = URI.open('https://ca.slack-edge.com/T02NE0241-UL76L0VK6-8fcb30413697-512')
#user2.photo.attach(io: file2, filename: 'dp.png', content_type: 'image/png')

pet1 = Pet.create!(name: "Fluffy", species: "dog", breed: "Husky", color: "red", description: "Red Husky with white ears", user: user1)

poster1 = Poster.create!(date_missing: Date.new(2022,3,1), date_found: nil, found: false, comment: "Very friendly, if seen don't hesitate to catch it.", reward: 50, radius: 2, address: '5333 Avenue Casgrain Suite 102, Montréal QC', pet: pet1 )

report1 = Report.create!(date_spotted: Date.new(2022,3,3), address: "15 Saint-viateur Rue E, Montral QC H2T 1A5", species: "dog", description: "Looks like a red Husky with white ears.", type: nil)
