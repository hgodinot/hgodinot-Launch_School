contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]
            
contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}
data = [:email, :address, :phone]

contacts.each do |name, hash|
  data.each do |data|
  hash[data] = contact_data.shift
  end 
end 

p contacts 

=begin
Challenge: In exercise 11, we manually set the contacts hash values one by one. 
Now, programmatically loop or iterate over the contacts hash from exercise 11, 
and populate the associated data from the contact_data array. 
Hint: you will probably need to iterate over ([:email, :address, :phone]), 
and some helpful methods might be the Array shift and first methods.

=end

=begin 
contacts["Joe Smith"][:email] = contact_data[0][0]
contacts["Joe Smith"][:address] = contact_data[0][1]
contacts["Joe Smith"][:phone] = contact_data[0][2]

contacts["Sally Johnson"][:email] = contact_data[1][0]
contacts["Sally Johnson"][:address] = contact_data[1][1]
contacts["Sally Johnson"][:phone] = contact_data[1][2]

p contacts 

contacts
=end 