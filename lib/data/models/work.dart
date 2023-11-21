class Work {
  String serverId = '';
  String createUserId = '';
  String createUserName = '';
  String updateDate = '';
  String title = '';
  String category = '';
  String description = '';
  String inviteCode = '';

  Work({
    this.serverId = '',
    this.createUserId = '',
    this.createUserName = '',
    this.updateDate = '',
    this.title = '',
    this.category = '',
    this.description = '',
    this.inviteCode = '',
  });

  Work.fromJson(Map<String, dynamic> json) {
    serverId = json['serverId'];
    createUserId = json['createUserId'];
    createUserName = json['createUserName'];
    title = json['title'];
    category = json['category'];
    description = json['description'];
    inviteCode = json['inviteCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['serverId'] = serverId;
    data['createUserId'] = createUserId;
    data['createUserName'] = createUserName;
    data['updateDate'] = updateDate;
    data['title'] = title;
    data['category'] = category;
    data['description'] = description;
    data['inviteCode'] = inviteCode;
    return data;
  }
}
