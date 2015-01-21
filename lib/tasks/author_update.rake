namespace :update do
  desc "Updating author bios and images"
  task authors: [:environment] do
    a = Author.where(:name => "Paul Graham").first
    a.title = "YCombinator"
    a.image_url = "http://upload.wikimedia.org/wikipedia/commons/e/e3/Paulgraham_240x320.jpg"
    a.save

    a = Author.where(:name => "Venture Hacks").first
    a.title = ""
    a.image_url = "https://pbs.twimg.com/profile_images/421337650/Peace_Logo.jpg"
    a.save

    a = Author.where(:name => "VentureHacks").first
    a.title = ""
    a.image_url = "https://pbs.twimg.com/profile_images/421337650/Peace_Logo.jpg"
    a.save

    a = Author.where(:name => "Tom Eisenman").first
    a.title = "Harvard Business School Professor"
    a.image_url = "http://sands.hbs.edu/photos/facstaff/Ent6452.jpg"
    a.save

    a = Author.where(:name => "Josh Kopelman").first
    a.title = "Entrepreneur"
    a.image_url = "http://upload.wikimedia.org/wikipedia/commons/thumb/e/e9/Josh_Kopelman_photo.jpg/220px-Josh_Kopelman_photo.jpg"
    a.save

    a = Author.where(:name => "Phin Barnes").first
    a.title = "First Round"
    a.image_url = "https://media.licdn.com/mpr/mpr/shrink_240_240/p/4/005/06a/1da/113ceac.jpg"
    a.save

    a = Author.where(:name => "Mike Nolet").first
    a.title = 'vino.travel'
    a.image_url = "https://media.licdn.com/mpr/mpr/shrink_200_200/p/7/000/212/1a7/2f74510.jpg"
    a.save

    a = Author.where(:name => "Joe Carrafa").first
    a.title = "Quirky"
    a.image_url = "https://media.licdn.com/mpr/mpr/shrink_200_200/p/4/005/046/280/1993d00.jpg"
    a.save

    a = Author.where(:name => "Jack Leidlein").first
    a.title = "First Round"
    a.image_url = "http://firstround.typepad.com/.a/6a00d83452d6c969e20163039d4520970d-pi"
    a.save

    a = Author.where(:name => "Joe Stump").first
    a.title = "Quick Left"
    a.image_url = "https://media.licdn.com/mpr/mpr/shrink_240_240/p/1/000/10d/18e/2d0303b.jpg"
    a.save

    a = Author.where(:name => "Elaine Wherry").first
    a.title = 'Meebo.com'
    a.image_url = "http://ww4.hdnux.com/photos/06/74/11/1819207/5/628x471.jpg"
    a.save

    a = Author.where(:name => "Rob Hayes").first
    a.title = "First Round"
    a.image_url = "http://startupcafe1.files.wordpress.com/2011/11/rob_head.png?w=500"
    a.save

    a = Author.where(:name => "Naval Ravikant").first
    a.title = "AngelList"
    a.image_url = "https://pbs.twimg.com/profile_images/3696617328/667874c5936764d93d56ccc76a2bcc13_400x400.jpeg"
    a.save

    a = Author.where(:name => "Harvard i-lab").first
    a.title = ""
    a.image_url = "https://yt3.ggpht.com/-9SPiNJ7tggM/AAAAAAAAAAI/AAAAAAAAAAA/6IQqBohqQ-A/s900-c-k-no/photo.jpg"
    a.save

    a = Author.where(:name => "Steve Blank").first
    a.title = "National Institutes of Health"
    a.image_url = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQevEZfWImxXlqjaDmqKLFWnyj9OtPOt6xCkhzEMIPDOry3pHHwrWml78d9"
    a.save

    a = Author.where(:name => "Fred Wilson").first
    a.title = "Union Square Ventures"
    a.image_url = "http://l.yimg.com/os/publish-images/finance/2014-03-26/3b9d6b90-b4f0-11e3-a270-452a15e0fe53_fred-wilson-headshot3.jpg"
    a.save

    a = Author.where(:name => "Mark Forchette").first
    a.title = "OptiMedica"
    a.image_url = "http://ecorner.stanford.edu/image.html?type=ImageAuthorPhotography&id=376&width=120"
    a.save

    a = Author.where(:name => "Mark Suster").first
    a.title = "Upfront Ventures"
    a.image_url = "http://blogs-images.forbes.com/drewhansen/files/2011/10/45986v1-max-450x450.jpg"
    a.save

    a = Author.where(:name => "Ron Conway and Mike Maples Jr.").first
    a.title = "SV Angel"
    a.image_url = "http://www.marinatimes.com/wp-content/uploads/2012/04/MarinaTimes_B_April2012_Print-355.jpg"
    a.save

    a = Author.where(:name => "Beth Seidenberg").first
    a.title = "Kleiner Perkins Caulfield Byers"
    a.image_url = "http://www.atarabio.com/wp-content/uploads/2013/06/beth-300x375.jpg"
    a.save

    a = Author.where(:name => "Tim Draper").first
    a.title = "Draper Fisher Jurvetson"
    a.image_url = "https://www-techinasia.netdna-ssl.com/wp-content/uploads/2007/04/65_lg.jpg"
    a.save

    a = Author.where(:name => "Mike Maples, Ron Conway").first
    a.title = "Floodgate Fund"
    a.image_url = "http://specials-images.forbesimg.com/imageserve/032682c0a4f0cde3b435b473718e069e/280x425.jpg"
    a.save

    a = Author.where(:name => "Jennifer Morris").first
    a.title = "Giftbar"
    a.image_url = "http://www.more.com/sites/default/files/gift%20bar.jpg"
    a.save

    a = Author.where(:name => "Kathleen M. Eisenhardt").first
    a.title = "Stanford University"
    a.image_url = "https://gallery.mailchimp.com/563f37cf505c8f1fce2e53828/images/61b1db13-28fe-481f-a24a-5bbedae6082d.jpg"
    a.save

    a = Author.where(:name => "Vinod Khosla").first
    a.title = "Khosla Ventures"
    a.image_url = "http://i.cnn.net/money/galleries/2007/fortune/0704/gallery.fortune_innovators.fortune/images/vinod_khosla1.jpg"
    a.save

    a = Author.where(:name => "Ann Miura-Ko").first
    a.title = "Floodgate Fund"
    a.image_url = "http://startupgrind.com/wp-content/uploads/2012/07/Screen-shot-2012-07-16-at-9.41.45-PM.png"
    a.save

    a = Author.where(:name => "Anna Patterson").first
    a.title = 'Google, Inc.'
    a.image_url = "http://assets.makers.com/styles/awardee/s3/AnnaPatterson037.jpeg?itok=mFxjezQC"
    a.save

    a = Author.where(:name => "Dana Mead").first
    a.title = "Kleiner Perkins Caulfield Byers"
    a.image_url = "http://web.mit.edu/fnl/volume/193/images/meadTN.jpg"
    a.save

    a = Author.where(:name => "Heidi Roizen").first
    a.title = "Draper Fisher Jurvetson"
    a.image_url = "http://dfj.com/sites/default/files/styles/team_member_large/public/imgl2971_1_detail_1.jpg?itok=Rk-v8Jtb"
    a.save

    a = Author.where(:name => "David Frankel").first
    a.title = "Founder Collective"
    a.image_url = "https://s3.amazonaws.com/foundercollective-production/large/6/avatar?1379428332"
    a.save

    a = Author.where(:name => "David Heinemeier Hansson").first
    a.title = "Basecamp, LLC"
    a.image_url = "http://david.heinemeierhansson.com/images/me.jpg"
    a.save

    a = Author.where(:name => "Drew Houston").first
    a.title = "Dropbox"
    a.image_url = "https://pbs.twimg.com/profile_images/2200590822/drew_400x400.jpg"
    a.save

    a = Author.where(:name => "Larry Page and Eric Schmidt").first
    a.title = 'Google, Inc.'
    a.image_url = "http://a5.files.biography.com/image/upload/c_fill,dpr_1.0,g_face,h_300,q_80,w_300/MTE5NTU2MzE2NDgzNTIwMDEx.jpg"
    a.save

    a = Author.where(:name => "Tina Seelig").first
    a.title = "Stanford University"
    a.image_url = "http://news.stanford.edu/news/2009/january7/gifs/tech_seelig.jpg"
    a.save

    a = Author.where(:name => "Elon Musk").first
    a.title = "Tesla Motors, SpaceX, Paypal"
    a.image_url = "http://images.bwbx.io/cms/2012-09-13/features_elonmusk38__02__405inline.jpg"
    a.save

    a = Author.where(:name => "Guy Kawasaki").first
    a.title = 'Author, Apple Inc.'
    a.image_url = "http://files.guykawasaki.com/images/home-gk-photo.jpg"
    a.save

    a = Author.where(:name => "Randy Adams").first
    a.title = "CEO, What The Funny"
    a.image_url = "http://upload.wikimedia.org/wikipedia/en/4/4f/Randy_Adams_1.jpg"
    a.save

    a = Author.where(:name => "Marc Andreessen").first
    a.title = "Founder, Netscape"
    a.image_url = "http://upload.wikimedia.org/wikipedia/commons/a/a5/Marc_Andreessen_(1).jpg"
    a.save

    a = Author.where(:name => "Gajus Worthington").first
    a.title = "President and CEO, Fluidigm Corporation"
    a.image_url = "http://selectbiosciences.com/images/speakers/Gajus2.jpg"
    a.save

    a = Author.where(:name => "Tom Byers").first
    a.title = "Stanford University"
    a.image_url = "http://news.unl.edu/sites/default/files/media/20140911byers.jpg"
    a.save

    a = Author.where(:name => "Wences Casares, Meyer Malka").first
    a.title = "CEO, Xapo"
    a.image_url = "http://www.emprendedoresnews.com/wp-content/uploads/2011/05/Wenceslao-Casares.jpg"
    a.save

    a = Author.where(:name => "Akshay Kotharim, Ankit Gupta").first
    a.title = "Linkedin"
    a.image_url = "https://pbs.twimg.com/profile_images/449594273982189568/o25bcdYN.jpeg"
    a.save

    a = Author.where(:name => "Kevin Systrom, Mike Krieger").first
    a.title = "CEO, Instagram"
    a.image_url = "http://static6.businessinsider.com/image/50c5fe6269bedd344c000009-480/kevin-systrom-instagram.png"
    a.save

    a = Author.where(:name => "Gotham Girl").first
    a.title = "Co-Founder, Womens Entrepreneur Festival"
    a.image_url = "http://gothamgal.com/wp-content/uploads/2014/04/joanne_wilson.jpg"
    a.save

    a = Author.where(:name => "Fred Wilson, Chris Albinson").first
    a.title = "Co-Founder, Union Square Ventures"
    a.image_url = "http://avc.com/wp-content/uploads/2014/01/freds-avatar.jpg"
    a.save

    a = Author.where(:name => "Fred Wilson / Holger Luedorf").first
    a.title = "Co-Founder, Union Square Ventures"
    a.image_url = "http://avc.com/wp-content/uploads/2014/01/freds-avatar.jpg"
    a.save

    a = Author.where(:name => "Fred wilson / Holger Luedorf").first
    a.title = "Co-Founder, Union Square Ventures"
    a.image_url = "http://avc.com/wp-content/uploads/2014/01/freds-avatar.jpg"
    a.save

    a = Author.where(:name => "Fred WIlson").first
    a.title = "Co-Founder, Union Square Ventures"
    a.image_url = "http://avc.com/wp-content/uploads/2014/01/freds-avatar.jpg"
    a.save

    a = Author.where(:name => "Fred Wilson / Matt Blumberg").first
    a.title = "Co-Founder, Union Square Ventures"
    a.image_url = "http://avc.com/wp-content/uploads/2014/01/freds-avatar.jpg"
    a.save

    a = Author.where(:name => "Fred Wilson / Phil Sugar").first
    a.title = "Co-Founder, Union Square Ventures"
    a.image_url = "http://avc.com/wp-content/uploads/2014/01/freds-avatar.jpg"
    a.save

    a = Author.where(:name => "Brad Feld").first
    a.title = "Director, Foundry Group"
    a.image_url = "https://evbdn.eventbrite.com/s3-s3/eventlogos/35985056/bradfeld.jpeg"
    a.save

    a = Author.where(:name => "David Skok").first
    a.title = "Matrix Partners"
    a.image_url = "https://pbs.twimg.com/profile_images/2692229022/c0c9796979255adaf83b9c07babc7cc1_400x400.png"
    a.save

    a = Author.where(:name => "Brent Chudoba").first
    a.title = "Survey Monkey"
    a.image_url = "http://qph.is.quoracdn.net/main-thumb-45676959-200-whzmfwzdyzomhhekdxfruusqlenpynrf.jpeg"
    a.save

    a = Author.where(:name => "Kyle Lacey").first
    a.title = "Salesforce"
    a.image_url = "http://kylelacy.com/wp-content/uploads/2007/12/KyleProfileShot.png"
    a.save

    a = Author.where(:name => 'Rose O\'Connell').first
    a.title = "OpenView Venture Partners"
    a.image_url = "https://media.licdn.com/mpr/mpr/shrink_240_240/p/4/005/084/21a/197e63d.jpg"
    a.save

    a = Author.where(:name => "Arsham Memarzadeh").first
    a.title = "OpenView Venture Partners"
    a.image_url = "https://media.licdn.com/mpr/mpr/shrink_200_200/p/4/005/061/315/3bf0d99.jpg"
    a.save

    a = Author.where(:name => "Mackey Craven").first
    a.title = "Vice President, OpenView Venture Partners"
    a.image_url = "https://pbs.twimg.com/profile_images/472433240490266625/WOMlBWF3_400x400.jpeg"
    a.save

    a = Author.where(:name => "Devon McDonald").first
    a.title = "OpenView Venture Partners"
    a.image_url = "http://1.gravatar.com/avatar/396db3cbb32d64954a97bad981d3e92d?s=120&d=http%3A%2F%2F1.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D120&r=G"
    a.save

    a = Author.where(:name => "Scott Maxwell").first
    a.title = "OpenView Venture Partners"
    a.image_url = "http://0.gravatar.com/avatar/6543b3ddcbc77d56c9218e80da6d9ba2?s=120&d=http%3A%2F%2F0.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D120&r=G"
    a.save

    a = Author.where(:name => "Blake Bartlett").first
    a.title = "OpenView Venture Partners"
    a.image_url = "http://0.gravatar.com/avatar/26487b5b640ac712f0981a963d5ff6d6?s=120&d=http%3A%2F%2F0.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D120&r=G"
    a.save

    a = Author.where(:name => "Ricky Pelletier").first
    a.title = "OpenView Venture Partners"
    a.image_url = "http://0.gravatar.com/avatar/0b4875880cc6eaa6fb782c0f29721eb7?s=120&d=http%3A%2F%2F0.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D120&r=G"
    a.save

    a = Author.where(:name => "Tien Anh Nguyen").first
    a.title = "OpenView Venture Partners"
    a.image_url = "http://0.gravatar.com/avatar/2348015317ecd24a4248d481800d70f4?s=120&d=http%3A%2F%2F0.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D120&r=G"
    a.save

    a = Author.where(:name => "Baiyin Zhou").first
    a.title = "OpenView Venture Partners"
    a.image_url = "http://1.gravatar.com/avatar/b99db7354d17ed80f6747c9c775681b6?s=120&d=http%3A%2F%2F1.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D120&r=G"
    a.save

    a = Author.where(:name => "Josh Zywien").first
    a.title = "OpenView Venture Partners"
    a.image_url = "https://media.licdn.com/mpr/mpr/shrink_200_200/p/6/000/1c6/162/1378f6f.jpg"
    a.save

    a = Author.where(:name => "George Roberts").first
    a.title = "OpenView Venture Partners"
    a.image_url = "http://1.gravatar.com/avatar/1d22e630f35da7145e6016e0eeed832a?s=120&d=http%3A%2F%2F1.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D120&r=G"
    a.save

    a = Author.where(:name => "Matt Biehler").first
    a.title = "OpenView Venture Partners"
    a.image_url = "http://0.gravatar.com/avatar/2c107d9a5cccc599cdef9251f8d9b0e2?s=120&d=http%3A%2F%2F0.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D120&r=G"
    a.save

    a = Author.where(:name => "Brian Carthas").first
    a.title = "OpenView Venture Partners"
    a.image_url = "http://0.gravatar.com/avatar/2314ea9892e6364e39c073bf00ae404c?s=120&d=http%3A%2F%2F0.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D120&r=G"
    a.save

    a = Author.where(:name => "Rebecca Churt").first
    a.title = "OpenView Venture Partners"
    a.image_url = "http://0.gravatar.com/avatar/c64052f2b4b6aa41630e3d3213d47e6c?s=120&d=http%3A%2F%2F0.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D120&r=G"
    a.save

    a = Author.where(:name => "Jonathan Crowe").first
    a.title = "OpenView Venture Partners"
    a.image_url = "http://0.gravatar.com/avatar/e6d45a5cec3132fd0bb18b61f736c567?s=120&d=http%3A%2F%2F0.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D120&r=G"
    a.save

    a = Author.where(:name => "Blake Harris").first
    a.title = "OpenView Venture Partners"
    a.image_url = "http://0.gravatar.com/avatar/4feb3f0a97c4aebf4f3b48330e408d7b?s=120&d=http%3A%2F%2F0.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D120&r=G"
    a.save

    a = Author.where(:name => "CeCe Bazar").first
    a.title = "OpenView Venture Partners"
    a.image_url = "http://1.gravatar.com/avatar/ff320936e267729d05fce13d155a2e49?s=120&d=http%3A%2F%2F1.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D120&r=G"
    a.save

    a = Author.where(:name => "Carlie Smith").first
    a.title = "OpenView Venture Partners"
    a.image_url = "http://0.gravatar.com/avatar/2bb4e4b46e45af267bdfdb5b93e7b212?s=120&d=http%3A%2F%2F0.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D120&r=G"
    a.save

    a = Author.where(:name => "Morgan Burke").first
    a.title = "OpenView Venture Partners"
    a.image_url = "https://media.licdn.com/mpr/mpr/shrink_200_200/p/5/000/227/282/16ebf3a.jpg"
    a.save

    a = Author.where(:name => "Brandon Hickie").first
    a.title = "OpenView Venture Partners"
    a.image_url = "http://1.gravatar.com/avatar/9dbe689ca208c206de7e6b6bd5524c68?s=120&d=http%3A%2F%2F1.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D120&r=G"
    a.save

    a = Author.where(:name => "Diana Martz").first
    a.title = "OpenView Venture Partners"
    a.image_url = "http://0.gravatar.com/avatar/48a706ce2a35aafe137403c673d570b1?s=120&d=http%3A%2F%2F0.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D120&r=G"
    a.save

    a = Author.where(:name => "Ben Horowitz").first
    a.title = "Andreessen Horowitz"
    a.image_url = "http://specials-images.forbesimg.com/imageserve/12b932ff60d90c778eaae5c623609f5f/280x425.jpg"
    a.save

    a = Author.where(:name => "William Mougayar").first
    a.title = "Startup Management"
    a.image_url = "http://www.itbusiness.ca/images/articles/2012/March/WMougayar.jpg"
    a.save

    a = Author.where(:name => "Howard Morgan").first
    a.title = "First Round Capital"
    a.image_url = "http://frcs3.s3.amazonaws.com.global.prod.fastly.net/people/image/_MG_8042.jpg"
    a.save
  end
end