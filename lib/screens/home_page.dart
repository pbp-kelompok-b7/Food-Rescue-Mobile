import 'package:flutter/material.dart';

import 'pickup_page.dart';
import 'request_board_page.dart';
import 'reservation_page.dart';
import 'supply_listing_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Food Rescue')),
      body: SafeArea(
        child: IndexedStack(
          index: _selectedIndex,
          children: const [
            SupplyListingPage(),
            RequestBoardPage(),
            ReservationPage(),
            PickupPage(),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() => _selectedIndex = index);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.inventory_2_outlined),
            label: 'Supply',
          ),
          NavigationDestination(
            icon: Icon(Icons.assignment_outlined),
            label: 'Request',
          ),
          NavigationDestination(
            icon: Icon(Icons.handshake_outlined),
            label: 'Reservasi',
          ),
          NavigationDestination(
            icon: Icon(Icons.event_available_outlined),
            label: 'Pickup',
          ),
        ],
      ),
    );
  }
}
