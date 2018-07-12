require 'csv'
file = File.read('43dp.csv')
makers = CSV.parse(file, headers: true)


# puts makers
makers.each do |maker|
    Maker.create(
        name: maker[1],
        phone_number: maker[2],
        email: maker[3]
        )
end

User.create(
    email: "admin@admin.com",
    password: "12341234",
    password_confirmation: "12341234",
    is_admin?: true
    )



    
    

