import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hungryfood/helpers/colorHelper.dart';
import 'package:hungryfood/views/cartscreen.dart';
import 'package:hungryfood/views/drawer/drawer.dart';
import 'package:hungryfood/views/homepage.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  List<Widget> _buildScreens() {
    return [
      const HomePage(),
      const HomePage(),
      const ViewCartScreen(),
      const HomePage(),
      const SideBarScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home_filled),
        title: ("Home"),
        activeColorPrimary: primaryColor,
        inactiveColorPrimary: textfielgbgColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.favorite),
        title: ("Favourite"),
        activeColorPrimary: primaryColor,
        inactiveColorPrimary: textfielgbgColor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          CupertinoIcons.cart,
          color: white,
        ),
        title: ("Cart"),
        activeColorPrimary: logoColor,
        inactiveColorPrimary: logoColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.bookmark),
        title: ("Order"),
        activeColorPrimary: primaryColor,
        inactiveColorPrimary: textfielgbgColor,
      ),
      PersistentBottomNavBarItem(
        routeAndNavigatorSettings: RouteAndNavigatorSettings(),
        onPressed: (p0) {
          Scaffold.of(context).openDrawer();
        },
        icon: const Icon(Icons.menu),
        title: ("Menu"),
        activeColorPrimary: primaryColor,
        inactiveColorPrimary: textfielgbgColor,
      ),
    ];
  }

  late PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style15, // Choose the nav bar style with this property.
    );
  }
}
