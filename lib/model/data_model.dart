class DataModel {
  String name;
  String img;
  int price;
  int people;
  int stars;
  String description;
  String location;
  DataModel({
    required this.name,
    required this.img,
    required this.price,
    required this.people,
    required this.stars,
    required this.description,
    required this.location,
  });

  // Server we get json after we decoding we want to convert map object  and flutter understands map

// we need to declare new method
// key are always string and dynamic are values
// we have a variable call json  and we will sent infomraiton to json and it will hold the api keys
  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      name: json["name"],
      img: json["img"],
      price: json["price"],
      people: json["people"],
      stars: json["stars"],
      description: json["description"],
      location: json["location"],
    );
  }
}
