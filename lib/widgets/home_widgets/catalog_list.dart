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
    return ListView.builder(
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
        child: Row(
      children: [
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
              ).pOnly(right: 10.0)
            ],
          ),
        )
      ],
    )).color(context.cardColor).rounded.square(150).make().py16();
  }
}


