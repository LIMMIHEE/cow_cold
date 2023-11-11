class User {
  String serverId = '';
  String name = '';
  String id = '';
  List<String> customCategory = [];

  User(
      {this.serverId = '',
      this.name = '',
      this.id = '',
      this.customCategory = const []});

  User.fromJson(Map<String, dynamic> json) {
    serverId = json['serverId'];
    name = json['name'];
    id = json['id'];
    if (json['customCategory'] != null) {
      customCategory = [];
      json['customCategory'].forEach((v) {
        customCategory!.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (customCategory != null) {
      data['customCategory'] = customCategory;
    }
    data['id'] = id;
    data['name'] = name;
    data['serverId'] = serverId;
    return data;
  }
}
