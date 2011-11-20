namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke

    flickr_set_id = [72157627540544488, 72157627309708150, 72157626646787712, 72157626646672290]
    thumbnail = ["http://farm7.staticflickr.com/6061/6090053581_5b98362aa1_m.jpg", 
	    		 "http://farm7.staticflickr.com/6007/5987891163_73d8b482c4_m.jpg",
	    		 "http://farm6.staticflickr.com/5264/5687687064_70c0222188_m.jpg",
	    		 "http://farm6.staticflickr.com/5223/5687073139_3ce918bea0_m.jpg"]

    6.times do |n|
      name  = Faker::Name.name
      Photoset.create!(:name => name,
	                   :flickr_set_id => flickr_set_id.rand,
	                   :thumbnail => thumbnail.rand)
    end
  end
end