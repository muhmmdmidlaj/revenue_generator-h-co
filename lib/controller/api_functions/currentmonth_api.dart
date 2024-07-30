import 'package:revenue_generator/model/revenue_model/today_revenue_model.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Stream<TodayRevenueData> getMonthRevenueStream() async* {
  while (true) {
    final response = await http.get(
        Uri.parse('http://192.168.1.64:3003/webhooks/orders/current-month'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      yield TodayRevenueData.fromJson(data);
    } else {
      print('data fetching faild');
      throw Exception('Failed to load revenue');
    }
    await Future.delayed(Duration(seconds: 3)); // Adjust the interval as needed
  }
}
