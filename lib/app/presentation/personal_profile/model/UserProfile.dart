class UserProfile {
  UserProfile({
    required this.UserName,
    required this.Email,
    required this.CreationDate,
  });
  late final String UserName;
  late final String Email;
  late final String CreationDate;
  
  UserProfile.fromJson(Map<String, dynamic> json){
    UserName = json['UserName'];
    Email = json['Email'];
    CreationDate = json['CreationDate'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['UserName'] = UserName;
    _data['Email'] = Email;
    _data['CreationDate'] = CreationDate;
    return _data;
  }
}