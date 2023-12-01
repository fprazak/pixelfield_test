import 'package:flutter/material.dart';
import 'package:pixelfield_test/generated/l10n.dart';
import 'package:pixelfield_test/src/ui/core/collection/collection_screen.dart';
import 'package:pixelfield_test/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  Widget _getPage() {
    switch (_selectedIndex) {
      case 0:
        return const Center(
          child: Icon(
            Icons.sentiment_satisfied,
            color: AppColors.unselectedGreyColor,
            size: 50,
          ),
        );
      case 1:
        return const CollectionScreen();
      case 2:
        return Container();
      case 3:
        return Container();
      default:
        return Container();
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final L = S.of(context);
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(child: _getPage()),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.buttonDefaultDarkGreyColor,
        unselectedItemColor: AppColors.unselectedGreyColor,
        selectedItemColor: Colors.white,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/images/nav_bar/scan.png",
              color: _selectedIndex == 0
                  ? Colors.white
                  : AppColors.unselectedGreyColor,
              height: 24,
            ),
            label: L.scan,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/images/nav_bar/four_squares.png",
              color: _selectedIndex == 1
                  ? Colors.white
                  : AppColors.unselectedGreyColor,
              height: 24,
            ),
            label: L.collection,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/images/nav_bar/bottle.png",
              color: _selectedIndex == 2
                  ? Colors.white
                  : AppColors.unselectedGreyColor,
              height: 24,
            ),
            label: L.shop,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/images/nav_bar/gear.png",
              color: _selectedIndex == 3
                  ? Colors.white
                  : AppColors.unselectedGreyColor,
              height: 24,
            ),
            label: L.settings,
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
