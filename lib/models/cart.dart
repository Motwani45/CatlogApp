
import 'package:catlog_flutter/core/store.dart';
import 'package:catlog_flutter/models/catlogconvert.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  late CatlogConvert _catlog;

  CatlogConvert get catlog => _catlog;

  set catlog(CatlogConvert newCatlog) {
    assert(newCatlog != null);
    _catlog = newCatlog;
  }

  final List<int> _productIds = [];

  List<Product> get products =>
      _productIds.map((id) => _catlog.getById(id)).toList();

//Get Total Price
  num get totalPrice =>
      products.fold(0, (total, current) => total + current.price);

//Add Product
  void addProduct(Product product) {
    _productIds.add(product.id);
  }

  void removeProduct(Product product) {
    _productIds.remove(product.id);
  }
}
class AddMutation extends VxMutation<MyStore>{
  final Product product;

  AddMutation(this.product);

  @override
  perform() {
  store!.cartModel._productIds.add(product.id);
  }

}
class RemoveMutation extends VxMutation<MyStore>{
  final Product product;

  RemoveMutation(this.product);

  @override
  perform() {
  store!.cartModel._productIds.remove(product.id);
  }

}
class PriceMutation extends VxMutation{
  // final Product product;
  // PriceMutation(this.product);
  @override
  perform() {

  }

}