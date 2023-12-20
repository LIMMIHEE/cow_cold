import 'package:cow_cold/data/models/reactions/reaction.dart';

class Report {
  String serverId = '';
  String workServerId = '';
  String createUserId = '';
  String createUserName = '';
  String updateDate = '';
  String title = '';
  String content = '';
  List<Reaction> reactions = [];

  Report(
      {this.serverId = '',
      this.workServerId = '',
      this.createUserId = '',
      this.createUserName = '',
      this.updateDate = '',
      this.title = '',
      this.content = '',
      this.reactions = const []});

  Report.fromJson(Map<String, dynamic> json) {
    serverId = json['serverId'];
    workServerId = json['workServerId'];
    createUserId = json['createUserId'];
    createUserName = json['createUserName'];
    updateDate = json['updateDate'];
    title = json['title'];
    content = json['content'];
    reactions = [];
    if (json['reactions'] != null) {
      json['reactions'].forEach((v) {
        reactions.add(Reaction.fromJson(v));
      });
    }
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
    data['reactions'] = reactions;
    data['reactions'] = reactions.map((v) => v.toJson()).toList();
    return data;
  }
}
