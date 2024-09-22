# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
# db/seeds.rb

# Define sample job position names
job_titles = [
    "Backend Developer", "Frontend Developer", "DevOps Engineer", "Security Analyst",
    "UI/UX Designer", "Product Manager", "Software Engineer", "Data Scientist",
    "Technical Support Specialist", "Software Architect", "Systems Administrator",
    "Quality Engineer", "IT Consultant", "Network Specialist", "Infrastructure Engineer",
    "Automation Specialist", "Data Analyst", "Project Manager", "Machine Learning Engineer",
    "Graphic Designer", "SEO Specialist", "Technical Writer", "Cloud Computing Specialist",
    "Blockchain Engineer", "AI Engineer", "Business Analyst", "Mobile Developer", "Full Stack Engineer",
    "Engineering Manager", "Cybersecurity Specialist"
  ]
  
  puts "Seeding job positions..."
  
  # Create 30 random positions
  job_titles.each do |title|
    position = Position.create!(
      name: title,
      description: "Job description for #{title}. We are looking for experienced professionals in this field.",
      risk_level: Position.risk_levels.keys.sample, # Randomly assigns risk_level: 'low', 'mid', or 'high'
      min_salary: rand(40000..80000), # Random salary between 40,000 and 80,000
      max_salary: rand(80000..150000), # Random salary between 80,000 and 150,000
      status: Position.statuses.keys.sample # Randomly assigns status: 'active' or 'inactive'
    )
  
    puts "Created Position: #{position.name}, Risk Level: #{position.risk_level}, Status: #{position.status}"
  end
  
  puts "Seeding completed."