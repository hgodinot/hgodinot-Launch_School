people = [
  {
    first_name: "Gary", 
    job_title: "car enthusiast", 
    salary: "14000" 
  },  
  {
    first_name: "Claire", 
    job_title: "developer", 
    salary: "15000"
  },  
  {
    first_name: "Clem", 
    job_title: "developer", 
    salary: "12000"
  }
]

p people.select{|x| x[:job_title] == "developer"}.map{|y| y[:salary].to_i}.
reduce(0){|sum, n|sum+n}

