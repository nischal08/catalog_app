import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogImage extends StatelessWidget {
  final catalogImg;
  const CatalogImage({Key? key, this.catalogImg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(catalogImg)
        .box
        .rounded
        .p8
        .color(context.canvasColor)
        .make()
        .p16()
        .w40(context);
  }
}
