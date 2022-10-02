import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/cart.dart';
import '../../models/catlogconvert.dart';
import '../../pages/home_page.dart';
class AddToCart extends StatefulWidget {
  final Product product;
  const AddToCart({Key? key,required  this.product}) : super(key: key);

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  CartModel cartModel=CartModel();

  @override
  Widget build(BuildContext context) {
    bool isInCart=cartModel.products.contains(widget.product)?? false;
    return ElevatedButton(
      onPressed: () {
        isInCart=!isInCart;
        cartModel.catlog=CatlogConvert(products: HomePage.prod!);
        if(isInCart){
          cartModel.addProduct(widget.product);
        }
        else{
          cartModel.removeProduct(widget.product);
        }
        setState(() {
        });

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
