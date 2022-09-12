class UserModel {
  int? id;
  String? name;
  int? age;
  int? gender;
  String? country;
  String? city;
  String? phone;
  String? email;
  String? password;
  String? image;

  UserModel(
      {
        this.id,
        this.name,
        this.age,
        this.gender,
        this.country,
        this.city,
        this.phone,
        this.email,
        this.password,
        this.image});

  UserModel.fromJson(Map<String, dynamic> json) {
    id       = json['id'];
    name     = json['name'];
    age      = json['age'];
    gender   = json['gender'];
    country  = json['country'];
    city     = json['city'];
    phone    = json['phone'];
    email    = json['email'];
    password = json['password'];
    image    = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id']       = this.id;
    data['name']     = this.name;
    data['age']      = this.age;
    data['gender']   = this.gender;
    data['country']  = this.country;
    data['city']     = this.city;
    data['phone']    = this.phone;
    data['email']    = this.email;
    data['password'] = this.password;
    data['image']    = this.image;
    return data             ;
  }
}
