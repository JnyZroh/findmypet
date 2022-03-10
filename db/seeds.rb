Report.destroy_all
Poster.destroy_all
Pet.destroy_all
Message.destroy_all
Chatroom.destroy_all
User.destroy_all

user1 = User.new(first_name: "Stephane", last_name: "LaFontaine", phone_number: "514-123-4567", email: "steph@lf.ca", password: "mypassword", address: '5333 Avenue Casgrain Suite 102, Montréal QC' )
file1 = URI.open('https://avatars.githubusercontent.com/u/37821714?v=4')
user1.photo.attach(io: file1, filename: 'dp.png', content_type: 'image/png')
user1.save!

user2 = User.new(first_name: "Louis-Olivier", last_name: "Pelletier", phone_number: "514-987-6543", email: "louis@olivier.ca", password: "mypassword", address: '5333 Avenue Casgrain Suite 102, Montréal QC')
file2 = URI.open('https://ca.slack-edge.com/T02NE0241-UL76L0VK6-8fcb30413697-512')
user2.photo.attach(io: file2, filename: 'dp.png', content_type: 'image/png')
user2.save!

user3 = User.new(first_name: "David", last_name: "Attar", phone_number: "514-233-6553", email: "david@attar.ca", password: "mypassword", address: '5333 Avenue Casgrain Suite 102, Montréal QC')
file3 = URI.open('https://avatars.githubusercontent.com/u/93945915?v=4')
user3.photo.attach(io: file3, filename: 'dp.png', content_type: 'image/png')
user3.save!

pet1 = Pet.new(name: "Fluffy", species: "dog", breed: "Husky", color: "red", description: "Red Husky with white ears", user: user1)
pet1.photos.attach(io: File.open(Rails.root.join('app/assets/images/Pet1_Red-Husky.png')),
                  filename: 'Pet1_Red-Husky.png')
pet1.save!

pet2 = Pet.new(name: "Scotty", species: "cat", breed: "Scottish Fold", color: "multi-colored", description: "He's grey and brown, with bright green eyes and stripes. He's a housecat", user: user2)
pet2.photos.attach(io: File.open(Rails.root.join('app/assets/images/Pet2_Scottish-Fold.png')),
                  filename: 'Pet2_Scottish-Fold.png')
pet2.save!

pet3 = Pet.new(name: "Sesame", species: "dog", breed: "Mixed", color: "black", description: "Black with a white belly and brown eyes", user: user2)
pet3.photos.attach(io: File.open(Rails.root.join('app/assets/images/Pet3_Black-Lab.png')),
                  filename: 'Pet3_Black-Lab.png')
pet3.save!

pet4 = Pet.new(name: "Bully", species: "cat", breed: "Mixed", color: "gray", description: "Looks like a grey tiger. A little bit feisty!", user: user2)
pet4.photos.attach(io: File.open(Rails.root.join('app/assets/images/Pet4_Tiger.png')),
                  filename: 'Pet4_Tiger.png')
pet4.save!

poster1 = Poster.create!(date_missing: Date.new(2022,3,1), date_found: nil, found: false, comment: "Very friendly, if seen don't hesitate to catch it.", reward: 50, radius: 2, address: '5200 Avenue Casgrain, Montréal QC', pet: pet1, latitude: 45.5251471, longitude: -73.593808)
poster2 = Poster.create!(date_missing: Date.new(2022,3,2), date_found: nil, found: false, comment: "A bit nervous so please approach him slowly. Lure with food, if possible.", reward: 50, radius: 2, address: '23 Rue Bernard O, Montréal, QC', pet: pet2, latitude: 45.4382291, longitude: -73.6277107 )
poster3 = Poster.create!(date_missing: Date.new(2022,3,2), date_found: nil, found: false, comment: "He still has his leash attached. It's a yellow and blue leash ", reward: 50, radius: 2, address: '74 Avenue Fairmount O, Montréal, QC', pet: pet3, latitude: 45.5185492, longitude: -73.5992163 )
poster4 = Poster.create!(date_missing: Date.new(2022,3,3), date_found: nil, found: false, comment: "Friendly but timid. And he will bite but he's small so it won't hurt!", reward: 50, radius: 2, address: '158 Rue Saint-Viateur Ouest, Montréal, QC', pet: pet4, latitude: 45.523783, longitude: -73.6006065 )

report1 = Report.create!(date_spotted: Date.new(2022,3,3), address: "15 Rue Saint-Viateur Est, Montreal QC", species: "dog", description: "Looks like a red Husky with white ears.", report_type: nil, user: user2, latitude: 45.52619733557856, longitude: -73.59881346575006)

chatroom1 = Chatroom.create!(user_one: user1, user_two: user2);
