namespace :notes do
  desc "TODO"
  task update: :environment do
  	Note.all.each do |note|
  		note.update(user_id: User.first.id)
  	end
  end
end
