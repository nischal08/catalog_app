import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/pages/add_to_cart.dart';
import 'package:catalog_app/utils/routes.dart';
import 'package:catalog_app/widgets/home_widgets/catalog_image.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !Vx.isAndroid
        ? GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 40,
              mainAxisSpacing: 40,
            ),
            shrinkWrap: true,
            itemCount: CatalogModel.items!.length,
            itemBuilder: (context, index) {
              final catalog = CatalogModel.items![index];
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, MyRoutes.homeDetailRoute,
                      arguments: catalog);
                },
                child: CatalogItem(
                  catalog: catalog,
                ),
              );
            },
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: CatalogModel.items!.length,
            itemBuilder: (context, index) {
              final catalog = CatalogModel.items![index];
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, MyRoutes.homeDetailRoute,
                      arguments: catalog);
                },
                child: CatalogItem(
                  catalog: catalog,
                ),
              );
            },
          );
  }
}

class CatalogItem extends StatelessWidget {
  final Item? catalog;
  const CatalogItem({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Body(catalog: catalog),
    ).color(context.cardColor).rounded.make().py16();
  }
}

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  final Item? catalog;

  @override
  Widget build(BuildContext context) {
    var children2 = [
      Hero(
          tag: Key(catalog!.id.toString()),
          child: CatalogImage(catalogImg: catalog!.image)),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog!.name.text.lg.color(context.accentColor).bold.make(),
            catalog!.desc.text.textStyle(context.captionStyle!).make(),
            10.heightBox,
            ButtonBar(
              buttonPadding: EdgeInsets.zero,
              alignment: MainAxisAlignment.spaceBetween,
              children: [
                "\$${catalog!.price}".text.bold.make(),
                AddToCart(catalog),
              ],
            )
          ],
        ).p(context.isMobile?0:16),
      ).p(context.isMobile ? 0 : 16)
    ];
    return context.isMobile
        ? Row(
            children: children2,
          )
        : Column(
            children: children2,
          );
  }
}

class LargeDeviceUIBody extends StatelessWidget {
  const LargeDeviceUIBody({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  final Item? catalog;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
            tag: Key(catalog!.id.toString()),
            child: CatalogImage(catalogImg: catalog!.image)),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catalog!.name.text.xl5.color(context.accentColor).bold.make(),
                catalog!.desc.text.lg.textStyle(context.captionStyle!).make(),
                20.heightBox,
                ButtonBar(
                  buttonPadding: EdgeInsets.zero,
                  alignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "\$${catalog!.price}".text.xl4.bold.make(),
                    AddToCart(catalog).wh(120, 60),
                  ],
                ).pOnly(right: 10.0)
              ],
            ),
          ),
        )
      ],
    );
  }
}
