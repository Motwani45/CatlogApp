import 'dart:math';

import 'package:catlog_flutter/models/cart.dart';
import 'package:catlog_flutter/pages/home_page.dart';
import 'package:catlog_flutter/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../models/catlogconvert.dart';
import 'home_widgets/add_to_cart.dart';

class ProductWidget extends StatelessWidget {
  final Product product;

  ProductWidget({required this.product}) : assert(product != null);

  @override
  Widget build(BuildContext context) {
    return
      //*** Catlog Design 2 ***//
      VxBox(
          child: Row(
            children: [
              Hero(
                tag:Key(product.id.toString()),
                child:
                //*** FadeInImage ***//
                FadeInImage(fadeOutDuration: Duration(seconds: 2),
                  placeholder:Image.asset("assets/images/hey.jpg",fit: BoxFit.cover,).image,
                  image: Image.network(
                    product.image,
                  ).image,

                )
                // Image.network(
                //   product.image,
                // )
                    .box
                    .square(120)
                    .rounded
                    .color(context.theme.canvasColor)
                    .make()
                    .p16()
                    .w40(context),
              ),
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      product.name.text.lg
                          .color(context.theme.focusColor)
                          .bold
                          .make(),
                      product.desc.text.textStyle(context.captionStyle).
                          color(context.theme.focusColor).
                      make(),
                      10.heightBox,
                      ButtonBar(
                        alignment: MainAxisAlignment.spaceBetween,
                        buttonPadding: EdgeInsets.zero,
                        children: [
                          "\$${product.price}".text.xl.bold.make(),
                          AddToCart(product: product,)
                        ],
                      ).pOnly(right: 8)
                    ],
                  ))

            ],
          )).color(context.cardColor).rounded.square(150).make().py16();

    // *** Catlog Design 1 ***//
    // Card(
    //   shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)),
    //   child: ListTile(
    //     leading: Image.network(product.image!),
    //     title: Text(
    //       product.name!,
    //       style: TextStyle(fontWeight: FontWeight.bold),
    //     ),
    //     subtitle: Text(
    //       product.desc,
    //       style: TextStyle(fontWeight: FontWeight.bold),
    //     ),
    //     trailing: Text(
    //       "\$${product.price}",
    //       textScaleFactor: 1.5,
    //       style: TextStyle(
    //         color: Colors.deepPurple,
    //         fontWeight: FontWeight.bold,
    //       ),
    //     ),
    //   ),
    // );
  }
}

