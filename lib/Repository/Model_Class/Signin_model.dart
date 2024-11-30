
class SigninModel {
    String? token;
    String? id;
    String? fullName;
    String? email;
    String? state;
    String? city;
    String? locality;
    int? v;

    SigninModel({this.token, this.id, this.fullName, this.email, this.state, this.city, this.locality, this.v});

    SigninModel.fromJson(Map<String, dynamic> json) {
        if(json["token"] is String) {
            token = json["token"];
        }
        if(json["_id"] is String) {
            id = json["_id"];
        }
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
        if(json["__v"] is num) {
            v = (json["__v"] as num).toInt();
        }
    }

    static List<SigninModel> fromList(List<Map<String, dynamic>> list) {
        return list.map(SigninModel.fromJson).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["token"] = token;
        _data["_id"] = id;
        _data["fullName"] = fullName;
        _data["email"] = email;
        _data["state"] = state;
        _data["city"] = city;
        _data["locality"] = locality;
        _data["__v"] = v;
        return _data;
    }

    SigninModel copyWith({
        String? token,
        String? id,
        String? fullName,
        String? email,
        String? state,
        String? city,
        String? locality,
        int? v,
    }) => SigninModel(
        token: token ?? this.token,
        id: id ?? this.id,
        fullName: fullName ?? this.fullName,
        email: email ?? this.email,
        state: state ?? this.state,
        city: city ?? this.city,
        locality: locality ?? this.locality,
        v: v ?? this.v,
    );
}