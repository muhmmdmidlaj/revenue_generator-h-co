import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:revenue_generator/controller/api_functions/currentmonth_api.dart';
import 'package:revenue_generator/controller/api_functions/today_api_function.dart';
import 'package:revenue_generator/controller/api_functions/total_api_functions.dart';
import 'package:revenue_generator/model/revenue_model/today_revenue_model.dart';
import 'package:revenue_generator/model/revenue_model/total_revenue_model.dart';

class Allpage extends StatelessWidget {
  const Allpage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      bottom: 10,
                      left: screenWidth * 0.05,
                      top: screenHeight * 0.03),
                  child: Image.asset(
                    'asset/Group 44.png',
                    width: screenWidth * 0.10,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: screenHeight * 0.08,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Card(
                            child: Container(
                              height: screenHeight * 0.30,
                              width: screenWidth * 0.45,
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(167, 239, 237, 237),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Today Revenue Snapshot',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        fontSize: screenWidth * 0.015),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 7),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: StreamBuilder<TodayRevenueData>(
                                        stream: getTodayRevenueStream(),
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState ==
                                              ConnectionState.waiting) {
                                            return const CircularProgressIndicator();
                                          } else if (snapshot.data?.total ==
                                              null) {
                                            return Text(
                                              '₹ 0.00',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: screenWidth * 0.036,
                                              ),
                                            );
                                          } else if (snapshot.hasError) {
                                            return Text(
                                                'Error: ${snapshot.error}');
                                          } else if (!snapshot.hasData) {
                                            return const Text(
                                                'No data available');
                                          } else {
                                           
                                            final revenue = double.parse(
                                                snapshot.data!.total);
                                            return TweenAnimationBuilder(
                                              tween: Tween<double>(
                                                  begin: 0, end: revenue),
                                              duration:
                                                  const Duration(seconds: 2),
                                              builder: (context, value, child) {
                                                return Text(
                                                  '₹ ${value.toStringAsFixed(2)}',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize:
                                                          screenWidth * 0.036),
                                                );
                                              },
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Card(
                            child: Container(
                              height: screenHeight * 0.30,
                              width: screenWidth * 0.45,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(167, 239, 237, 237),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Monthly Revenue Breakdown',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        fontSize: screenWidth * 0.015),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 7),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: StreamBuilder<TodayRevenueData>(
                                        stream: getMonthRevenueStream(),
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState ==
                                              ConnectionState.waiting) {
                                            return const CircularProgressIndicator();
                                          } else if (snapshot.data?.total ==
                                              null) {
                                            return Text(
                                              '₹ 0.00',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: screenWidth * 0.036,
                                              ),
                                            );
                                          } else if (snapshot.hasError) {
                                            return Text(
                                                'Error: ${snapshot.error}');
                                          } else {
                                          
                                            final revenue = double.parse(
                                                snapshot.data!.total);
                                            return TweenAnimationBuilder(
                                              tween: Tween<double>(
                                                  begin: 0, end: revenue),
                                              duration:
                                                  const Duration(seconds: 2),
                                              builder: (context, value, child) {
                                                return Text(
                                                  '₹ ${value.toStringAsFixed(2)}',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize:
                                                          screenWidth * 0.036),
                                                );
                                              },
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Center(
                        child: Card(
                          child: Container(
                            height: screenHeight * 0.30,
                            width: screenWidth * 0.60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color.fromARGB(167, 239, 237, 237),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Total Revenue Generated',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontSize: screenWidth * 0.015),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 7),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: StreamBuilder<Revenue>(
                                      stream: getRevenueStream(),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return const CircularProgressIndicator();
                                        } else if (snapshot
                                                .data?.totalRevenue ==
                                            null) {
                                          return Text(
                                            '₹ 0.00',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: screenWidth * 0.036,
                                            ),
                                          );
                                        } else if (snapshot.hasError) {
                                          return Text(
                                              'Error: ${snapshot.error}');
                                        } else {
                                          
                                          final revenue = double.parse(
                                              snapshot.data!.totalRevenue);
                                          return TweenAnimationBuilder(
                                            tween: Tween<double>(
                                                begin: 0, end: revenue),
                                            duration:
                                                const Duration(seconds: 2),
                                            builder: (context, value, child) {
                                              return Text(
                                                '₹ ${value.toStringAsFixed(2)}',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize:
                                                        screenWidth * 0.036),
                                              );
                                            },
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
