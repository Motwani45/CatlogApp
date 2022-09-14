class Item{
  final String? name,desc,color,image;
  final num? price,id;
  Item({this.id, this.name, this.desc, this.color, this.image, this.price});
  factory Item.fromMap( Map<String,dynamic> map){
   return Item(id: map["id"],name: map["name"],desc: map["desc"],color: map["color"],image: map["image"],price: map["price"],);
  }
toMap()=>{
  "id":id,
  "image":image,
  "name":name,
  "desc":desc,
  "color":color,
  "price":price,
};
}

class CatlogItems{
  static List<Item> items=[];
}
