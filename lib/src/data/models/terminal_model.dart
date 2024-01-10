import 'dart:convert';

class Terminal {
  final int id;
  final String name;
  final String address;
  final String state;
  final String lat;
  final String lng;
  final String status;
  final String created_at;
  final String updated_at;
  const Terminal({
    required this.name,
    required this.address,
    required this.state,
    required this.lat,
    required this.lng,
    required this.status,
    required this.created_at,
    required this.updated_at,
    required this.id,
  });
  // static Terminal fromJson(dynamic json) {
  //   Terminal terminal = Terminal(
  //     id: json['id'],
  //     name: json['name'],
  //     lat: json['lat'],
  //     lng: json['lng'],
  //     status: json['status'],
  //     created_at: json['created_at'],
  //     updated_at: json['updated_at'],
  //     address: json['address'],
  //     state: json['state'],
  //   );
  //   return terminal;
  // }

  // dynamic toJson() {
  //   final dynamic data = dynamic;
  //   data['id'] = id;
  //   data['name'] = name;
  //   data['status'] = status;
  //   data['created_at'] = created_at;
  //   data['updated_at'] = updated_at;
  //   data['address'] = address;
  //   data['state'] = state;
  //   data['lat'] = lat;
  //   data['lng'] = lng;
  //   return data;
  // }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'lat': lat,
      'lng': lng,
      'status': status,
      'created_at': created_at,
      'updated_at': updated_at,
      'address': address,
      'state': state,
      // Exclude 'imageUrl' from the map
    };
  }

  factory Terminal.fromMap(Map<String, dynamic> map) {
    return Terminal(
      id: map['id'],
      name: map['name'],
      lat: map['lat'],
      lng: map['lng'],
      status: map['status'],
      created_at: map['created_at'],
      updated_at: map['updated_at'],
      address: map['address'],
      state: map['state'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Terminal.fromJson(String source) =>
      Terminal.fromMap(json.decode(source));
}
