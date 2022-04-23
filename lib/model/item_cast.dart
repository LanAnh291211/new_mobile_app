class ItemCastDemo {
  String name;
  String character;
  String urlImage;
  ItemCastDemo({
    this.name = '',
    this.character = '',
    this.urlImage = '',
  });
}

final List<ItemCastDemo> listItemCast = [
  ItemCastDemo(name: "Hideo Ishikawa", character: "Itachi (voice)", urlImage: "assets/images/hideo_ishikawa-itachi.jpg"),
  ItemCastDemo(name: "Hidekatsu Shibata", character: "Sarutobi (voice)", urlImage: "assets/images/hidekatsu_shibata-Sarutobi.jpg"),
  ItemCastDemo(name: "Junko Takeuchi", character: "Naruto (voice)", urlImage: "assets/images/junko_takeuchi-Naruto.jpg"),
  ItemCastDemo(name: "Kazuhiko Inoue", character: "Kakashi (voice)", urlImage: "assets/images/Kazuhiko_Inoue_Kakashi.jpg"),
  ItemCastDemo(name: "Mizuki Nana", character: "Hinata (voice)", urlImage: "assets/images/Mizuki_Nana-Hinata.jpg"),
  ItemCastDemo(name: "Noriaki Sugiyama", character: "Sasuke (voice)", urlImage: "assets/images/Noriaki_Sugiyama_Sasuke.jpg"),
  ItemCastDemo(name: "Tamura Yukari", character: "Tenten (voice)", urlImage: "assets/images/Tamura_Yukari-Tenten.jpg"),
  ItemCastDemo(name: "Toshiyuki Morikawa", character: "Minato (voice)", urlImage: "assets/images/toshiyuki_morikawa-Minato.jpg"),
];
// điện thoại em nó bị lag ý a ,a chờ xíu ý 
class ItemCast {
  bool? adult;
  int? gender;
  int? id;

  String? knownForDepartment;
  String? name;
  String? originalName;
  double? popularity;
  String? profilePath;
  int? castId;
  String? character;
  String? creditId;
  int? order;

  ItemCast(
      {this.adult,
      this.gender,
      this.id,
      this.knownForDepartment,
      this.name,
      this.originalName,
      this.popularity,
      this.profilePath,
      this.castId,
      this.character,
      this.creditId,
      this.order});

  ItemCast.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    gender = json['gender'];
    id = json['id'];
    knownForDepartment = json['known_for_department'];
    name = json['name'];
    originalName = json['original_name'];
    popularity = json['popularity'];
    profilePath = "https://image.tmdb.org/t/p/w500" + json['profile_path'].toString();
    castId = json['cast_id'];
    character = json['character'];
    creditId = json['credit_id'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adult'] = this.adult;
    data['gender'] = this.gender;
    data['id'] = this.id;
    data['known_for_department'] = this.knownForDepartment;
    data['name'] = this.name;
    data['original_name'] = this.originalName;
    data['popularity'] = this.popularity;
    data['profile_path'] = this.profilePath;
    data['cast_id'] = this.castId;
    data['character'] = this.character;
    data['credit_id'] = this.creditId;
    data['order'] = this.order;
    return data;
  }
}
