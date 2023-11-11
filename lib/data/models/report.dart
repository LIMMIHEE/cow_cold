class Report {
  String serverId = '';
  String workServerId = '';
  String createUserId = '';
  String createUserName = '';
  String updateDate = '';
  String title = '';
  String content = '';

  Report(
      {this.serverId = '',
      this.workServerId = '',
      this.createUserId = '',
      this.createUserName = '',
      this.updateDate = '',
      this.title = '',
      this.content = ''});

  Report.fromJson(Map<String, dynamic> json) {
    serverId = json['serverId'];
    workServerId = json['workServerId'];
    createUserId = json['createUserId'];
    createUserName = json['createUserName'];
    updateDate = json['updateDate'];
    title = json['title'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['serverId'] = serverId;
    data['workServerId'] = workServerId;
    data['createUserId'] = createUserId;
    data['createUserName'] = createUserName;
    data['updateDate'] = updateDate;
    data['title'] = title;
    data['content'] = content;
    return data;
  }
}
