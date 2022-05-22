class Items {
  var id;
  String title;
  // String description;
  var price;
  String image;
  // String category;

  Items({
    required this.id,
    required this.title,
    //required this.category,
    //required this.description,
    required this.image,
    required this.price,
  });
  factory Items.fromjson(Map<String, dynamic> item) {
    return Items(
      id: item['id'],
      title: item['title'],
      // category: item['category'],
      //description: item['description'],
      image: item['image'],
      price: item['price'],
    );
  }
}

List<Items> getItemsByApi = [];
