class AddressModel {
  String street;
  String city;
  String area;

  AddressModel({
    required this.street,
    required this.city,
    required this.area,
  });
  Map<String, dynamic> toMap() {
    return {
      'street': street,
      'city': city,
      'area': area,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      street: map['street'],
      city: map['city'],
      area: map['area'],
    );
  }
}
