namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke

    flickr_set_id = [72157627540544488, 72157627309708150, 72157626646787712, 72157626646672290]
    thumbnail = [6090053581, 5987891163, 5687687064, 5687073139]

    6.times do |n|
      name  = Faker::Name.name
      Photoset.create!(:name => name,
	                   :flickr_set_id => flickr_set_id.rand,
	                   :flickr_thumb_id => thumbnail.rand)
    end
  end
end