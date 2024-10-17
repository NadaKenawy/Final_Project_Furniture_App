import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartProduct extends Equatable {
  final String imageUrl;
  final String title;
  final double price;
  final int quantity;

  const CartProduct({
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.quantity,
  });
  CartProduct copyWith({int? quantity}) {
    return CartProduct(
      imageUrl: imageUrl,
      title: title,
      price: price,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  List<Object?> get props => [imageUrl, title, price, quantity];
}

class CartState extends Equatable {
  final List<CartProduct> products;

  const CartState({this.products = const []});

  @override
  List<Object?> get props => [products];
}

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState());

  // إضافة منتج إلى السلة
  void addProduct(CartProduct product) {
    final updatedProducts = List<CartProduct>.from(state.products);
    updatedProducts.add(product);
    emit(CartState(products: updatedProducts));
  }

  // زيادة كمية المنتج في السلة
  void increaseQuantity(int index) {
    final updatedProducts = List<CartProduct>.from(state.products);
    final product = updatedProducts[index];
    updatedProducts[index] = product.copyWith(quantity: product.quantity + 1);
    emit(CartState(products: updatedProducts));
  }

  // تقليل كمية المنتج في السلة
  void decreaseQuantity(int index) {
    final updatedProducts = List<CartProduct>.from(state.products);
    final product = updatedProducts[index];
    if (product.quantity > 1) {
      updatedProducts[index] = product.copyWith(quantity: product.quantity - 1);
    } else {
      updatedProducts.removeAt(index);
    }
    emit(CartState(products: updatedProducts));
  }

  // حذف جميع المنتجات من السلة
  void clearCart() {
    emit(const CartState(products: []));
  }
}
