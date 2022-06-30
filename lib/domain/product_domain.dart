class ProductDomain {
  int id;
  String name;
  String tag;
  String image;
  String description;
  int price;
  int discount;
  int stock;
  int sold;
  double rating;

  ProductDomain(
      {required this.id,
      required this.name,
      required this.tag,
      required this.image,
      required this.description,
      required this.price,
      required this.stock,
      required this.discount,
      required this.sold,
      required this.rating});
}
