r1 = Role.create({
	name: "Regular", 
	description: "Can read items", 
	admin: false, 
	manager: false
})
r2 = Role.create({
	name: "Manager", 
	description: "Can read and create items. Can update and destroy own items", 
	admin: false, 
	manager: true
})
r3 = Role.create({
	name: "Administrator", 
	description: "Can perform any CRUD operation on any resource", 
	admin: true, 
	manager: true
})

u1 = User.create({
	name: "Kaciano Ghelere", 
	email: "kaciano_ghelere@yahoo.com.br", 
	password: "everlong", 
	password_confirmation: "everlong", 
	role_id: r3.id
})
u2 = User.create({
	name: Faker::Name.name, 
	email: "sue@example.com", 
	password: "aaaaaaaa", 
	password_confirmation: "aaaaaaaa", 
	role_id: r2.id
})
u3 = User.create({
	name: Faker::Name.name, 
	email: "kev@example.com",  
	password: "aaaaaaaa", 
	password_confirmation: "aaaaaaaa", 
	role_id: r2.id
})
u4 = User.create({
	name: Faker::Name.name, 
	email: "jack@example.com", 
	password: "aaaaaaaa", 
	password_confirmation: "aaaaaaaa", 
	role_id: r1.id
})

i1 = Item.create({
	name: Faker::Commerce.product_name, 
	description: Faker::Lorem.sentences(1), 
	price: Faker::Commerce.price, 
	user_id: u2.id
})
i2 = Item.create({
	name: Faker::Commerce.product_name, 
	description: Faker::Lorem.sentences(1), 
	price: Faker::Commerce.price, 
	user_id: u2.id
})
i3 = Item.create({
	name: Faker::Commerce.product_name, 
	description: Faker::Lorem.sentences(1), 
	price: Faker::Commerce.price, 
	user_id: u3.id
})
i4 = Item.create({
	name: Faker::Commerce.product_name, 
	description: Faker::Lorem.sentences(1), 
	price: Faker::Commerce.price, 
	user_id: u3.id
})