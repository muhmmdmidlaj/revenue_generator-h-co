class TodayRevenueData {
  final String date;
  final String total;

  TodayRevenueData({required this.date, required this.total});

  // Factory method to create an instance from JSON
  factory TodayRevenueData.fromJson(Map<String, dynamic> json) {
    return TodayRevenueData(
      date: json['date'],
      total: json['total'],
    );
  }
}
