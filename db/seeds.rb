# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
h = Home.create title: "Framgia", sologan: "make it awesome", description: "ARE YOU READY TO MAKE IT AWESOME WITH US?", language: :en
i = Image.new target_id: 1, target_type: "Home"
i.image.store!(File.open(File.join(Rails.root, '/public/uploads/default/users/18.jpg')))
i.save

Category.create(name: "Website", target_type: 2)
Category.create(name: "Mobile", target_type: 2)
Category.create(name: "Embedded", target_type: 2)
Category.create(name: "Game", target_type: 2)
Category.create(name: "Multi Platform", target_type: 2)
Category.create(name: "Other", target_type: 2)

Technique.create(skill: "Ruby on Rails", category_id: 1)
Technique.create(skill: "PHP", category_id: 1)
Technique.create(skill: "Java-Web", category_id: 1)
Technique.create(skill: "Android", category_id: 2)
Technique.create(skill: "Pythod", category_id: 1)
Technique.create(skill: "Javascript", category_id: 1)
Technique.create(skill: "GitHub", category_id: 6)
Technique.create(skill: "Design Pattern", category_id: 6)
Technique.create(skill: "SQL", category_id: 6)
Technique.create(skill: "Design", category_id: 6)
Technique.create(skill: "IOS", category_id: 2)
Technique.create(skill: "Unity", category_id: 4)
Technique.create(skill: ".Net", category_id: 4)
Technique.create(skill: "Java", category_id: 5)
Technique.create(skill: "Assembly", category_id: 3)
Technique.create(skill: "C", category_id: 3)

c1 = Certification.create(description: "For though result and talent add are parish valley.",
  name: "Agile")
c1.image.store!(File.open(File.join(Rails.root, '/public/uploads/default/certifications/certification_agile.jpg')))
c1.save
c2 = Certification.create(description: "Cisco Certified Network Associate",
  name: "CCNA")
c2.image.store!(File.open(File.join(Rails.root, '/public/uploads/default/certifications/certification_ccna.jpg')))
c2.save

c3 = Certification.create(description: "Certified Information Systems Security Professional",
  name: "CISSP")
c3.image.store!(File.open(File.join(Rails.root, '/public/uploads/default/certifications/certification_CISSP.jpg')))
c3.save

c4 = Certification.create(description: "Microsoft Certified Systems Engineer ",
  name: "MCSE")
c4.image.store!(File.open(File.join(Rails.root, '/public/uploads/default/certifications/certification_MCSE.jpg')))
c4.save

c5 = Certification.create(description: "FTimed voice share led his widen noisy young",
  name: "CompTIA A+")
c5.image.store!(File.open(File.join(Rails.root, '/public/uploads/default/certifications/certification_comtiaA+.jpg')))
c5.save

c6 = Certification.create(description: "Oracle certification tracks",
  name: "Oracle")
c6.image.store!(File.open(File.join(Rails.root, '/public/uploads/default/certifications/certification_oracle.jpg')))
c6.save

c7 = Certification.create(description: "IBM certifications",
  name: "IBM Corporation")
c7.image.store!(File.open(File.join(Rails.root, '/public/uploads/default/certifications/certification_IBM Corporation.jpg')))
c7.save

