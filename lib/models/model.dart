class NodeModel {
  late String title;
  late String body;
  late String name;
  // late String uId;
  // late String? image;
  late String time;
  late String data;

  NodeModel({
    required this.title,
    required this.body,
    required this.name,
    // required this.uId,
    // this.image,
    required this.data,
    required this.time,
  });
  NodeModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    // uId = json['uId'];
    data = json['data'];
    time = json['time'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      // 'uId': uId,
      'data': data,
      'time': time,
      'title': title,
      'body': body,
    };
  }
}
