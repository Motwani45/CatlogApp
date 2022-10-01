import 'dart:math';

import 'package:catlog_flutter/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../models/catlogconvert.dart';

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
                          .color(context.accentColor)
                          .bold
                          .make(),
                      product.desc.text.textStyle(context.captionStyle).
                          color(context.accentColor).
                      make(),
                      10.heightBox,
                      ButtonBar(
                        alignment: MainAxisAlignment.spaceBetween,
                        buttonPadding: EdgeInsets.zero,
                        children: [
                          "\$${product.price}".text.xl.bold.make(),
                          ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                  backgroundColor:
                                  MaterialStateProperty.all(
                                      context.theme.floatingActionButtonTheme.backgroundColor),
                                  shape: MaterialStateProperty.all(
                                      StadiumBorder())),
                              child: Icon(Icons.add_shopping_cart),)
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
