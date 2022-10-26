import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:investor_mobile_app_ui/views/wallet/discover.dart';
import 'package:investor_mobile_app_ui/views/wallet/notification.dart';
import 'package:investor_mobile_app_ui/views/wallet/portfolio.dart';
import 'package:investor_mobile_app_ui/views/wallet/profile.dart';
import 'package:investor_mobile_app_ui/views/wallet/trade.dart';

class BlockTransferParentView extends StatefulWidget {
  const BlockTransferParentView({Key? key}) : super(key: key);

  @override
  State<BlockTransferParentView> createState() => _BlockTransferParentViewState();
}

class _BlockTransferParentViewState extends State<BlockTransferParentView> {
  int bottomSelectedIndex = 0;
  final pageController = PageController(initialPage: 0, keepPage: true);

  @override
  void initState() {
    super.initState();
  }

  void pageChanged(int index) {
    setState(() {
      bottomSelectedIndex = index;
    });
  }

  void bottomTapped(int index) {
    setState(() {
      bottomSelectedIndex = index;
      pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.easeInOutCubic);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          bottomTapped(index);
        },
        currentIndex: bottomSelectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.black54,
        selectedItemColor: Colors.tealAccent,
        unselectedItemColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart),
            label: 'Portfolio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_chart_outlined_rounded),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.compare_arrows_rounded),
            label: 'Trade',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.messenger_outline_rounded),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: 'Profile'
          ),
        ],
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: (index) {
          pageChanged(index);
        },
        children: const [PortfolioView(), DiscoverView(), TradeView(), NotificationView(), ProfileView()],
      ),
    );
  }

}
