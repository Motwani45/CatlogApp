import 'package:catlog_flutter/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/catlogconvert.dart';

class HomeDetailPage extends StatelessWidget {
  final Product product;

  const HomeDetailPage({Key? key, required this.product})
      : assert(product != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                    tag: Key(product.id.toString()),
                    child: Image.network(product.image))
                .h32(context),
            Expanded(
                child: VxArc(
                    height: 30,
                    arcType: VxArcType.CONVEY,
                    edge: VxEdge.TOP,
                    child: Container(
                      color: context.cardColor,
                      width: context.screenWidth,
                      child: Column(
                        children: [
                          product.name.text.xl4
                              .color(context.theme.focusColor)
                              .bold
                              .make(),
                          product.desc.text.xl
                              .textStyle(context.captionStyle)
                              .color(context.theme.focusColor)
                              .make(),
                          10.heightBox,
                          Expanded(
                            child: SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              child:
                              lorem(paragraphs: 1, words: 100)
                                  .text
                                  // .textStyle(context.captionStyle)
                                  .color(context.theme.focusColor)
                                  .align(TextAlign.justify)
                                  .make()
                              .pOnly(left: 16,right: 16,top: 16)
                                  // .p16(),
                            ),
                          ),
                        ],
                      )
                      .pOnly(top:32)
                          // .py32(),
                    )))
          ],
        ),
      ),
      bottomNavigationBar:Container(
        color: context.cardColor,
        child: ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            buttonPadding: EdgeInsets.zero,
            children: [
              "\$${product.price}".text.xl4.color(Vx.red800).bold.make(),
              ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(context
                          .theme.floatingActionButtonTheme.backgroundColor),
                      shape: MaterialStateProperty.all(StadiumBorder())),
                  child: Icon(
                    Icons.add_shopping_cart,
                  )).wh(100, 50)
            ],
          ).p16(),
      )
    );
  }
}
