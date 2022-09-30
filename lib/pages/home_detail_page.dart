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
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${product.price}".text.xl4.color(Vx.red800).bold.make(),
            ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(MyTheme.darkBluishColor),
                        shape: MaterialStateProperty.all(StadiumBorder())),
                    child: Icon(Icons.add_shopping_cart,))
                .wh(100, 50)
          ],
        ).p32(),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: MyTheme.creamColor,
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
                      color: Colors.white,
                      width: context.screenWidth,
                      child: Column(
                        children: [
                          product.name.text.xl4
                              .color(MyTheme.darkBluishColor)
                              .bold
                              .make(),
                          product.desc.text.xl
                              .textStyle(context.captionStyle)
                              .make(),
                          10.heightBox,
                          Container(
                            child: lorem(paragraphs: 1, words: 50)
                                .text
                                .textStyle(context.captionStyle)
                                .align(TextAlign.justify)
                                .sm
                                .make(),
                          ).px16(),
                        ],
                      ).py32(),
                    )))
          ],
        ),
      ),
    );
  }
}
