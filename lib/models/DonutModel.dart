/// _id : "650862b620b6a7d7e06116fa"
/// index : 0
/// guid : "5249809e-0410-4318-a9c9-3d1cafb3f218"
/// isActive : true
/// balance : "$1,521.97"
/// picture : "http://placehold.it/32x32"
/// age : 39
/// eyeColor : "green"
/// name : "Burris Carter"
/// gender : "male"
/// company : "MEGALL"
/// email : "burriscarter@megall.com"
/// phone : "+1 (803) 586-2074"
/// address : "599 Ira Court, Graball, Nebraska, 6145"
/// about : "Ullamco mollit laborum eiusmod sunt proident aliquip consequat veniam. Irure anim proident cupidatat aliqua. Eu ullamco fugiat eiusmod amet consequat magna quis culpa anim ipsum. Aliqua tempor velit ipsum non ullamco irure elit. Amet do mollit ullamco velit velit veniam ut do ut.\r\n"
/// registered : "2022-11-07T01:14:41 -06:-30"
/// latitude : 83.881322
/// longitude : -140.642853
/// tags : ["tempor","ea","proident","reprehenderit","anim","do","reprehenderit"]
/// friends : [{"id":0,"name":"Lorna Castillo"},{"id":1,"name":"Hooper Schmidt"},{"id":2,"name":"Lucinda Farrell"}]
/// greeting : "Hello, Burris Carter! You have 6 unread messages."
/// favoriteFruit : "banana"

// ignore_for_file: file_names

class DonutModel {
  DonutModel({
      String? id, 
      num? index, 
      String? guid, 
      bool? isActive, 
      String? balance, 
      String? picture, 
      num? age, 
      String? eyeColor, 
      String? name, 
      String? gender, 
      String? company, 
      String? email, 
      String? phone, 
      String? address, 
      String? about, 
      String? registered, 
      num? latitude, 
      num? longitude, 
      List<String>? tags, 
      List<Friends>? friends, 
      String? greeting, 
      String? favoriteFruit,}){
    _id = id;
    _index = index;
    _guid = guid;
    _isActive = isActive;
    _balance = balance;
    _picture = picture;
    _age = age;
    _eyeColor = eyeColor;
    _name = name;
    _gender = gender;
    _company = company;
    _email = email;
    _phone = phone;
    _address = address;
    _about = about;
    _registered = registered;
    _latitude = latitude;
    _longitude = longitude;
    _tags = tags;
    _friends = friends;
    _greeting = greeting;
    _favoriteFruit = favoriteFruit;
}

  DonutModel.fromJson(dynamic json) {
    _id = json['_id'];
    _index = json['index'];
    _guid = json['guid'];
    _isActive = json['isActive'];
    _balance = json['balance'];
    _picture = json['picture'];
    _age = json['age'];
    _eyeColor = json['eyeColor'];
    _name = json['name'];
    _gender = json['gender'];
    _company = json['company'];
    _email = json['email'];
    _phone = json['phone'];
    _address = json['address'];
    _about = json['about'];
    _registered = json['registered'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _tags = json['tags'] != null ? json['tags'].cast<String>() : [];
    if (json['friends'] != null) {
      _friends = [];
      json['friends'].forEach((v) {
        _friends?.add(Friends.fromJson(v));
      });
    }
    _greeting = json['greeting'];
    _favoriteFruit = json['favoriteFruit'];
  }
  String? _id;
  num? _index;
  String? _guid;
  bool? _isActive;
  String? _balance;
  String? _picture;
  num? _age;
  String? _eyeColor;
  String? _name;
  String? _gender;
  String? _company;
  String? _email;
  String? _phone;
  String? _address;
  String? _about;
  String? _registered;
  num? _latitude;
  num? _longitude;
  List<String>? _tags;
  List<Friends>? _friends;
  String? _greeting;
  String? _favoriteFruit;
DonutModel copyWith({  String? id,
  num? index,
  String? guid,
  bool? isActive,
  String? balance,
  String? picture,
  num? age,
  String? eyeColor,
  String? name,
  String? gender,
  String? company,
  String? email,
  String? phone,
  String? address,
  String? about,
  String? registered,
  num? latitude,
  num? longitude,
  List<String>? tags,
  List<Friends>? friends,
  String? greeting,
  String? favoriteFruit,
}) => DonutModel(  id: id ?? _id,
  index: index ?? _index,
  guid: guid ?? _guid,
  isActive: isActive ?? _isActive,
  balance: balance ?? _balance,
  picture: picture ?? _picture,
  age: age ?? _age,
  eyeColor: eyeColor ?? _eyeColor,
  name: name ?? _name,
  gender: gender ?? _gender,
  company: company ?? _company,
  email: email ?? _email,
  phone: phone ?? _phone,
  address: address ?? _address,
  about: about ?? _about,
  registered: registered ?? _registered,
  latitude: latitude ?? _latitude,
  longitude: longitude ?? _longitude,
  tags: tags ?? _tags,
  friends: friends ?? _friends,
  greeting: greeting ?? _greeting,
  favoriteFruit: favoriteFruit ?? _favoriteFruit,
);
  String? get id => _id;
  num? get index => _index;
  String? get guid => _guid;
  bool? get isActive => _isActive;
  String? get balance => _balance;
  String? get picture => _picture;
  num? get age => _age;
  String? get eyeColor => _eyeColor;
  String? get name => _name;
  String? get gender => _gender;
  String? get company => _company;
  String? get email => _email;
  String? get phone => _phone;
  String? get address => _address;
  String? get about => _about;
  String? get registered => _registered;
  num? get latitude => _latitude;
  num? get longitude => _longitude;
  List<String>? get tags => _tags;
  List<Friends>? get friends => _friends;
  String? get greeting => _greeting;
  String? get favoriteFruit => _favoriteFruit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['index'] = _index;
    map['guid'] = _guid;
    map['isActive'] = _isActive;
    map['balance'] = _balance;
    map['picture'] = _picture;
    map['age'] = _age;
    map['eyeColor'] = _eyeColor;
    map['name'] = _name;
    map['gender'] = _gender;
    map['company'] = _company;
    map['email'] = _email;
    map['phone'] = _phone;
    map['address'] = _address;
    map['about'] = _about;
    map['registered'] = _registered;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['tags'] = _tags;
    if (_friends != null) {
      map['friends'] = _friends?.map((v) => v.toJson()).toList();
    }
    map['greeting'] = _greeting;
    map['favoriteFruit'] = _favoriteFruit;
    return map;
  }

}

/// id : 0
/// name : "Lorna Castillo"

class Friends {
  Friends({
      num? id, 
      String? name,}){
    _id = id;
    _name = name;
}

  Friends.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }
  num? _id;
  String? _name;
Friends copyWith({  num? id,
  String? name,
}) => Friends(  id: id ?? _id,
  name: name ?? _name,
);
  num? get id => _id;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    return map;
  }

}