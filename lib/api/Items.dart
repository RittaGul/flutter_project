class Items {
  /////////عرفت متغيرات متل مانها مكتوبة بصفحة الapi
  var id;
  String title;
  var price;
  String image;
/////////////لحتى ياخد البيانات من الكلاس
  Items({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
  });
  ////////////نوع البيانات ماب
  factory Items.fromjson(Map<String, dynamic> item) {
    return Items(
      id: item['id'],
      title: item['title'],
      image: item['image'],
      price: item['price'],
    );
  }
}

///////////منعمل ليست من نوع الكلاس
List<Items> getItemsByApi = [];
