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
  static Terminal fromJson(Map<String, dynamic> json) {
    Terminal terminal = Terminal(
      id: json['id'],
      name: json['name'],
      lat: json['lat'],
      lng: json['lng'],
      status: json['status'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
      address: json['address'],
      state: json['state'],
    );
    return terminal;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['status'] = status;
    data['created_at'] = created_at;
    data['updated_at'] = updated_at;
    data['address'] = address;
    data['state'] = state;
    data['lat'] = lat;
    data['lng'] = lng;
    return data;
  }
}
