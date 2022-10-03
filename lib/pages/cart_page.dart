import 'package:catlog_flutter/models/cart.dart';
import 'package:catlog_flutter/models/catlogconvert.dart';
import 'package:catlog_flutter/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/store.dart';

class CartPage extends StatelessWidget {
  CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("CartPage");
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
        // titleTextStyle: TextStyle(color: context.theme.textTheme.headline6!.color),
      ),
      body: Column(
        children: [_CartList().p32().expand(), Divider(), _CartTotal()],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  _CartTotal({Key? key}) : super(key: key);
    final CartModel _cart=(VxState.store as MyStore).cartModel;

  @override
  Widget build(BuildContext context) {
    // VxState.watch(context, on: [PriceMutation]);
    print("CartTotal");
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxConsumer(
            builder: (context,Null,_){
              return "\$${_cart.totalPrice}"
                  .text
                  .xl5
                  .color(context.theme.focusColor)
                  .make();
            }, mutations:{RemoveMutation},
          ),
          30.widthBox,
          ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: "Buying Not Supported Yet".text.make()));
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(context
                          .theme.floatingActionButtonTheme.backgroundColor)),
                  child: "Buy".text.color(Colors.white).make())
              .w32(context)
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  _CartList({Key? key}) : super(key: key);
  final CartModel _cart=(VxState.store as MyStore).cartModel;
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation,RemoveMutation]);
    print("CartList");
    return _cart.products.isEmpty?"Cart is Empty".text.center.xl3.make():ListView.builder(
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.done),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            RemoveMutation(_cart.products[index]);
            // PriceMutation();
          },
        ),
        title: _cart.products[index].name.text.make(),
      ),
      itemCount: _cart.products.length,
    );
  }
}
