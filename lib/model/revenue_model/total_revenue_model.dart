class Revenue {
  final String totalRevenue;

  Revenue({required this.totalRevenue});

  factory Revenue.fromJson(Map<String, dynamic> json) {
    return Revenue(
      totalRevenue: json['total_revenue'],
    );
  }
}
