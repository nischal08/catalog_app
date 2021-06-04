import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/pages/add_to_cart.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  Item? catalog;

  @override
  Widget build(BuildContext context) {
    catalog = ModalRoute.of(context)!.settings.arguments as Item;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          buttonPadding: EdgeInsets.zero,
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            "\$${catalog!.price}".text.bold.xl4.red800.make(),
            AddToCart(catalog).wh(150, 50)
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog!.id.toString()),
              child: Image.network(catalog!.image),
            ).h32(context),
            Expanded(
              child: VxArc(
                height: 30.0,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  width: context.screenWidth,
                  color: context.cardColor,
                  child: Column(
                    children: [
                      catalog!.name.text.xl4
                          .color(context.accentColor)
                          .bold
                          .make(),
                      catalog!.desc.text
                          .textStyle(context.captionStyle!)
                          .make(),
                      10.heightBox,
                      "The iPhone 12 and iPhone 12 mini are Apple's mainstream flagship iPhones for 2020. The phones come in 6.1-inch and 5.4-inch sizes with identical features, including support for faster 5G cellular networks, OLED displays, improved cameras."
                          .text
                          .textStyle(context.captionStyle!)
                          .make()
                          .p16()
                    ],
                  ).py64(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
