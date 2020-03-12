class RegistrationInfo {
    Data data;
    String message;
    int status;
    String user_msg;

    RegistrationInfo({this.data, this.message, this.status, this.user_msg});

    factory RegistrationInfo.fromJson(Map<String, dynamic> json) {
        return RegistrationInfo(
            data: json['data'] != null ? Data.fromJson(json['data']) : null,
            message: json['message'],
            status: json['status'],
            user_msg: json['user_msg'],
        );
    }

}

class Data {
  String access_token;
  Object country_id;
  String created;
  Object dob;
  String email;
  String first_name;
  String gender;
  int id;
  bool is_active;
  String last_name;
  String modified;
  String phone_no;
  Object profile_pic;
  int role_id;
  String username;

  Data(
      {this.access_token, this.country_id, this.created, this.dob, this.email, this.first_name, this.gender, this.id, this.is_active, this.last_name, this.modified, this.phone_no, this.profile_pic, this.role_id, this.username});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      access_token: json['access_token'],
      country_id: json['country_id'] != null ? json['country_id'] : null,
      created: json['created'],
      dob: json['dob'] != null ? json['dob'] : null,
      email: json['email'],
      first_name: json['first_name'],
      gender: json['gender'],
      id: json['id'],
      is_active: json['is_active'],
      last_name: json['last_name'],
      modified: json['modified'],
      phone_no: json['phone_no'],
      profile_pic: json['profile_pic'] != null ? json['profile_pic'] : null,
      role_id: json['role_id'],
      username: json['username'],
    );
  }
}
