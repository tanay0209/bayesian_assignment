import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.0),
          topRight: Radius.circular(12.0),
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12.0),
          topRight: Radius.circular(12.0),
        ),
        child: BottomNavigationBar(
          currentIndex: 1,
          selectedItemColor: const Color.fromARGB(255, 80, 29, 210),
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color.fromARGB(255, 227, 204, 241),
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
          onTap: (index) {},
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.house), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.credit_card), label: "Add Card"),
            BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: "News"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      ),
    );
  }
}
