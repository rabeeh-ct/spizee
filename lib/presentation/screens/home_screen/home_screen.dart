import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spizee/presentation/routes/route_constants.dart';
import 'package:spizee/presentation/screens/home_screen/components/home_screen_drawer.dart';
import 'package:spizee/presentation/screens/home_screen/components/item_card.dart';
import 'package:spizee/presentation/theme/theme.dart';

import 'home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeScreenController screenController = Get.find();
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          elevation: 5,
          shadowColor: Colors.white,
          scrolledUnderElevation: 5,
          backgroundColor: whiteColor,
          centerTitle: true,
          leading: const DrawerButton(),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: InkWell(
                onTap: () {
                  Get.toNamed(RouteList.placeOrderScreen);
                },
                child: const Badge(
                  label: Text("0"),
                  child: Icon(Icons.shopping_cart),
                ),
              ),
            ),
          ],
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(30.0),
            child: TabBar(
              isScrollable: true,
              unselectedLabelColor: Colors.grey,
              padding: EdgeInsets.zero,
              tabs: [
                Tab(child: Text('Tab 1')),
                Tab(child: Text('Investment')),
                Tab(child: Text('Your Earning')),
                Tab(child: Text('Current Balance')),
                Tab(child: Text('Tab 5')),
                Tab(child: Text('Tab 6'))
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            ...List.generate(
              6,
              (index) => ListView.separated(
                // padding: const EdgeInsets.all(defaultPadding),
                itemBuilder: (context, index) => const ItemCard(),
                separatorBuilder: (context, index) => Divider(
                  // height: 2,
                  color: blackColor.withOpacity(0.2),
                ),
                itemCount: 15,
              ),
            ),
          ],
        ),
        drawer: const HomeScreenDrawer(),
      ),
    );
  }
}
