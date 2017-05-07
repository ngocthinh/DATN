# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
h = Home.create title: "Portfolio", sologan: "What should be included in my portfolio?", description: "You can have projects to work on and include in your portfolio and you can also have clients to start wit", language: :en
i = Image.create target_id: 1, target_type: "Home"
i.image.store!(File.open(File.join(Rails.root, '/public/uploads/default/sliders/slider.jpg')))
i.save
h.save

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
p.images.create
p.category_id = 1
p.save

Project.create!(name: "iShipper", url: "http://ishipper.framgia.vn/", description: "Connect Shop and Shipper", core_features: "Android, Ruby", realease_note: "Waiting update", git_repository: "www.github.com", server_information: "Mysql", platform: "Website", pm_url: "wwww.link.com", branch: 0)
p = Project.last
p.images.create
p.category_id = 1
p.save

Project.create!(name: "FRSM", url: "Inprogress", description: "Framgia Recruitment System Management", core_features: "PHP", realease_note: "Waiting update", git_repository: "https://github.com/framgia/fportfolio/", server_information: "Mysql", platform: "Website", pm_url: "wwww.link.com", branch: 0)
p = Project.last
p.images.create
p.category_id = 1
p.save



Project.create!(name: "MOS", url: "Inprogress", description: "Melody of Soul", core_features: "Ruby", realease_note: "Waiting update", git_repository: "https://github.com/framgia/fportfolio/", server_information: "Mysql", platform: "Website", pm_url: "wwww.link.com", branch: 0)
p = Project.last
p.images.create
p.category_id = 1
p.save



Project.create!(name: "Dolphin", url: "Inprogress", description: "A clean, tabbed browser, Dolphin delivers an excellent user experience on Android, almost making you forget that you're on a mobile device. Dolphin also supports tight integration with services like Evernote and LastPass, as well as robust settings. My favorite feature is gestures, which might not always be efficient but are definitely cool to use. Dolphin also has integrated ad-blocking and support for Flash. Yes, Flash!", core_features: "PHP", realease_note: "Waiting update", git_repository: "https://github.com/framgia/fportfolio/", server_information: "Mysql", platform: "Website", pm_url: "wwww.dolphin.com", branch: 0)
p = Project.last
p.images.create image: File.open(File.join(Rails.root, '/public/uploads/default/projects/dolphin.jpg'))
p.category_id = 1
p.save



Project.create!(name: "CNET", url: "Inprogress", description: "mong top few sites, this one is the best tech news website to get the info about gadgets, technology, reviews on smartphones, tech videos. Cnet also covers latest topics like smart home devices and electronic accessories related to cars. Cnet publishes unbiased product reviews and teach users to learn how to get most of from the devices. Cnet also provides free downloads for mostly free softwares, mobile apps and games on his site and that’s why it’s very popular in techfreaks and that’s why we’ve choose this website is at the top for the top tech news websites.", core_features: "Ruby", realease_note: "Waiting update", git_repository: "https://github.com/framgia/fportfolio/", server_information: "Mysql", platform: "Website", pm_url: "https://www.cnet.com/", branch: 0)
p = Project.last
p.images.create image: File.open(File.join(Rails.root, '/public/uploads/default/projects/cnet.jpg'))
p.category_id = 1
p.save



Project.create!(name: "MIT Technology Review ", url: "Inprogress", description: "MIT Technology Review is what you’d hope for based on the association with the university. It’s indeed a popularized, yet deep thinking publication that mines the latest knowledge and insights in technology. One really good showcase of the publication is their coverage of automation, such as this story about its impact on the job market.", core_features: "Ruby", realease_note: "Waiting update", git_repository: "https://github.com/framgia/fportfolio/", server_information: "Mysql", platform: "Website", pm_url: "https://www.technologyreview.com/", branch: 0)
p = Project.last
p.images.create image: File.open(File.join(Rails.root, '/public/uploads/default/projects/technologyreview.jpg'))
p.category_id = 1
p.save



