import 'package:catalog_app/models/catalog.dart';

class CartModel {
  late CatalogModel? _catalog;
  final List<int> _itemIds = [];

  CatalogModel get catalog => _catalog!;

  set catalog(CatalogModel? newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  //Get item in cart

  List<Item> get items => _itemIds.map((id) => _catalog!.getById(id)).toList();

  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  //Add item
  void add(Item item) {
    _itemIds.add(item.id);
  }

  //Remove item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
