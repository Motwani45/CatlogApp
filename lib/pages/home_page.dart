
import 'package:catlog_flutter/utils/routes.dart';
import 'package:catlog_flutter/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/catlogconvert.dart';
import '../widgets/home_widgets/catlogheader.dart';
import '../widgets/home_widgets/showcatloglist.dart';

class HomePage extends StatefulWidget {
  static List<Product>? prod = null;

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Future str = Future.delayed(Duration(seconds: 2));
    str.then((value) {
      print("str hogaya");
      loadData().then((value) {
        HomePage.prod = value;
        print("catalogjson return hone ke badd yaha pauncha");
        setState(() {});
      });

      print(value.toString());
    });
    /**/

    // setState(() {
    //   print("Set State called");
    // });
  }

  @override
  Widget build(BuildContext context) {
    print("build method called");
    return Scaffold(
      floatingActionButton: FloatingActionButton(backgroundColor: MyTheme.darkBluishColor,onPressed:(){
        Navigator.pushNamed(context, MyRoutes.cartRoute);
      } ,child: Icon(Icons.shopping_cart_outlined),),
        backgroundColor: MyTheme.creamColor,
        body: SafeArea(
          child: Container(
              padding: Vx.m32,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CatlogHeader(),
                  if (HomePage.prod != null && HomePage.prod!.isNotEmpty)
                    ShowCatlogList().pOnly(top: 16).expand()
                  else
                    CircularProgressIndicator().centered().expand()
                ],
              )),
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
