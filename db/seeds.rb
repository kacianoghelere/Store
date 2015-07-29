# 
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
# 
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
# 
i1 = Item.create({
	name: Faker::Commerce.product_name, 
	description: Faker::Lorem.sentence, 
	price: Faker::Commerce.price, 
	user_id: u2.id
})
i2 = Item.create({
	name: Faker::Commerce.product_name, 
	description: Faker::Lorem.sentence, 
	price: Faker::Commerce.price, 
	user_id: u2.id
})
i3 = Item.create({
	name: Faker::Commerce.product_name, 
	description: Faker::Lorem.sentence, 
	price: Faker::Commerce.price, 
	user_id: u3.id
})
i4 = Item.create({
	name: Faker::Commerce.product_name, 
	description: Faker::Lorem.sentence, 
	price: Faker::Commerce.price, 
	user_id: u3.id
})
# 
m1 = Menu.create({
	name:      "Administration",
	icon:      "king",
	parent_id: nil
})
m2 = Menu.create({
	name:      "Management",
	icon:      "wrench",
	parent_id: m1.id
})
m3 = Menu.create({
	name:      "Navigation",
	icon:      "menu-hamburger",
	parent_id: m1.id
})
# 
p1 = Page.create({
	name:    "Roles",
	icon:    "briefcase",
	path:    "roles_path",
	menu_id: m2.id
})
p2 = Page.create({
	name:    "Users",
	icon:    "user",
	path:    "users_path",
	menu_id: m2.id
})
p3 = Page.create({
	name:    "Menus",
	icon:    "tasks",
	path:    "menus_path",
	menu_id: m3.id
})
p4 = Page.create({
	name:    "Pages",
	icon:    "file",
	path:    "pages_path",
	menu_id: m3.id
})
p5 = Page.create({
	name:    "Items",
	icon:    "gift",
	path:    "items_path",
	menu_id: nil
})
# 
ra1 = Access.create({
	role_id:     r3.id, 
	page_id:     p1.id, 
	can_create:  true, 
	can_update:  true, 
	can_read:    true, 
	can_destroy: true
})
ra2 = Access.create({
	role_id:     r3.id, 
	page_id:     p2.id, 
	can_create:  true, 
	can_update:  true, 
	can_read:    true, 
	can_destroy: true
})
ra3 = Access.create({
	role_id:     r3.id, 
	page_id:     p3.id, 
	can_create:  true, 
	can_update:  true, 
	can_read:    true, 
	can_destroy: true
})
ra4 = Access.create({
	role_id:     r3.id, 
	page_id:     p4.id, 
	can_create:  true, 
	can_update:  true, 
	can_read:    true, 
	can_destroy: true
})
ra5 = Access.create({
	role_id:     r1.id, 
	page_id:     p5.id, 
	can_create:  false, 
	can_update:  false, 
	can_read:    true, 
	can_destroy: false
})
ra6 = Access.create({
	role_id:     r2.id, 
	page_id:     p5.id, 
	can_create:  true, 
	can_update:  true, 
	can_read:    true, 
	can_destroy: false
})
ra7 = Access.create({
	role_id:     r3.id, 
	page_id:     p5.id, 
	can_create:  true, 
	can_update:  true, 
	can_read:    true, 
	can_destroy: true
})