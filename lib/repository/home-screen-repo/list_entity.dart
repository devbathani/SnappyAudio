class ListEntity {
 
  String imgUrl;

  ListEntity({
    
    required this.imgUrl,
  });

  factory ListEntity.fromJson(Map<String, dynamic> json) => ListEntity(
       
        imgUrl: json["imgUrl"],
      );

  Map<String, dynamic> toJson() => {
        
        "imgUrl": imgUrl, 
      };
}
