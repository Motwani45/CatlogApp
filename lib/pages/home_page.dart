import 'package:catlog_flutter/core/store.dart';
import 'package:catlog_flutter/models/cart.dart';
import 'package:catlog_flutter/utils/routes.dart';
import 'package:catlog_flutter/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;
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
 static final url = "api.jsonbin.io";

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
    final _cart = (VxState.store as MyStore).cartModel;
    return Scaffold(
        floatingActionButton: VxBuilder(
          builder: (context, Null, _) {
            return FloatingActionButton(
              backgroundColor:
              context.theme.floatingActionButtonTheme.backgroundColor,
              onPressed: () {
                context.vxNav.push(Uri.parse(MyRoutes.cartRoute));

              },
              child: Icon(
                Icons.shopping_cart_outlined,
                color: Colors.white,
              ),
            ).badge(color: Vx.red500,
                size: 22,
                count: _cart.products.length,
                textStyle: TextStyle(color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.bold));
          }, mutations: {AddMutation, RemoveMutation}
          ,
        ),
        backgroundColor: context.canvasColor,
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
                    CircularProgressIndicator(
                      color: context
                          .theme.floatingActionButtonTheme.backgroundColor,
                    ).centered().expand()
                ],
              )),
        ));
  }
}

Future<List<Product>> loadData() async {
  // await Future.delayed(Duration(seconds: 2), () async {
  try {
    print("Entered loadData() function");
    late dynamic catalogJson;
    //   var uri =
    //   Uri.https(_HomePageState.url,"/b/604dbddb683e7e079c4eefd3");
    //
    //   // Await the http get response, then decode the json-formatted response.
    //   var response = await http.get(uri,headers: { "Access-Control-Allow-Origin": "*", // Required for CORS support to work
    //     "Access-Control-Allow-Credentials":"" , // Required for cookies, authorization headers with HTTPS
    //     "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
    //     "Access-Control-Allow-Methods": "POST, OPTIONS"});
    //   if(response.statusCode==200){
    //     print("response mil gaya ${response.body}");
    //   catalogJson=response.body;
    //   }
    // else {
        print("http nhi mila ");
        catalogJson = await rootBundle.loadString("assets/files/catalog.json");
      // }
    // final catalogJson =
    //     await rootBundle.loadString("assets/files/catalog.json");
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
