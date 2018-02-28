# Create 3 users
User.create(email: 'user@user.com',
            name: "Jacek",
            last_name: "M",
            password: 'qwerty',
            password_confirmation: 'qwerty',
            live_city: 'Poznań',
            interesting_city: 'Poznań',
            confirmed_at: Time.zone.now)

User.create(email: 'cook@cook.com',
            name: "Kasia",
            last_name: "K",
            password: 'qwerty',
            password_confirmation: 'qwerty',
            live_city: 'Poznań',
            interesting_city: 'Poznań',
            confirmed_at: Time.zone.now)

User.create(email: 'cook2@cook.com',
            name: "Piotr",
            last_name: "F",
            password: 'qwerty',
            password_confirmation: 'qwerty',
            live_city: 'Poznań',
            interesting_city: 'Poznań',
            confirmed_at: Time.zone.now)

# Kasia and Piotr are cooks
Cook.create(work_city: 'Poznań',
            speciality: 'kuchnia polska',
            user_id: 2)

Cook.create(work_city: 'Poznań',
            speciality: 'kuchnia polska',
            user_id: 3)

# Jacek creates a organization
Organization.create(name: "PP",
                    city: 'Poznań',
                    description: 'Bardzo fajne jedzonko!',
                    private_type: true)

Administration.create(user_id: 1, organization_id: 1)

# Kasia creates a organization
Organization.create(name: "Zupki by Kasia",
                    city: 'Poznań',
                    description: 'Najlepsze z najlepszych!',
                    private_type: true)

Administration.create(user_id: 2, organization_id: 2)

# Piotr creates a organization
Organization.create(name: "PiotrZur",
                    city: 'Poznań',
                    description: 'Żurek jak u mamy!',
                    private_type: true)

Administration.create(user_id: 3, organization_id: 3)

# Kasia is cooking in her organization and in other organization
# Piotr is cooking only in his organization
CooksOrganization.create(cook_id: 1, organization_id: 1)
CooksOrganization.create(cook_id: 1, organization_id: 2)
CooksOrganization.create(cook_id: 2, organization_id: 3)

# Kasia creates a new dish
Dish.create(name: 'Rosołek babci Kazi w pięciu smakach',
            description: 'Zajebiste, polecam 10/10',
            type_of_kitchen: 'kuchnia polska',
            cook_id: 1)

Dish.create(name: 'Rosołek z internetu',
            description: 'Bardzo fajna zupka',
            type_of_kitchen: 'kuchnia polska',
            cook_id: 1)

# Piotr creates a new dish
Dish.create(name: 'Żurek',
            description: 'Najlepszy żurek w Poznaniu',
            type_of_kitchen: 'kuchnia polska',
            cook_id: 2)

# Kasia creates a new proposal in her organization
Proposal.create(price: 0.00,
                quantity: 2,
                expiration_date: "Mon, 28 Feb 2018 13:00:00 +0100",
                dish_id: 1,
                organization_id: 2,
                cook_id: 1)

# Kasia creates a new proposal in other organization
Proposal.create(price: 2.00,
                quantity: 3,
                expiration_date: "Mon, 28 Feb 2018 17:00:00 +0100",
                dish_id: 2,
                organization_id: 1,
                cook_id: 1)

# Piotr creates a new proposal in his organization
Proposal.create(price: 4.00,
                quantity: 10,
                expiration_date: "Mon, 28 Feb 2018 15:00:00 +0100",
                dish_id: 3,
                organization_id: 3,
                cook_id: 2)

# Jacek follows all organizations
3.times do |n|
  Relationship.create(user_id: 1, organization_id: n+1)
end

# Kasia follows Piotr's organization
Relationship.create(user_id: 2, organization_id: 3)

# Create some ingredients
Ingredient.create(name: 'Marchewka', kind: 0)

Ingredient.create(name: 'Kostka rosołowa', kind: 1)

DishesIngredient.create(dish_id: 1, ingredient_id: 1)

# Create custom orders
CustomOrder.create(quantity: 1,
                   receive_date: Time.zone.now,
                   user_id: 1,
                   proposal_id: 1)

CustomOrder.create(quantity: 2,
                   receive_date: Time.zone.now,
                   user_id: 1,
                   proposal_id: 2)


CustomOrder.create(quantity: 2,
                   receive_date: Time.zone.now,
                   user_id: 1,
                   proposal_id: 3)
