import 'package:flutter/material.dart';

class AddressDomain {
  final IconData icon;
  final String name;
  final String address;

  AddressDomain(this.icon, this.name, this.address);

  static final List<AddressDomain> list = [
    AddressDomain(Icons.home, "Home", "656 East Depot Lane Bronx, New York 10460"),
    AddressDomain(Icons.apartment, "Work", "9922 West Linda Rd. Rochester, New York 14609"),
    AddressDomain(Icons.location_on, "Other", "8659 New Dr. Jamestown, New York 14701"),
  ];

  static final List<AddressDomain> recentSearches = [
    AddressDomain(
        Icons.location_on, "City Park Museum", "656 East Depot Lane Bronx, New York 10460"),
    AddressDomain(
        Icons.location_on, "Padeum Street", "9922 West Linda Rd. Rochester, New York 14609"),
    AddressDomain(Icons.location_on, "Business Hub", "8659 New Dr. Jamestown, New York 14701"),
  ];
}
