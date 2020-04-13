library coffee_vending_machine.globals;

int chosen = -1;

int sizeChosen = 0;
bool milkAdded = false;
bool creamAdded = false;
bool syrupAdded = false;
bool chocolateAdded = false;

final coffee_prices = {
  'Coffee': 1.90,
  'Espresso': 3.00,
  'Latte': 3.75,
  'Macchiato': 4.25,
  'Cappuccino': 3.75,
  'Mochaccino': 4.25,
  'Americano': 3.25,
};

final size_prices = {
  'Regular': 0.0,
  'Medium': 0.3,
  'Large': 0.5,
};

final toppings_prices = {
  'Milk': 0.2,
  'Cream': 0.2,
  'Syrup': 0.2,
  'Chocolate': 0.5,
};

// calculate the total price of the coffee
String calculate_total_price() {
  String coffee = coffee_prices.keys.toList()[chosen];
  double price = coffee_prices[coffee];
  String size = size_prices.keys.toList()[sizeChosen];
  double size_price = size_prices[size];
  double toppings_price =
      (milkAdded ? toppings_prices['Milk'] : 0.0) +
          (creamAdded ? toppings_prices['Cream'] : 0.0) +
          (syrupAdded ? toppings_prices['Syrup'] : 0.0) +
          (chocolateAdded ? toppings_prices['Chocolate'] : 0.0);
  return (price + size_price + toppings_price).toStringAsFixed(2);
}
