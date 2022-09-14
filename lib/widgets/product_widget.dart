
import 'package:flutter/material.dart';
import '../models/catlogconvert.dart';

class ProductWidget extends StatelessWidget {
  final Product product;

  ProductWidget({required this.product}) : assert(product != null);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)),
      child: ListTile(
        leading: Image.network(product.image!),
        title: Text(
          product.name!,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          product.desc,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        trailing: Text(
          "\$${product.price}",
          textScaleFactor: 1.5,
          style: TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
