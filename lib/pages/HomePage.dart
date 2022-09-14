// import 'package:catlog_flutter/models/CatalogClass.dart';
import 'package:catlog_flutter/models/catlog.dart';
import 'package:catlog_flutter/widgets/drawer.dart';
import 'dart:convert';
import 'package:catlog_flutter/widgets/item_widget.dart';
import 'package:catlog_flutter/widgets/product_widget_gridview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/catlogconvert.dart';
import '../widgets/product_widget.dart';

class HomePage extends StatefulWidget {
  static List<Product> prod = [];

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
    // setState(() {
    //   print("Set State called");
    // });
  }

  @override
  Widget build(BuildContext context) {
    // loadData();
    print("build method called");
    return Scaffold(
        appBar: AppBar(
          title: Text("Catlog App"),

          // backgroundColor: Colors.green,
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child:
                //***GridView***//
                GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
              shrinkWrap: true,
              physics:BouncingScrollPhysics(),
              children: List.generate(HomePage.prod.length,
                  (index) => ProductWidgetGridView(product: HomePage.prod[index])),
            )

            // *** ListView.builder(Flutter ka RecyclerView)***//
            // ListView.builder(
            //   physics: BouncingScrollPhysics(),
            //   itemBuilder: (context, index) {
            //     return
            //       ProductWidget(
            //       product:
            //       HomePage.prod[index],
            //     );
            //   },
            //   itemCount:
            //   HomePage.prod.length,
            // )
            ),
        drawer: const MyDrawer());
  }
}

void loadData() async {
  // await Future.delayed(Duration(seconds: 2),()async{
  final catalogJson = await rootBundle.loadString("assets/files/catalog.json");
  final catlogconvert = catlogConvertFromJson(catalogJson);
  HomePage.prod = catlogconvert.products;
  print(HomePage.prod);

  // final decodedData=jsonDecode(catalogJson);
  // final productsData=decodedData["products"];
  // CatlogItems.items=List.from(productsData).map<Item>((item) => Item.fromMap(item)).toList();
  // print(CatlogItems.items.length);

  // });
}
