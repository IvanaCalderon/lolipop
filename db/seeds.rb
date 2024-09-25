
# job_titles = [
#     "Backend Developer", "Frontend Developer", "DevOps Engineer", "Security Analyst",
#     "UI/UX Designer", "Product Manager", "Software Engineer", "Data Scientist",
#     "Technical Support Specialist", "Software Architect", "Systems Administrator",
#     "Quality Engineer", "IT Consultant", "Network Specialist", "Infrastructure Engineer",
#     "Automation Specialist", "Data Analyst", "Project Manager", "Machine Learning Engineer",
#     "Graphic Designer", "SEO Specialist", "Technical Writer", "Cloud Computing Specialist",
#     "Blockchain Engineer", "AI Engineer", "Business Analyst", "Mobile Developer", "Full Stack Engineer",
#     "Engineering Manager", "Cybersecurity Specialist"
#   ]
  
#   puts "Seeding job positions..."
  
#   # Create 30 random positions
#   job_titles.each do |title|
#     position = Position.create!(
#       name: title,
#       description: "Job description for #{title}. We are looking for experienced professionals in this field.",
#       risk_level: Position.risk_levels.keys.sample, # Randomly assigns risk_level: 'low', 'mid', or 'high'
#       min_salary: rand(40000..80000), # Random salary between 40,000 and 80,000
#       max_salary: rand(80000..150000), # Random salary between 80,000 and 150,000
#       status: Position.statuses.keys.sample # Randomly assigns status: 'active' or 'inactive'
#     )
  
#     puts "Created Position: #{position.name}, Risk Level: #{position.risk_level}, Status: #{position.status}"
#   end

  Language.create_or_find_by(name: 'English', status: 1)
  Language.create_or_find_by(name: 'Spanish', status: 1)
  Language.create_or_find_by(name: 'French', status: 0)


  competencies = [
  "Problem Solving", "Teamwork", "Adaptability", "Creativity", 
  "Leadership", "Communication", "Time Management", "Critical Thinking", 
  "Decision Making", "Emotional Intelligence", "Collaboration", 
  "Conflict Resolution", "Negotiation", "Presentation Skills", 
  "Technical Writing", "Analytical Skills", "Attention to Detail", 
  "Project Management", "Customer Service", "Multitasking"
]

puts "Seeding competencies..."

# Create the list of competencies with active status
competencies.each do |competency_name|
  competency = Competency.find_or_create_by(description: competency_name) do |competency|
    competency.status = "active" # Asignar siempre 'active'
  end

  puts "Created/Found Competency: #{competency.description}, Status: #{competency.status}"
end


departments = [
    { name: "IT", status: "active" },
    { name: "Human Resources", status: "active" },
    { name: "Finance", status: "active" },
    { name: "Marketing", status: "active" },
    { name: "Operations", status: "active" },
    { name: "Sales", status: "active" },
    { name: "Customer Support", status: "active" },
    { name: "Legal", status: "active" }
  ]
  
  puts "Seeding departments..."
  
  departments.each do |dept_data|
    department = Department.find_or_create_by(name: dept_data[:name]) do |dept|
      dept.status = dept_data[:status]
    end
    puts "Created/Found Department: #{department.name}, Status: #{department.status}"
  end


 # Ahora crea posiciones asociadas a los departamentos correspondientes
positions = [
    { name: "Backend Developer", department_name: "IT", risk_level: "mid", min_salary: 50000, max_salary: 90000, status: "active", description: "Responsible for server-side web application logic." },
    { name: "Frontend Developer", department_name: "IT", risk_level: "low", min_salary: 40000, max_salary: 80000, status: "active", description: "Develops and implements the visual elements users see and interact with in a web application." },
    { name: "HR Manager", department_name: "Human Resources", risk_level: "high", min_salary: 60000, max_salary: 100000, status: "active", description: "Oversees all aspects of human resources practices and processes." },
    { name: "Finance Analyst", department_name: "Finance", risk_level: "mid", min_salary: 45000, max_salary: 85000, status: "active", description: "Provides financial planning, analysis, and projections for companies." },
    { name: "Marketing Coordinator", department_name: "Marketing", risk_level: "low", min_salary: 40000, max_salary: 70000, status: "inactive", description: "Assists in the development and execution of marketing strategies." },
    { name: "Sales Representative", department_name: "Sales", risk_level: "mid", min_salary: 30000, max_salary: 60000, status: "active", description: "Sells products or services to customers or businesses." },
    { name: "Customer Support Agent", department_name: "Customer Support", risk_level: "low", min_salary: 25000, max_salary: 50000, status: "inactive", description: "Provides assistance and support to customers with issues or questions." },
    { name: "Legal Advisor", department_name: "Legal", risk_level: "high", min_salary: 70000, max_salary: 120000, status: "active", description: "Provides legal advice and support to clients or the business." }
  ]
  
  puts "Seeding positions..."
  
  positions.each do |position_data|
    department = Department.find_by(name: position_data[:department_name])
    if department
      Position.find_or_create_by(name: position_data[:name], department: department) do |position|
        position.risk_level = position_data[:risk_level]
        position.min_salary = position_data[:min_salary]
        position.max_salary = position_data[:max_salary]
        position.status = position_data[:status]
        position.description = position_data[:description]
      end
      puts "Created/Found Position: #{position_data[:name]}, Department: #{department.name}"
    else
      puts "Department not found for position: #{position_data[:name]}"
    end
  end
  
  puts "Seeding completed."