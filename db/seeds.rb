# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

stages = [
  { stage_name: 'prospects', status: true },
  { stage_name: 'leads', status: true },
  { stage_name: 'demonstration', status: true },
  { stage_name: 'quote', status: true },
  { stage_name: 'sale', status: true },
  { stage_name: 'loss_sale', status: true },
  { stage_name: 'post_sale', status: true },
  { stage_name: 'about_to_renew', status: true },
  { stage_name: 'renewed', status: true },
  { stage_name: 'not_renewed', status: true }
]

stages.each do |stage|
  Stage.find_or_create_by(stage_name: stage[:stage_name]) do |s|
    s.status = stage[:status]
  end
end