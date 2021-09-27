class President {
  String description;
  String avatar;
  String name;
  String location;
  int votes;
  String id;

  President(
      {this.description,
      this.avatar,
      this.name,
      this.location,
      this.votes,
      this.id});

  President.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    avatar = json['avatar'];
    name = json['name'];
    location = json['location'];
    votes = json['votes'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['avatar'] = this.avatar;
    data['name'] = this.name;
    data['location'] = this.location;
    data['votes'] = this.votes;
    data['id'] = this.id;
    return data;
  }
}
