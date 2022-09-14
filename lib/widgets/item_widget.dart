import 'package:catlog_flutter/utils/routes.dart';
import 'package:flutter/material.dart';

import '../models/catlog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  ItemWidget({required this.item}) : assert(item != null);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)),
      child: ListTile(
        leading: Image.network(item.image!),
        title: Text(
          item.name!,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          item.desc!,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        trailing: Text(
          "\$${item.price}",
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
