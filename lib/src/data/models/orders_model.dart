class Orders {
  final String id;
  final String distance;
  final String duration;
  final String pickup_code;
  final String charge;
  final String house_number;
  final String tracking_code;
  final String title;
  final String weight;
  final String lat;
  final String lng;

  const Orders({
    required this.id,
    required this.distance,
    required this.duration,
    required this.pickup_code,
    required this.charge,
    required this.house_number,
    required this.tracking_code,
    required this.title,
    required this.weight,
    required this.lat,
    required this.lng,
  });

  factory Orders.fromJson(Map<String, dynamic> json) {
    Orders orders = Orders(
      id: json['id'],
      distance: json['distance'],
      duration: json['duration'],
      pickup_code: json['pickup_code'],
      charge: json['charge'],
      house_number: json['house_number'],
      tracking_code: json['tracking_code'],
      title: json['title'],
      weight: json['weight'],
      lat: json['lat'],
      lng: json['lng'],
    );
    return orders;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['distance'] = distance;
    data['duration'] = duration;
    data['pickup_code'] = pickup_code;
    data['charge'] = charge;
    data['house_number'] = house_number;
    data['tracking_code'] = tracking_code;
    data['tracking_code'] = tracking_code;
    data['title'] = title;
    data['weight'] = weight;
    data['lat'] = lat;
    data['lng'] = lng;
    return data;
  }
}
