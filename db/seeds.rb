# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
core_features = [" Clear","User friendly", "Simple and Professional Design.","high Speed","Compatibility mode", "Search Engine Optimisation"]
#che do tuong thich, toi uu hoa cong cu tim kiem
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
Category.create(name: "Technology", target_type: 0)
Category.create(name: "Social life", target_type: 0)

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

Project.create!(name: "wsm", url: "http://wsm.framgia.vn/", description: "Managing timesheet, leave,... in a working space", core_features: core_features.sample(3).join("-"), realease_note: "Waiting update", git_repository: "www.github.com", platform: "Web", branch: 1)
p = Project.last
p.images.create
p.category_id = 1
p.save

Project.create!(name: "FPoll", url: "http://poll.framgia.vn/", description: "A simple poll system", core_features: core_features.sample(2).join("-"), realease_note: "Waiting update", git_repository: "www.github.com", platform: "Web", branch: 1)
p = Project.last
p.images.create
p.category_id =1
p.save



Project.create!(name: "FOrder", url: "http://order.framgia.vn/", description: "Ordering foods, drinks, etc.... in a group/organization", core_features: core_features.sample(3).join("-"), realease_note: "Waiting update", git_repository: "www.github.com", platform: "Web", branch: 1)
p = Project.last
p.images.create
p.category_id = 1
p.save

Project.create!(name: "FSurvey", url: "Waiting update", description: "A simple survey system", core_features: core_features.sample(3).join("-"), realease_note: "Waiting update", git_repository: "www.github.com", platform: "Web", branch: 1)
p = Project.last
p.images.create
p.category_id = 1
p.save

Project.create!(name: "FOrder- Android", url: "Waiting update", description: "A simple survey system", core_features: core_features.sample(3).join("-"), realease_note: "Waiting update", git_repository: "www.github.com", platform: "Android", branch: 1)
p = Project.last
p.images.create
p.category_id = 2
p.save



Project.create!(name: "FPoll- Android", url: "Waiting update", description: "FPoll for Android", core_features: core_features.sample(3).join("-"), realease_note: "Waiting update", git_repository: "www.github.com", platform: "Mobile", branch: 0)
p = Project.last
p.images.create
p.category_id = 2
p.save

Project.create!(name: "CWSB", url: "Waiting update", description: "Co-working space booking system", core_features: core_features.sample(3).join("-"), realease_note: "Waiting update", git_repository: "www.github.com", platform: "Android", branch: 1)
p = Project.last
p.images.create
p.category_id = 1
p.save

Project.create!(name: "FClub", url: "Waiting update", description: "Managing clubs in an organization", core_features: core_features.sample(3).join("-"), realease_note: "Waiting update", git_repository: "www.github.com", platform: "Android", branch: 1)
p = Project.last
p.images.create
p.category_id = 1
p.save



Project.create!(name: "FCafe", url: "Waiting update", description: "Publishing and managing coffee shops", core_features: core_features.sample(3).join("-"), realease_note: "Waiting update", git_repository: "www.github.com", platform: "Website", branch: 1)
p = Project.last
p.images.create
p.category_id = 1
p.save

Project.create!(name: "FDMS", url: "Waiting update", description: "Managing devices in an organization", core_features: core_features.sample(3).join("-"), realease_note: "Waiting update", git_repository: "www.github.com", platform: "Website", branch: 1)
p = Project.last
p.images.create
p.category_id = 1
p.save

Project.create!(name: "CDTT", url: "Waiting update", description: "Publishing and managing Humanity projects", core_features: core_features.sample(3).join("-"), realease_note: "Waiting update", git_repository: "www.github.com", platform: "Website", branch: 1)
p = Project.last
p.images.create
p.category_id = 1
p.save



Project.create!(name: "FPortfolio", url: "http://poll.framgia.vn/", description: "Publishing portfolio of a group/organization", core_features: core_features.sample(3).join("-"), realease_note: "Waiting update", git_repository: "https://github.com/framgia/fportfolio/", platform: "Website", branch: 1)
p = Project.last
p.images.create
p.category_id = 1
p.save

Project.create!(name: "TMS", url: "http://education.framgia.vn/", description: "Training Management System", core_features: core_features.sample(3).join("-"), realease_note: "Waiting update", git_repository: "www.github.com", platform: "Website", branch: 0)
p = Project.last
p.images.create
p.category_id = 1
p.save

Project.create!(name: "iShipper", url: "http://ishipper.framgia.vn/", description: "Connect Shop and Shipper", core_features: core_features.sample(3).join("-"), realease_note: "Waiting update", git_repository: "www.github.com", platform: "Website", branch: 0)
p = Project.last
p.images.create
p.category_id = 1
p.save

