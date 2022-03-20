class IP_Data {
  late String name;
  late String ipv4;
  late String ipv6;
  late String time;

  IP_Data(
    this.name,
    this.ipv4,
    this.ipv6,
    this.time
  );

  IP_Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    ipv4 = json['ipv4'];
    ipv6 = json['ipv6'];
    time=json['time'];
  }
}
