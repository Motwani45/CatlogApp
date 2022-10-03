import 'package:catlog_flutter/pages/home_detail_page.dart';
import 'package:flutter/material.dart';
// import 'package:velocity_x/velocity_x.dart';

import '../../pages/home_page.dart';
import '../../widgets/product_widget.dart';
// import '../../widgets/themes.dart';

class ShowCatlogList extends StatelessWidget {
  const ShowCatlogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final product = HomePage.prod![index];
        return InkWell(
            onTap:()=> Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeDetailPage(product: product))),
            child: ProductWidget(product: product));
      },
      itemCount: HomePage.prod!.length,
    );
  }
}
