class User {
  String serverId = '';
  String name = '';
  String id = '';
  List<String> customCategory = [];
  List<String> inviteWorks = [];

  User({
    this.serverId = '',
    this.name = '',
    this.id = '',
    this.customCategory = const [],
    this.inviteWorks = const [],
  });

  User.fromJson(Map<String, dynamic> json) {
    serverId = json['serverId'];
    name = json['name'];
    id = json['id'];
    customCategory = [];
    if (json['customCategory'] != null) {
      json['customCategory'].forEach((v) {
        customCategory.add(v);
      });
    }
    inviteWorks = [];
    if (json['inviteWorks'] != null) {
      json['inviteWorks'].forEach((v) {
        inviteWorks.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['customCategory'] = customCategory;
    data['id'] = id;
    data['name'] = name;
    data['serverId'] = serverId;
    data['inviteWorks'] = inviteWorks;
    return data;
  }
}
