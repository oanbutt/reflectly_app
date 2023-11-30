
class UserModel {
  String name;
  String deviceId;
  String image;
  List favList;


  UserModel({
    required this.name,
    required this.deviceId,
    required this.image,
    required this.favList,
});


  Map<String, dynamic> toMap () {
    return {
      'name' : name,
      'deviceId' : deviceId,
      'image' : image,
      'favList' : favList,

    };
  }

}