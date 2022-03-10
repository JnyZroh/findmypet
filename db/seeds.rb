Report.destroy_all
Poster.destroy_all
Pet.destroy_all
Message.destroy_all
Chatroom.destroy_all
User.destroy_all

# loses a dog in Mile End
user1 = User.new(first_name: "Stephane", last_name: "LaFontaine", phone_number: "514-524-4524", email: "steph@lf.ca", password: "mypassword", address: '5101 Boulevard Saint-Laurent, Montreal, Quebec' )
file1 = URI.open('https://avatars.githubusercontent.com/u/37821714?v=4')
user1.photo.attach(io: file1, filename: 'dp.png', content_type: 'image/png')
user1.save!

# loses a Cat and finds David's dog in Plateau
user2 = User.new(first_name: "Louis-Olivier", last_name: "Pelletier", phone_number: "514-978-3544", email: "louis@olivier.ca", password: "mypassword", address: '994 Rue Rachel Est, Montreal, Quebec')
file2 = URI.open('https://ca.slack-edge.com/T02NE0241-UL76L0VK6-8fcb30413697-512')
user2.photo.attach(io: file2, filename: 'dp.png', content_type: 'image/png')
user2.save!

# nothing on the app yet
user3 = User.new(first_name: "David", last_name: "Attar", phone_number: "514-233-6053", email: "david@attar.ca", password: "mypassword", address: '5333 Avenue Casgrain, Montreal, Quebec')
file3 = URI.open('https://avatars.githubusercontent.com/u/93945915?v=4')
user3.photo.attach(io: file3, filename: 'dp.png', content_type: 'image/png')
user3.save!

# loses one dog
user4 = User.new(first_name: "Janaya", last_name: "Gripper", phone_number: "514-248-8113", email: "janaya@gripper.ca", password: "mypassword", address: '500 Boulevard Rosemont, Montreal, Quebec')
file4 = URI.open('https://avatars.githubusercontent.com/u/93945915?v=4')
user4.photo.attach(io: file4, filename: 'dp.png', content_type: 'image/png')
user4.save!

# loses one cat, reports two dogs. two cats, lives in TMR
user5 = User.new(first_name: "Daniel", last_name: "Bui", phone_number: "514-624-6153", email: "daniel@bui.ca", password: "mypassword", address: '60 Avenue Roosevelt, Mount Royal, Quebec')
file5 = URI.open('https://avatars.githubusercontent.com/u/93945915?v=4')
user5.photo.attach(io: file5, filename: 'dp.png', content_type: 'image/png')
user5.save!


pet1 = Pet.new(name: "Fluffy", species: "dog", breed: "Husky", color: "red", description: "Red Husky with white ears. She's large but very friendly. She should be pretty easy to catch.", user: user1)
pet1.photos.attach(io: File.open(Rails.root.join('app/assets/images/Pet1_Red-Husky.png')),
                  filename: 'Pet1_Red-Husky.png')
pet1.save!

pet2 = Pet.new(name: "Scotty", species: "cat", breed: "Scottish Fold", color: "multi-colored", description: "He's grey and brown, with bright green eyes and stripes. He's a housecat", user: user2)
pet2.photos.attach(io: File.open(Rails.root.join('app/assets/images/Pet2_Scottish-Fold.png')),
                  filename: 'Pet2_Scottish-Fold.png')
pet2.save!

pet3 = Pet.new(name: "Sesame", species: "dog", breed: "Mixed", color: "black", description: "Black with a white belly and brown eyes. He likes to hide in the bushes when he's afraid", user: user4)
pet3.photos.attach(io: File.open(Rails.root.join('app/assets/images/Pet3_Black-Lab.png')),
                  filename: 'Pet3_Black-Lab.png')
pet3.save!

pet4 = Pet.new(name: "Bully", species: "cat", breed: "Mixed", color: "gray", description: "Looks like a grey tiger. A little bit feisty!", user: user5)
pet4.photos.attach(io: File.open(Rails.root.join('app/assets/images/Pet4_Tiger.png')),
                  filename: 'Pet4_Tiger.png')
pet4.save!

poster1 = Poster.create!(date_missing: Date.new(2022,3,1), date_found: nil, found: false, comment: "Very friendly, if seen don't hesitate to catch it.", reward: 50, radius: 2, address: '5200 Avenue Casgrain, Montréal QC', pet: pet1, latitude: 45.5251471, longitude: -73.593808)
poster2 = Poster.create!(date_missing: Date.new(2022,3,2), date_found: nil, found: false, comment: "A bit nervous so please approach him slowly. Lure with food, if possible.", reward: 50, radius: 2, address: '8899 Rue Berri, Montreal, Quebec', pet: pet2, latitude: 45.5470079, longitude: -73.642134)
poster3 = Poster.create!(date_missing: Date.new(2022,3,2), date_found: nil, found: false, comment: "He still has his leash attached. It's a yellow and blue leash ", reward: 50, radius: 2, address: '60 Avenue Roosevelt, Mount Royal, Quebec', pet: pet3, latitude: 45.514244649999995, longitude: -73.64132092053217)
poster4 = Poster.create!(date_missing: Date.new(2022,3,3), date_found: nil, found: false, comment: "Friendly but timid. And he will bite but he's small so it won't hurt!", reward: 50, radius: 2, address: '158 Rue Saint-Viateur Ouest, Montréal, QC', pet: pet4, latitude: 45.523783, longitude: -73.6006065)

report1 = Report.new(date_spotted: Date.new(2022,3,3), address: "74 Avenue Fairmount O, Montréal, QC", species: "cat", description: "Looks like a red Husky with white ears.", report_type: "", user: user5, latitude: 45.5185492, longitude: -73.5992163)
report1.save!
report2 = Report.new(date_spotted: Date.new(2022,3,3), address: "5495 Avenue Victoria, Montreal, Quebec", species: "dog", description: "Looks like a red Husky with white ears.", report_type: nil, user: user5, latitude: 45.4917938, longitude: -73.6314602)
report2.save!
report3 = Report.new(date_spotted: Date.new(2022,3,3), address: "20 Rue Émile, Laval, Quebec", species: "dog", description: "Looks like a red Husky with white ears.", report_type: nil, user: user5, latitude: 45.555161002269614, longitude: -73.68406697844559)
report3.save!
report4 = Report.new(date_spotted: Date.new(2022,3,3), address: "1291 Avenue Van Horne, Montreal, Quebec", species: "cat", description: "Looks like a red Husky with white ears.", report_type: nil, user: user5, latitude: 45.5215822, longitude: -73.6141771)
report4.save!

# chatroom1 = Chatroom.create!(user_one: user1, user_two: user2);
