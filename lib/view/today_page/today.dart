import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:revenue_generator/controller/api_functions/today_api_function.dart';
import 'package:revenue_generator/model/revenue_model/today_revenue_model.dart';

class Todaypage extends StatelessWidget {
  const Todaypage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * 0.05, top: screenHeight * 0.03),
              child: Image.asset(
                'asset/Group 44.png',
                width: screenWidth * 0.10,
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(
                  top: screenHeight * 0.06,
                ),
                child: Card(
                  child: Container(
                    width: screenWidth * 0.85,
                    height: screenHeight * 0.65,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromARGB(167, 239, 237, 237),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: screenHeight * 0.05),
                          child: Text(
                            'Today Revenue Generated',
                            style: GoogleFonts.poppins(
                              fontSize: screenWidth * 0.02,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        StreamBuilder<TodayRevenueData>(
                          stream: getTodayRevenueStream(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return CircularProgressIndicator();
                            } else if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else if (!snapshot.hasData) {
                              return Text('No data available');
                            } else {
                              return Text(
                                snapshot.data!.total,
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: screenWidth * 0.06,
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
