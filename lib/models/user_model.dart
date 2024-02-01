class UserModel{
  String id,name,education,address,gender,phone;

//<editor-fold desc="Data Methods">
  UserModel({
    required this.id,
    required this.name,
    required this.education,
    required this.address,
    required this.gender,
    required this.phone,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          education == other.education &&
          address == other.address &&
          gender == other.gender &&
          phone == other.phone);

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      education.hashCode ^
      address.hashCode ^
      gender.hashCode ^
      phone.hashCode;

  @override
  String toString() {
    return 'UserModel{' +
        ' id: $id,' +
        ' name: $name,' +
        ' education: $education,' +
        ' address: $address,' +
        ' gender: $gender,' +
        ' phone: $phone,' +
        '}';
  }

  UserModel copyWith({
    String? id,
    String? name,
    String? education,
    String? address,
    String? gender,
    String? phone,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      education: education ?? this.education,
      address: address ?? this.address,
      gender: gender ?? this.gender,
      phone: phone ?? this.phone,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'education': this.education,
      'address': this.address,
      'gender': this.gender,
      'phone': this.phone,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      name: map['name'] as String,
      education: map['education'] as String,
      address: map['address'] as String,
      gender: map['gender'] as String,
      phone: map['phone'] as String,
    );
  }

//</editor-fold>
}