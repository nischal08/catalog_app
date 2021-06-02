class Item {
  final String id;
  final String name;
  final String description;
  final num price;
  final String color;
  final String image;
  Item({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.color,
    required this.image,
  });
}

final products = [
  Item(
    id: "Codepur001",
    name: 'iPhone 12 pro',
    description: 'Apple iphone 12th generation',
    price: 999,
    color: "#33505a",
    image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRISJ6msIu4AU9_M9ZnJVQVFmfuhfyJjEtbUm3ZK11_8IV9TV25-1uM5wHjiFNwKy99w0mR5Hk&usqp=CAc",
  )
];
