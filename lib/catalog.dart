import 'dart:core';


class Item1 {
  final int id;
  final String name;
  final String image;
  final bool verify;
  Item1({ required this.id,  required this.name,   required this.image,required this.verify});
  factory Item1.fromMap(Map<String,dynamic> map){
    return Item1(
      id: map["id"],
      name: map["name"],
      image: map["image"],
      verify: map["verify"],
    );
  }
  toMap()=>{
    "id":id,
    "name":name,
    "image":image,
    "verify":verify,
  };
}

class CatalogModel {
  static  List<Item1> item=[

  ];
}