// ignore_for_file: use_build_context_synchronously

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_app/screens/cart/bloc/cart_cubit.dart';
import 'package:furniture_app/screens/payment/paymob_manager.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/screens/cart/components/cart_item.dart';
import 'package:furniture_app/screens/cart/components/check_out_section.dart';
import 'package:url_launcher/url_launcher.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(builder: (context, state) {
      return Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(kDefaultPadding),
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final product = state.products[index];
                return CartItem(
                  product: product,
                  onIncrease: () {
                    context.read<CartCubit>().increaseQuantity(index);
                  },
                  onDecrease: () {
                    context.read<CartCubit>().decreaseQuantity(index);
                  },
                );
              },
            ),
          ),
          const CheckoutSection(),
        ],
      );
    });
  }
}

void showCheckoutDialog(BuildContext context) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.question,
    animType: AnimType.scale,
    title: 'Confirm Checkout',
    desc: 'Do you want to proceed with the checkout?',
    customHeader: const Icon(
      Icons.help_outline, 
      size: 110,
      color: kSecondaryColor,
    ),
    btnCancelText: 'Cancel',
    btnOkText: 'Confirm',
    btnCancelOnPress: () {
    },
    btnOkOnPress: () async {
      await _performCheckout(context);
    },
  ).show();
}

Future<void> _performCheckout(BuildContext context) async {
  context.read<CartCubit>().clearCart();
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('Checkout in progress...'),
      backgroundColor: Color.fromARGB(255, 98, 122, 143),
    ),
  );

  try {
    await _pay();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Checkout completed!'),
        backgroundColor: Colors.green,
      ),
    );
  } catch (e) {
    // Handle any errors in payment process
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Checkout failed: $e'),
        backgroundColor: Colors.red,
      ),
    );
  }
}

Future<void> _pay() async {
  PaymobManager().getPaymentKey(10, "EGP").then((String paymentKey) {
    launchUrl(
      Uri.parse(
        "https://accept.paymob.com/api/acceptance/iframes/875304?payment_token=$paymentKey",
      ),
    );
  });
}