Project.create!(name: "FRSM", url: "Inprogress", description: "Framgia Recruitment System Management", core_features: core_features.sample(3).join("-"), realease_note: "Waiting update", git_repository: "https://github.com/framgia/fportfolio/", platform: "Website", branch: 0)
p = Project.last
p.images.create
p.category_id = 1
p.save



Project.create!(name: "MOS", url: "Inprogress", description: "Melody of Soul", core_features: core_features.sample(3).join("-"), realease_note: "Waiting update", git_repository: "https://github.com/framgia/fportfolio/", platform: "Website", branch: 0)
p = Project.last
p.images.create
p.category_id = 1
p.save



Project.create!(name: "Dolphin", url: "Inprogress", description: "A clean, tabbed browser, Dolphin delivers an excellent user experience on Android, almost making you forget that you're on a mobile device. Dolphin also supports tight integration with services like Evernote and LastPass, as well as robust settings. My favorite feature is gestures, which might not always be efficient but are definitely cool to use. Dolphin also has integrated ad-blocking and support for Flash. Yes, Flash!", core_features: core_features.sample(3).join("-"), realease_note: "Waiting update", git_repository: "https://github.com/framgia/fportfolio/", platform: "Website", branch: 0)
p = Project.last
p.images.create image: File.open(File.join(Rails.root, '/public/uploads/default/projects/dolphin.jpg'))
p.category_id = 1
p.save



Project.create!(name: "CNET", description: "mong top few sites, this one is the best tech news website to get the info about gadgets, technology, reviews on smartphones, tech videos. Cnet also covers latest topics like smart home devices and electronic accessories related to cars. Cnet publishes unbiased product reviews and teach users to learn how to get most of from the devices. Cnet also provides free downloads for mostly free softwares, mobile apps and games on his site and that’s why it’s very popular in techfreaks and that’s why we’ve choose this website is at the top for the top tech news websites.", core_features: core_features.sample(3).join("-"), realease_note: "Waiting update", git_repository: "https://github.com/framgia/fportfolio/", platform: "Website", url: "https://www.cnet.com/", branch: 0)
p = Project.last
p.images.create image: File.open(File.join(Rails.root, '/public/uploads/default/projects/cnet.jpg'))
p.category_id = 1
p.save



Project.create!(name: "MIT Technology Review ", description: "MIT Technology Review is what you’d hope for based on the association with the university. It’s indeed a popularized, yet deep thinking publication that mines the latest knowledge and insights in technology. One really good showcase of the publication is their coverage of automation, such as this story about its impact on the job market.", core_features: core_features.sample(3).join("-"), realease_note: "Waiting update", git_repository: "https://github.com/framgia/fportfolio/", platform: "Website", url: "https://www.technologyreview.com/", branch: 0)
p = Project.last
p.images.create image: File.open(File.join(Rails.root, '/public/uploads/default/projects/technologyreview.jpg'))
p.category_id = 1
p.save



Project.create!(name: "Pingdom", description: "Pingdom makes it easy to get notified when something goes wrong with servers you need to stay available and working. The service can do a bunch of stuff, starting with just querying that a service running at a certain address and port is responding, to some smarter parsing of a certain URL that you want to return a certain status.", core_features: core_features.sample(3).join("-"), realease_note: "Waiting update", git_repository: "https://github.com/framgia/fportfolio/", platform: "Website", url: "https://www.pingdom.com/", branch: 0)
p = Project.last
p.images.create image: File.open(File.join(Rails.root, '/public/uploads/default/projects/pingdom.jpg'))
p.category_id = 1
p.save


Project.create!(name: "Kindeo", description: "The photo album gets rebooted with Kindeo, which lets families  pass down memories from generation to generation. Record video through the app and store it so that future relatives will never be able to escape those embarrassing baby photos. [iOS, free.]", core_features: core_features.sample(3).join("-"), realease_note: "Waiting update", git_repository: "https://github.com/framgia/fportfolio/", platform: "App", url: "https://www.kindeo.com/", branch: 0)
p = Project.last
p.images.create image: File.open(File.join(Rails.root, '/public/uploads/default/projects/kindeo.jpg'))
p.category_id = 1
p.save


