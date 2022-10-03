import 'package:catlog_flutter/models/cart.dart';
import 'package:catlog_flutter/models/catlogconvert.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore{
  late CatlogConvert catlogConvert;
  late CartModel cartModel;
  MyStore(){
    print("My Store Initialized");
    catlogConvert=CatlogConvert(products:[]);
    cartModel=CartModel();
  }

}