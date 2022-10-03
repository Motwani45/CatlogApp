import 'package:catlog_flutter/core/store.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../models/cart.dart';
import '../../models/catlogconvert.dart';
import '../../pages/home_page.dart';
class AddToCart extends StatelessWidget {
  final Product product;
  AddToCart({required this.product});

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation,RemoveMutation]);
    final CartModel cartModel=(VxState.store as MyStore).cartModel;
    bool isInCart=cartModel.products.contains(product)?? false;
    return ElevatedButton(
      onPressed: () {
        cartModel.catlog=(VxState.store as MyStore).catlogConvert;
        // print((VxState.store as MyStore).catlogConvert.products);
        if(!isInCart){
          AddMutation(product);
        }
        else{
          RemoveMutation(product);
        }

      },
      style: ButtonStyle(
          backgroundColor:
          MaterialStateProperty.all(
              context.theme.floatingActionButtonTheme.backgroundColor),
          shape: MaterialStateProperty.all(
              StadiumBorder())),
      child:isInCart?Icon(Icons.delete):Icon(Icons.add_shopping_cart),);
  }
}