Project.create!(name: "Fleksy", description: "
This keyboard is one of the best for fast, accurate typing and it’s our new company favorite. Many of us have adopted Fleksy because it’s big, it’s clever and once you use it for a couple of hours, you realize how useful some of the smaller details are.", core_features: core_features.sample(3).join("-"), realease_note: "Waiting update", git_repository: "https://github.com/framgia/fportfolio/", platform: "Website", url: "http://fleksy.com/", branch: 0)
p = Project.last
p.images.create image: File.open(File.join(Rails.root, '/public/uploads/default/projects/Fleksy.jpg'))
p.category_id = 1
p.save


Project.create!(name: "Solid Explorer", description: "In light of the turn ES File Explorer has taken, we've tested out a few alternatives in search of a replacement. One app we've settled on is Solid Explorer. It's feature-rich and highly accessible thanks to a crisp Material Design UI. It also houses a very handy double-panel display that lets you navigate to two separate folders and drag a file across from one to the other. Integration with cloud services like Google Drive, Dropbox and OneDrive, as well as FTP servers, make it a formidable all-in-one solution for managing your files.", core_features: core_features.sample(3).join("-"), realease_note: "Waiting update", git_repository: "https://github.com/framgia/fportfolio/", platform: "Website", url: "wwww.link.com", branch: 0)
p = Project.last
p.images.create image: File.open(File.join(Rails.root, '/public/uploads/default/projects/SolidExplorer.jpg'))
p.category_id = 1
p.save


Project.create!(name: "Telegram", description: "Telegram is a free cloud-based instant messaging service. Telegram clients exist for both ..... Users can also access Telegram's cloud-based messages via an official web browser interface called Telegram Web ", core_features: core_features.sample(3).join("-"), realease_note: "Waiting update", git_repository: "https://github.com/framgia/fportfolio/", platform: "Website", url: "https://web.telegram.org/#/login", branch: 0)
p = Project.last
p.images.create image: File.open(File.join(Rails.root, '/public/uploads/default/projects/telegram.jpg'))
p.category_id = 1
p.save


Project.create!(name: "ExpressVPN", description: "If you want to keep your Android device safe on sketchy public Wi-Fi, you’ll need a solid VPN, and ExpressVPN is one of the most trusted, secure brands in the virtual private network industry, and that’s for good reason. It’s super fast and extremely safe, boasting an SSL-secured network with 256-bit encryption and, get this, unlimited bandwidth and speed.", core_features: core_features.sample(3).join("-"), realease_note: "Waiting update", git_repository: "https://github.com/ExpressVPN/ExpressVPN/", platform: "Website", url: "wwww.link.com", branch: 0)
p = Project.last
p.images.create image: File.open(File.join(Rails.root, '/public/uploads/default/projects/ExpressVPN.jpg'))
p.category_id = 1
p.save

Post.create!(title: "Elon Musk muốn upload não bộ con người lên internet – ông sẽ phải đối mặt với khó khăn nào?", content: "Việc kết nối não bộ và máy tính sẽ là chìa khóa, là sự khẳng định rằng con người vượt trội hơn trí tuệ nhân tạo

Dù bạn có tin hay không và đã sẵn sang hay chưa, thì máy tính và não bộ con người đã giao tiếp với nhau thường xuyên trong những phòng thí nghiệm công nghệ cao rồi. Không chỉ dừng lại ở đó bởi sau quá trình kết nối và tập luyện, mối liên kết máy móc – con người đang dần trở nên khăng khít hơn. Ví dụ cho những ứng dụng của liên kết này? Những người tàn tật hiện đã có thể di chuyển những chi robot của mình chỉ với sức mạnh của não bộ mình.
Ta đang mơ tưởng tới một tương lai điều khiển xe cộ (thậm chí là cả tàu vũ trụ?) chỉ bằng suy nghĩ của mình, tải não của ta lên một hệ thống máy tính mạnh mẽ xứng tầm với khả năng con người và cuối cùng, tạo ra một người-lai-robot hoàn thiện – một cyborg.

Và bạn biết gì không, Elon Musk đã chính thức đặt chân vào cuộc đua tới tương lai này. CEO của Tesla và SpaceX vừa mới xây dựng thêm Neuralink – một công ty nhắm tới mục tiêu liên kết trí óc con người và máy tính. Musk có thể phát triển xe tự lái, tên lửa tái chế nhưng liệu, cái ước mơ xa vời của kết hợp não bộ và máy tính có thực hiện được?

Công nghệ thần kinh lần đầu tiên được đưa ra bởi Jaques Vidal vào hồi những năm 1970, ông nêu lên ý tưởng về việc ghi điện não – việc theo dõi và ghi lại song não thông qua những cảm biến được đặt trên da đầu của con người – có thể được sử dụng để tạo nên những hệ thống cho phép con người điều khiển những vật thể, những thiết bị khác.", target_type: 0)
p = Post.last
p.category_id = 7
p.user_id = 1
p.image.store!(File.open(File.join(Rails.root, '/public/uploads/default/posts/ElonMusk.jpg')))
p.save

Post.create!(title: "[JAVA] Giải pháp khi gặp java.lang.OutOfMemoryError", content: "Mọi lập trình viên java đều phải đối mặt với java.lang.OutOfMemoryError và nó là một vấn đề về giới hạn của hệ thống ( bộ nhớ ) hơn là lỗi lập trình trong một số trường hợp. Tuy nhiên trong một số trường hợp với memory leak cũng gây ra java.lang.OutOfMemoryError .Tôi nhận ra rằng mặc dù java.lang.OutOfMemoryError là kiến thức khá cơ bản về nguyên nhân và giải pháp, nhưng phần lớn các lập trình viên không biết rõ nó. Cuốn sách cơ bản cho người mới như Head First Java không hướng dẫn cho bạn cách xử lí với những lỗi như này. Bạn cần một kinh nghiệm thực tế xử lí với các hệ thống sản xuất, giải quyết một số lượng lớn phiên người dùng để khắc phục sự cố về hiệu năng như không đủ bộ nhớ

Nếu bạn muốn tốt hơn trong xử lí sự cố và phân tích hiệu năng, bạn cần phải đọc vài cuốn sách về Java hiệu năng và profiling như Java Performance The definitive Guide của Scott Oaks hoặc Java Performance của Binu John. Họ không những là cảm hứng tuyệt vời cho lập trình viên Java senior mà còn chỉ bạn công cụ và phương pháp khi gặp những lỗi như java.lang.OutOfMemoryError.


Trong bài viết này, chúng tôi sẽ tìm hiểu java.lang.OutOfMemoryError là gì ? Tại sao OutOfMemoryError lại xảy ra với ứng dụng Java? sự khác nhau giữa OutOfMemoryError và Làm thế nào để khắc phục OutOfMemoryError  trong Java. Bài viết còn cung cấp kiến thức cơ bản về  java.lang.OutOfMemoryError và chúng tôi sẽ không bàn luận chi tiết về profiling. Về profiling hãy đọc những cuốn sách đã được tối nhắc ở trên.", target_type: 0)
p = Post.last
p.category_id = 7
p.user_id = 1
p.image.store!(File.open(File.join(Rails.root, '/public/uploads/default/posts/understanding-jvm.jpg')))
p.save

Post.create!(title: "Giới thiệu các Storage Engine trong MySQL", content: "InnoDB

Đây là Storage Engine mặc định trong MySQL 5.7. InnoDB là một Storage Engine transaction-safe (tuân thủ ACID) cho MySQL có các commit, rollback và khả năng khôi phục lỗi để bảo vệ dữ liệu người dùng. Row-level locking của InnoDB và kiểu nonlocking read của Oracle-style làm tăng sự đồng thời và hiệu suất của nhiều người dùng. InnoDB lưu trữ dữ liệu người dùng trong các clustered indexes để giảm I/O cho các truy vấn thông thường dựa trên các primary key. Để duy trì tính toàn vẹn của dữ liệu, InnoDB cũng hỗ trợ các ràng buộc toàn vẹn Foreign Key.

MyISAM

Table-level locking giới hạn hiệu suất read/write dữ liệu, vì vậy nó thường được sử dụng cho các công việc read-only hoặc read-mostly trong các cấu hình Web và lưu trữ dữ liệu.
Memory

Lưu trữ tất cả dữ liệu trong RAM, để truy cập nhanh trong các môi trường đòi hỏi tra cứu nhanh các dữ liệu không quan trọng. Engine này trước đây gọi là HEAP Engine. Storage Engine này đang sử dụng ít dần, do InnoDB với vùng bộ đệm cung cấp một cách mục đích chung và bền để giữ hầu hết hoặc tất cả dữ liệu trong memory, và NDBCLUSTER cung cấp tra cứu giá trị quan trọng nhanh cho các bộ dữ liệu phân tán lớn.

CSV

Các bảng của nó thực sự là các tập tin văn bản với các giá trị được phân cách bởi dấu phẩy. Các bảng CSV cho phép bạn nhập hoặc đổ dữ liệu ở định dạng CSV, để trao đổi dữ liệu với các tập lệnh và ứng dụng đọc và ghi cùng một định dạng. Vì bảng CSV không được lập chỉ mục, bạn thường giữ dữ liệu trong các bảng InnoDB trong quá trình hoạt động bình thường và chỉ sử dụng các bảng CSV trong giai đoạn nhập hoặc xuất.

Archive

Các bảng nhỏ gọn, không biểu hiện này được dùng để lưu trữ và truy xuất số lượng lớn các thông tin kiểm tra lịch sử, lưu trữ, hoặc kiểm tra an toàn.", target_type: 0)
p = Post.last
p.category_id = 8
p.user_id = 1
p.image.store!(File.open(File.join(Rails.root, '/public/uploads/default/posts/mysql.png')))
p.save

3.times do |e|
  Participate.create!(user_id: 1, project_id: "#{25-e}", is_accept: true, position: "div")
end
