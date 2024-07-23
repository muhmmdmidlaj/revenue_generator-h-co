import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:revenue_generator/controller/bottomnavprovider.dart';
import 'package:revenue_generator/model/bottom_navitem.dart';
import 'package:revenue_generator/view/all/allpage.dart';
import 'package:revenue_generator/view/monthly_screen/monthly.dart';
import 'package:revenue_generator/view/today_page/today.dart';
import 'package:revenue_generator/view/total/totalpage.dart';

class BottomNavScreen extends StatelessWidget {
  const BottomNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Define your screens
    final List<Widget> screens = [
      const Totalpage(),
      const Todaypage(),
      const Monthlypage(),
      const Allpage(),
    ];

    return Scaffold(
      body:
          screens[Provider.of<BottomNavBarProvider>(context).currentItem.index],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.15,
          width: double.infinity,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 254, 254, 254),
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildNavItem(context, BottomNavItem.total, 'Total'),
              buildNavItem(context, BottomNavItem.today, 'Today'),
              buildNavItem(context, BottomNavItem.monthly, 'Monthly'),
              buildNavItem(context, BottomNavItem.all, 'All'),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNavItem(BuildContext context, BottomNavItem item, String label) {
    BottomNavItem currentItem =
        Provider.of<BottomNavBarProvider>(context).currentItem;

    return GestureDetector(
      onTap: () {
        Provider.of<BottomNavBarProvider>(context, listen: false)
            .setCurrentItem(item);
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.2,
        height: MediaQuery.of(context).size.height * 0.15,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: currentItem == item
              ? const Color.fromARGB(255, 10, 10, 10)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: currentItem == item
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 20, top: 8, bottom: 8),
                    child: getIcon(item, context),
                  ),
                  const SizedBox(height: 4),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      label,
                      style: TextStyle(
                          color:
                              currentItem == item ? Colors.white : Colors.black,
                          fontSize: MediaQuery.of(context).size.height * 0.028,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              )
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  getIcon(item, context),
                  const SizedBox(height: 4),
                  Text(
                    label,
                    style: TextStyle(
                        color:
                            currentItem == item ? Colors.white : Colors.black,
                        fontSize: MediaQuery.of(context).size.height * 0.025,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
      ),
    );
  }

  Widget getIcon(BottomNavItem item, BuildContext context) {
    BottomNavItem currentItem =
        Provider.of<BottomNavBarProvider>(context).currentItem;
    switch (item) {
      case BottomNavItem.total:
        return Image.asset(
          'asset/totalnew.png',
          height: MediaQuery.of(context).size.height * 0.04,
          width: MediaQuery.of(context).size.width * 0.04,
          color:
              currentItem == BottomNavItem.total ? Colors.white : Colors.black,
        );
      case BottomNavItem.today:
        return Icon(Icons.today_sharp,
            size: MediaQuery.of(context).size.height * 0.045,
            color: currentItem == BottomNavItem.today
                ? Colors.white
                : Colors.black);
      case BottomNavItem.monthly:
        return Icon(Icons.calendar_month_sharp,
            size: MediaQuery.of(context).size.height * 0.045,
            color: currentItem == BottomNavItem.monthly
                ? Colors.white
                : Colors.black);
      case BottomNavItem.all:
        return Image.asset('asset/menu.png',
            height: MediaQuery.of(context).size.height * 0.04,
            width: MediaQuery.of(context).size.width * 0.04,
            color:
                currentItem == BottomNavItem.all ? Colors.white : Colors.black);
    }
  }
}
