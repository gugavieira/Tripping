namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke

    flickr_set_id = [72157627540544488, 72157627309708150, 72157626646787712, 72157626646672290]
    thumbnail = ["http://farm7.staticflickr.com/6061/6090053581_5b98362aa1_m.jpg",
                 "http://farm7.staticflickr.com/6017/5987904085_8b7f3d365e_m.jpg",
                 "http://farm6.staticflickr.com/5248/5687087057_0819ed795c_m.jpg",
                 "http://farm6.staticflickr.com/5263/5687078313_3572ccd3e4_m.jpg"]

    4.times do |n|
      name  = Faker::Name.name
      Photoset.create!(:name => name,
	                   :flickr_set_id => flickr_set_id[n],
	                   :flickr_thumb_url => thumbnail[n])
    end
  end
end