u = User.create(name: "Nguyen Ngoc Thinh", email:"admin@gmail.com", user_name: "Admin",
  password: "12345678", position: "PM",
  biography: "Rooms oh fully taken by worse do.Points afraid but may end law lasted.
   Was out laughter raptures returned outweigh.", phone: "01212129827")

u.add_role :admin

5.times do |e|
  TargetTechnique.create!(target_id: e+1, target_type: "User", technique_id: "#{e+1}")
  u.certificate_users.create!(user_id: e+1, certification_id: "#{e+1}")
end

30.times do |i|
  name  = "member #{i+1}"
  email = "user#{i+1}@gmail.com"
  user_name = "Username #{i+1}"
  password = "12345678"
  position = "Developer"
  biography = "Rooms oh fully taken by worse do. Points afraid but may end law lasted.
  Was out laughter raptures returned outweigh."
  phone = "01212129827"

  u = User.create!(name:  name, email: email, password: password, position: position,
    biography: biography, user_name: user_name, phone: phone)
  u.avatar.store!(File.open(File.join(Rails.root, '/public/uploads/default/users/'+"#{i+1}"+'.jpg')))
  u.save

  5.times do |e|
    TargetTechnique.create!(target_id: u.id, target_type: "User", technique_id: "#{e+1}")
    u.certificate_users.create!(user_id: u.id, certification_id: "#{e+1}")
  end
end

Project.create!(name: "wsm", url: "http://wsm.framgia.vn/", description: "Managing timesheet, leave,... in a working space", core_features: "Ruby", realease_note: "Waiting update", git_repository: "www.github.com", server_information: "Mysql", platform: "Web", pm_url: "wwww.link.com", branch: 1)
p = Project.last
p.images.create
p.category_id = 1
p.save

Project.create!(name: "FPoll", url: "http://poll.framgia.vn/", description: "A simple poll system", core_features: "PHP", realease_note: "Waiting update", git_repository: "www.github.com", server_information: "Mysql", platform: "Web", pm_url: "wwww.link.com", branch: 1)
p = Project.last
p.images.create
p.category_id =1
p.save



Project.create!(name: "FOrder", url: "http://order.framgia.vn/", description: "Ordering foods, drinks, etc.... in a group/organization", core_features: "Ruby", realease_note: "Waiting update", git_repository: "www.github.com", server_information: "Mysql", platform: "Web", pm_url: "wwww.link.com", branch: 1)
p = Project.last
p.images.create
p.category_id = 1
p.save

Project.create!(name: "FSurvey", url: "Waiting update", description: "A simple survey system", core_features: "PHP", realease_note: "Waiting update", git_repository: "www.github.com", server_information: "Mysql", platform: "Web", pm_url: "wwww.link.com", branch: 1)
p = Project.last
p.images.create
p.category_id = 1
p.save

Project.create!(name: "FOrder- Android", url: "Waiting update", description: "A simple survey system", core_features: "PHP", realease_note: "Waiting update", git_repository: "www.github.com", server_information: "Mysql", platform: "Android", pm_url: "wwww.link.com", branch: 1)
p = Project.last
p.images.create
p.category_id = 2
p.save



Project.create!(name: "FPoll- Android", url: "Waiting update", description: "FPoll for Android", core_features: "Android", realease_note: "Waiting update", git_repository: "www.github.com", server_information: "Mysql", platform: "Mobile", pm_url: "wwww.link.com", branch: 0)
p = Project.last
p.images.create
p.category_id = 2
p.save

Project.create!(name: "CWSB", url: "Waiting update", description: "Co-working space booking system", core_features: "Ruby", realease_note: "Waiting update", git_repository: "www.github.com", server_information: "Mysql", platform: "Android", pm_url: "wwww.link.com", branch: 1)
p = Project.last
p.images.create
p.category_id = 1
p.save

Project.create!(name: "FClub", url: "Waiting update", description: "Managing clubs in an organization", core_features: "Ruby", realease_note: "Waiting update", git_repository: "www.github.com", server_information: "Mysql", platform: "Android", pm_url: "wwww.link.com", branch: 1)
p = Project.last
p.images.create
p.category_id = 1
p.save



Project.create!(name: "FCafe", url: "Waiting update", description: "Publishing and managing coffee shops", core_features: "Ruby", realease_note: "Waiting update", git_repository: "www.github.com", server_information: "Mysql", platform: "Website", pm_url: "wwww.link.com", branch: 1)
p = Project.last
p.images.create
p.category_id = 1
p.save

Project.create!(name: "FDMS", url: "Waiting update", description: "Managing devices in an organization", core_features: "Ruby", realease_note: "Waiting update", git_repository: "www.github.com", server_information: "Mysql", platform: "Website", pm_url: "wwww.link.com", branch: 1)
p = Project.last
p.images.create
p.category_id = 1
p.save

Project.create!(name: "CDTT", url: "Waiting update", description: "Publishing and managing Humanity projects", core_features: "PHP", realease_note: "Waiting update", git_repository: "www.github.com", server_information: "Mysql", platform: "Website", pm_url: "wwww.link.com", branch: 1)
p = Project.last
p.images.create
p.category_id = 1
p.save



Project.create!(name: "FPortfolio", url: "http://poll.framgia.vn/", description: "Publishing portfolio of a group/organization", core_features: "Ruby", realease_note: "Waiting update", git_repository: "https://github.com/framgia/fportfolio/", server_information: "Mysql", platform: "Website", pm_url: "wwww.link.com", branch: 1)
p = Project.last
p.images.create
p.category_id = 1
p.save

Project.create!(name: "TMS", url: "http://education.framgia.vn/", description: "Training Management System", core_features: "Ruby", realease_note: "Waiting update", git_repository: "www.github.com", server_information: "Mysql", platform: "Website", pm_url: "wwww.link.com", branch: 0)
p = Project.last
i = p.images.create
p.category_id = 1
i.image.store!(File.open(File.join(Rails.root, '/public/uploads/default/projects/ExpressVPN.jpg')))
p.images.each do |image|
  image = i
end
p.save

Project.create!(name: "iShipper", url: "http://ishipper.framgia.vn/", description: "Connect Shop and Shipper", core_features: "Android, Ruby", realease_note: "Waiting update", git_repository: "www.github.com", server_information: "Mysql", platform: "Website", pm_url: "wwww.link.com", branch: 0)
p = Project.last
i = p.images.create
p.category_id = 1
i.image.store!(File.open(File.join(Rails.root, '/public/uploads/default/projects/ExpressVPN.jpg')))
p.images.each do |image|
  image = i
end
p.save

Project.create!(name: "FRSM", url: "Inprogress", description: "Framgia Recruitment System Management", core_features: "PHP", realease_note: "Waiting update", git_repository: "https://github.com/framgia/fportfolio/", server_information: "Mysql", platform: "Website", pm_url: "wwww.link.com", branch: 0)
p = Project.last
i = p.images.create
p.category_id = 1
i.image.store!(File.open(File.join(Rails.root, '/public/uploads/default/projects/ExpressVPN.jpg')))
p.images.each do |image|
  image = i
end
p.save



Project.create!(name: "MOS", url: "Inprogress", description: "Melody of Soul", core_features: "Ruby", realease_note: "Waiting update", git_repository: "https://github.com/framgia/fportfolio/", server_information: "Mysql", platform: "Website", pm_url: "wwww.link.com", branch: 0)
p = Project.last
i = p.images.create
p.category_id = 1
i.image.store!(File.open(File.join(Rails.root, '/public/uploads/default/projects/ExpressVPN.jpg')))
p.images.each do |image|
  image = i
end
p.save



Project.create!(name: "FStore", url: "Inprogress", description: "FStore providers online platform connecting consumers with store owner.", core_features: "PHP", realease_note: "Waiting update", git_repository: "https://github.com/framgia/fportfolio/", server_information: "Mysql", platform: "Website", pm_url: "wwww.link.com", branch: 0)
p = Project.last
i = p.images.create
p.category_id = 1
i.image
p.images.each do |image|
  image = i
end
p.save



Project.create!(name: "AC", url: "Inprogress", description: "Accounting System", core_features: "Ruby", realease_note: "Waiting update", git_repository: "https://github.com/framgia/fportfolio/", server_information: "Mysql", platform: "Website", pm_url: "wwww.link.com", branch: 0)
p = Project.last
i = p.images.create
p.category_id = 1
i.image.store!(File.open(File.join(Rails.root, '/public/uploads/default/projects/ExpressVPN.jpg')))
p.images.each do |image|
  image = i
end
p.save



Project.create!(name: "PMP", url: "Inprogress", description: "Project Management System", core_features: "Ruby", realease_note: "Waiting update", git_repository: "https://github.com/framgia/fportfolio/", server_information: "Mysql", platform: "Website", pm_url: "wwww.link.com", branch: 0)
p = Project.last
i = p.images.create
p.category_id = 1
i.image.store!(File.open(File.join(Rails.root, '/public/uploads/default/projects/ExpressVPN.jpg')))
p.images.each do |image|
  image = i
end
p.save



Project.create!(name: "FEDS", url: "Inprogress", description: "Manage e-document system", core_features: "Ruby", realease_note: "Waiting update", git_repository: "https://github.com/framgia/fportfolio/", server_information: "Mysql", platform: "Website", pm_url: "wwww.link.com", branch: 0)
p = Project.last
i = p.images.create
p.category_id = 1
i.image.store!(File.open(File.join(Rails.root, '/public/uploads/default/projects/ExpressVPN.jpg')))
p.images.each do |image|
  image = i
end
p.save


Project.create!(name: "CRB", url: "Inprogress", description: "Calendar system", core_features: "Ruby", realease_note: "Waiting update", git_repository: "https://github.com/framgia/fportfolio/", server_information: "Mysql", platform: "Website", pm_url: "wwww.link.com", branch: 0)
p = Project.last
i = p.images.create
p.category_id = 1
i.image.store!(File.open(File.join(Rails.root, '/public/uploads/default/projects/ExpressVPN.jpg')))
p.images.each do |image|
  image = i
end
p.save


Project.create!(name: "CRB Android", url: "Inprogress", description: "Calendar system", core_features: "Ruby", realease_note: "Waiting update", git_repository: "https://github.com/framgia/fportfolio/", server_information: "Mysql", platform: "Website", pm_url: "wwww.link.com", branch: 0)
p = Project.last
i = p.images.create
p.category_id = 1
i.image.store!(File.open(File.join(Rails.root, '/public/uploads/default/projects/ExpressVPN.jpg')))
p.images.each do |image|
  image = i
end
p.save


Project.create!(name: "iMarket", url: "Inprogress", description: "Waiting update", core_features: "Ruby", realease_note: "Waiting update", git_repository: "https://github.com/framgia/fportfolio/", server_information: "Mysql", platform: "Website", pm_url: "wwww.link.com", branch: 0)
p = Project.last
i = p.images.create
p.category_id = 1
i.image.store!(File.open(File.join(Rails.root, '/public/uploads/default/projects/ExpressVPN.jpg')))
p.images.each do |image|
  image = i
end
p.save


Project.create!(name: "FCSP", url: "Inprogress", description: "Framgia Code School Platform", core_features: "Ruby", realease_note: "Waiting update", git_repository: "https://github.com/framgia/fportfolio/", server_information: "Mysql", platform: "Website", pm_url: "wwww.link.com", branch: 0)
p = Project.last
i = p.images.create
p.category_id = 1
i.image.store!(File.open(File.join(Rails.root, '/public/uploads/default/projects/ExpressVPN.jpg')))
p.images.each do |image|
  image = i
end
p.save


Project.create!(name: "ExpressVPN", url: "deloyed", description: "If you want to keep your Android device safe on sketchy public Wi-Fi, you’ll need a solid VPN, and ExpressVPN is one of the most trusted, secure brands in the virtual private network industry, and that’s for good reason. It’s super fast and extremely safe, boasting an SSL-secured network with 256-bit encryption and, get this, unlimited bandwidth and speed.", core_features: "Android", realease_note: "Waiting update", git_repository: "https://github.com/ExpressVPN/ExpressVPN1/", server_information: "Mysql", platform: "Website", pm_url: "wwww.link.com", branch: 0)
p = Project.last
i = p.images.create
p.category_id = 1
i.image.store!(File.open(File.join(Rails.root, '/public/uploads/default/projects/ExpressVPN.jpg')))
p.images.each do |image|
  image = i
end
p.save