describe 'User Stories' do

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'show a list of dishes and prices to the user' do
    dish_tikka = Dish.new(name: "Tikka Masala", price: 6.95)
    dish_chow = Dish.new(name: "Chow Mein", price: 5.95)
    some_dishes = [dish_tikka, dish_chow]
    menu = Menu.new(dishes: some_dishes)
    expect{menu.show_menu}.not_to raise_error
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of
  #several available dishes
  it 'allows customer to select several dishes' do
    dish_tikka = Dish.new(name: "Tikka Masala", price: 6.95)
    order = Order.new
    expect{order.add(dish_tikka, 2)}.not_to raise_error
  end

  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given
  # matches the sum of the various dishes in my order
  it 'checks order total matches sum of dishes prices' do
    dish_tikka = Dish.new(name: "Tikka Masala", price: 7)
    dish_chow = Dish.new(name: "Chow Mein", price: 6)
    order = Order.new
    order.add(dish_tikka, 3)
    order.add(dish_chow, 2)
    err = "Unverified order: payment does not match order sum. Change payment."
    expect{order.payment(100)}.to raise_error err
  end


# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you!
#Your order was placed and will be delivered before 18:52" after I have ordered


end