
class SignupModel {
    String? fullName;
    String? email;
    String? state;
    String? city;
    String? locality;
    String? password;
    String? id;
    int? v;

    SignupModel({this.fullName, this.email, this.state, this.city, this.locality, this.password, this.id, this.v});

    SignupModel.fromJson(Map<String, dynamic> json) {
        if(json["fullName"] is String) {
            fullName = json["fullName"];
        }
        if(json["email"] is String) {
            email = json["email"];
        }
        if(json["state"] is String) {
            state = json["state"];
        }
        if(json["city"] is String) {
            city = json["city"];
        }
        if(json["locality"] is String) {
            locality = json["locality"];
        }
        if(json["password"] is String) {
            password = json["password"];
        }
        if(json["_id"] is String) {
            id = json["_id"];
        }
        if(json["__v"] is num) {
            v = (json["__v"] as num).toInt();
        }
    }

    static List<SignupModel> fromList(List<Map<String, dynamic>> list) {
        return list.map(SignupModel.fromJson).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["fullName"] = fullName;
        _data["email"] = email;
        _data["state"] = state;
        _data["city"] = city;
        _data["locality"] = locality;
        _data["password"] = password;
        _data["_id"] = id;
        _data["__v"] = v;
        return _data;
    }

    SignupModel copyWith({
        String? fullName,
        String? email,
        String? state,
        String? city,
        String? locality,
        String? password,
        String? id,
        int? v,
    }) => SignupModel(
        fullName: fullName ?? this.fullName,
        email: email ?? this.email,
        state: state ?? this.state,
        city: city ?? this.city,
        locality: locality ?? this.locality,
        password: password ?? this.password,
        id: id ?? this.id,
        v: v ?? this.v,
    );
}