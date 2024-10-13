import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/home/data/models/coffee_model.dart';
import '../utils/assets_manager.dart';

part 'coffee_state.dart';

class CoffeeCubit extends Cubit<CoffeeState> {
  CoffeeCubit() : super(CoffeeInitial());

  // Coffee shop list (available drinks)
  final List<CoffeeModel> _shop = [
    CoffeeModel(
      title: 'Espresso',
      price: 4.20,
      imagePath: ImageAssets.espressoPro,
      subTitle: 'with Oa t Milk',
      rate: 4.5,
      numRate: 6.098,
    ),
    CoffeeModel(
      title: 'Espresso',
      price: 4.20,
      imagePath: ImageAssets.espressoDark,
      subTitle: 'with Milk',
      rate: 4.5,
      numRate: 6.098,
    ),
    CoffeeModel(
      title: 'latte',
      price: 15.0,
      imagePath: ImageAssets.latte,
      subTitle: '',
      rate: 4.5,
      numRate: 6.098,
    ),
    CoffeeModel(
      title: 'iced latte',
      price: 20.0,
      imagePath: ImageAssets.icedLatte,
      subTitle: '',
      rate: 4.5,
      numRate: 6.098,
    ),
    CoffeeModel(
      title: 'espresso',
      price: 30.0,
      imagePath: ImageAssets.espressoPro,
      subTitle: '',
      rate: 4.5,
      numRate: 6.098,
    ),
    CoffeeModel(
      title: 'orange coffee',
      price: 40.0,
      imagePath: ImageAssets.orangeCoffee,
      subTitle: '',
      rate: 4.5,
      numRate: 6.098,
    ),
  ];

  // User's cart (items selected by the user)
  final List<CoffeeModel> _userCart = [];

  // Getter for coffee shop list (returns the available drinks)
  List<CoffeeModel> get coffeeShop => _shop;

  // Getter for user's cart (returns items added to cart)
  List<CoffeeModel> get userCurt => _userCart;

  // Add item to the user's cart
  void addItemToCart(CoffeeModel cartItem) {
    CoffeeModel newCartItem = CoffeeModel(
        title: cartItem.title,
        price: cartItem.price,
        imagePath: cartItem.imagePath,
        size: selectedSize,
        type: selectedType,
        quantity: quantity,
        subTitle: cartItem.subTitle,
        rate: cartItem.rate,
        numRate: cartItem.numRate,
        isSelected: selectedItem);

    _userCart.add(newCartItem);
    calculateTotalPrice();
    refreshDetails();
    emit(CoffeeAddItem());
  }

  // Remove item from the user's cart
  void removeItemFromCart(CoffeeModel cartItem) {
    _userCart.remove(cartItem);
    calculateTotalPrice();
    emit(CoffeeRemoveItem());
  }

  int quantity = 1;

  // Increment item quantity in the cart
  void incrementItemQuantity() {
    if (quantity < 10) {
      quantity += 1;
      emit(CoffeeIncrementCountDrinks());
    }
  }

  // Decrement item quantity in the cart
  void decrementItemQuantity() {
    if (quantity > 1) {
      quantity -= 1;
      emit(CoffeeDecrementCountDrinks());
    }
  }

  // Change the size of the selected drink
  String selectedSize = 'M'; // Default size is Medium (M)
  String selectedType = 'White Chocolate'; // Default type is White Chocolate
  bool selectedItem = true; // Default type is White Chocolate

  void changeSelectedSize({required String newSelected}) {
    selectedSize = newSelected;
    emit(CoffeeChangeSelectedSize());
  }

  void changeSelectedType({required String newSelected}) {
    selectedType = newSelected;
    emit(CoffeeChangeSelectedType());
  }

  // selected item in curt
  void selectedItemCart() {
    selectedItem = !selectedItem;
    emit(CurtSelectItem());
  }

  // Refresh drink details
  void refreshDetails() {
    selectedSize = 'M';
    selectedSize = 'White Chocolate';
    quantity = 1;
    selectedItem = true;
    emit(CoffeeRefreshDetailsDrink());
  }

  // Calculate total price for items in the user's cart, considering size
  double totalPrice = 0.0;

  void calculateTotalPrice() {
    totalPrice = 0.0;
    for (var item in _userCart) {
      double itemPrice = item.price;

      if (item.size == 'S') {
        itemPrice *= 0.80; // 20% discount for small size
      } else if (item.size == 'L') {
        itemPrice *= 1.20; // 20% increase for large size
      }

      totalPrice += itemPrice * item.quantity;
    }
    emit(CoffeeCalculateTotalSale());
  }
}
