class CatTriviaModel {
  Status? status;
  String? id;
  String? user;
  String? text;
  String? type;
  bool? deleted;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  CatTriviaModel({
    this.status,
    this.id,
    this.user,
    this.text,
    this.type,
    this.deleted,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory CatTriviaModel.fromJson(Map<String, dynamic> json) => CatTriviaModel(
        status: Status.fromJson(json["status"]),
        id: json["_id"],
        user: json["user"],
        text: json["text"],
        type: json["type"],
        deleted: json["deleted"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );
}

class Status {
  dynamic verified;
  int? sentCount;

  Status({
    this.verified,
    this.sentCount,
  });

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        verified: json["verified"],
        sentCount: json["sentCount"],
      );

  Map<String, dynamic> toJson() => {
        "verified": verified,
        "sentCount": sentCount,
      };
}
