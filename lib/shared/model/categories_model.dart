
class CategoriesModel {

  int? id;
  int? index;
  String? titleAppBar;
  String? name;
  String? hintSearch;
  List<dynamic>? items;
  bool? end;
  String? pathIcon;

  CategoriesModel({
    this.id,
    this.index,
    this.name,
    this.titleAppBar,
    this.items,
    this.hintSearch,
    this.end,
    this.pathIcon,
});

  CategoriesModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    index = json['index'];
    titleAppBar = json['title_app_bar'];
    name = json['name'];
    items = json['items'];
    hintSearch = json['hintSearch'];
    end = json['end'];
    pathIcon = json['path_icon'];
  }
}