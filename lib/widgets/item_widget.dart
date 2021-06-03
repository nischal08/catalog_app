import 'package:catalog_app/models/catalog.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      // shape: StadiumBorder(),
      child: ListTile(
        onTap: () {
          print("${item.name}");
        },
        title: Text(item.name),
        subtitle: Text(item.desc),
        leading: Image.network(item.image),
        trailing: Text(
          "\$${item.price.toString()}",
          textScaleFactor: 1.5,
          style: TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
