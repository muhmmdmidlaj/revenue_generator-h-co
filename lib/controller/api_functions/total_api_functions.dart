import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:revenue_generator/model/revenue_model/total_revenue_model.dart';

Stream<Revenue> getRevenueStream() async* {
  while (true) {
    final response = await http
        .get(Uri.parse('http://192.168.193.164:3003/walkaroo/showRevenue'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      yield Revenue.fromJson(data);
    } else {
      print('data fetching faild');
      throw Exception('Failed to load revenue');
    }
    await Future.delayed(Duration(seconds: 1)); // Adjust the interval as needed
  }
}
