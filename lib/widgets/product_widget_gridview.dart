
import 'package:catlog_flutter/pages/HomePage.dart';
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
                GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,),
              itemBuilder:(context,index){
                final item=HomePage.prod[index];
                return GridTile(child: Image.network(item.image));
              },
              itemCount: HomePage.prod.length,
            )
            // *** GridTile*** //
            // GridTile(
            //   child: Column(
            //     children: [
            //       Image.network(
            //         product.image,
            //         height: 85,
            //         width: 100,
            //       ),
            //       Text(
            //         product.name,
            //         style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            //       ),
            //       Text(
            //         "\$${product.price}",
            //         style: TextStyle(
            //             fontWeight: FontWeight.bold,
            //             color: Colors.deepPurple,
            //             fontSize: 15),
            //       )
            //     ],
            //   ),
            // ),

            // *** GridTileBar ***//
            // GridTileBar(leading: Image.network(product.image,width: 50,),title: Text(product.name),trailing: Text("\$${product.price}"),)

            ));
  }
}
