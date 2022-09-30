
import 'package:catlog_flutter/pages/home_page.dart';
import 'package:flutter/material.dart';
import '../models/catlogconvert.dart';

class ProductWidgetGridView extends StatelessWidget {
  final Product product;

  ProductWidgetGridView({required this.product}) : assert(product != null);

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child:
                // *** GridTile*** //

            // *** GridTile*** //
            Container(
              height: double.maxFinite,
              child: Column(
                children: [
                  Image.network(
                    product.image,
                    height: 30,
                    width: 100,
                  ),
                  Text(
                    product.name,
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "\$${product.price}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                        fontSize: 10),
                  )
                ],
              ),
            ),

            // *** GridTileBar ***//
            // GridTileBar(leading: Image.network(product.image,width: 50,),title: Text(product.name),trailing: Text("\$${product.price}"),)

            ));
  }
}
