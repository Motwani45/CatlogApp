import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/catlogconvert.dart';

class HomePage extends StatefulWidget {
  static late Future<List<Product>> prod;

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // Future str = Future.delayed(Duration(seconds: 2));
    // str.then((value) {
    print("str hogaya");
    HomePage.prod = loadData();
    print("catalogjson return hone ke badd yaha pauncha");
    // print(value.toString());
    // });
    /**/

    // setState(() {
    //   print("Set State called");
    // });
  }

  @override
  Widget build(BuildContext context) {
    // loadData();
    print("build method called");
    return Scaffold(
        body: Column(
      children: [],
    ));
  }
}

Future<List<Product>> loadData() async {
  // await Future.delayed(Duration(seconds: 2), () async {
  try {
    print("Entered loadData() function");
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    print("catalogJson mil gaya");
    final catlogconvert = catlogConvertFromJson(catalogJson);
    print("catalogJson return ");
    return catlogconvert.products;
  } catch (Exc) {
    print(Exc);
    rethrow;
  }
  // });

  // final decodedData=jsonDecode(catalogJson);
  // final productsData=decodedData["products"];
  // CatlogItems.items=List.from(productsData).map<Item>((item) => Item.fromMap(item)).toList();
  // print(CatlogItems.items.length);
}