Project.create!(name: "Pingdom", url: "Inprogress", description: "Pingdom makes it easy to get notified when something goes wrong with servers you need to stay available and working. The service can do a bunch of stuff, starting with just querying that a service running at a certain address and port is responding, to some smarter parsing of a certain URL that you want to return a certain status.", core_features: "Ruby", realease_note: "Waiting update", git_repository: "https://github.com/framgia/fportfolio/", server_information: "Mysql", platform: "Website", pm_url: "https://www.pingdom.com/", branch: 0)
p = Project.last
p.images.create image: File.open(File.join(Rails.root, '/public/uploads/default/projects/pingdom.jpg'))
p.category_id = 1
p.save


Project.create!(name: "Kindeo", url: "Inprogress", description: "The photo album gets rebooted with Kindeo, which lets families  pass down memories from generation to generation. Record video through the app and store it so that future relatives will never be able to escape those embarrassing baby photos. [iOS, free.]", core_features: "Swift", realease_note: "Waiting update", git_repository: "https://github.com/framgia/fportfolio/", server_information: "Mysql", platform: "App", pm_url: "https://www.kindeo.com/", branch: 0)
p = Project.last
p.images.create image: File.open(File.join(Rails.root, '/public/uploads/default/projects/kindeo.jpg'))
p.category_id = 1
p.save


Project.create!(name: "Fleksy", url: "Inprogress", description: "
This keyboard is one of the best for fast, accurate typing and it’s our new company favorite. Many of us have adopted Fleksy because it’s big, it’s clever and once you use it for a couple of hours, you realize how useful some of the smaller details are.", core_features: "Android", realease_note: "Waiting update", git_repository: "https://github.com/framgia/fportfolio/", server_information: "Mysql", platform: "Website", pm_url: "http://fleksy.com/", branch: 0)
p = Project.last
p.images.create image: File.open(File.join(Rails.root, '/public/uploads/default/projects/Fleksy.jpg'))
p.category_id = 1
p.save


Project.create!(name: "Solid Explorer", url: "Inprogress", description: "In light of the turn ES File Explorer has taken, we've tested out a few alternatives in search of a replacement. One app we've settled on is Solid Explorer. It's feature-rich and highly accessible thanks to a crisp Material Design UI. It also houses a very handy double-panel display that lets you navigate to two separate folders and drag a file across from one to the other. Integration with cloud services like Google Drive, Dropbox and OneDrive, as well as FTP servers, make it a formidable all-in-one solution for managing your files.", core_features: "Android", realease_note: "Waiting update", git_repository: "https://github.com/framgia/fportfolio/", server_information: "Mysql", platform: "Website", pm_url: "wwww.link.com", branch: 0)
p = Project.last
p.images.create image: File.open(File.join(Rails.root, '/public/uploads/default/projects/SolidExplorer.jpg'))
p.category_id = 1
p.save


Project.create!(name: "Telegram", url: "Inprogress", description: "Telegram is a free cloud-based instant messaging service. Telegram clients exist for both ..... Users can also access Telegram's cloud-based messages via an official web browser interface called Telegram Web ", core_features: "Ruby", realease_note: "Waiting update", git_repository: "https://github.com/framgia/fportfolio/", server_information: "Mysql", platform: "Website", pm_url: "https://web.telegram.org/#/login", branch: 0)
p = Project.last
p.images.create image: File.open(File.join(Rails.root, '/public/uploads/default/projects/telegram.jpg'))
p.category_id = 1
p.save


Project.create!(name: "ExpressVPN", url: "deloyed", description: "If you want to keep your Android device safe on sketchy public Wi-Fi, you’ll need a solid VPN, and ExpressVPN is one of the most trusted, secure brands in the virtual private network industry, and that’s for good reason. It’s super fast and extremely safe, boasting an SSL-secured network with 256-bit encryption and, get this, unlimited bandwidth and speed.", core_features: "Android", realease_note: "Waiting update", git_repository: "https://github.com/ExpressVPN/ExpressVPN/", server_information: "Mysql", platform: "Website", pm_url: "wwww.link.com", branch: 0)
p = Project.last
p.images.create image: File.open(File.join(Rails.root, '/public/uploads/default/projects/ExpressVPN.jpg'))
p.category_id = 1
p.save
