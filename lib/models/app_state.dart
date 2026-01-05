import 'package:flutter/foundation.dart';

class Contact {
  final String name;
  final String phone;
  final bool isSystem;

  const Contact({required this.name, required this.phone, this.isSystem = false});
}

class AppState extends ChangeNotifier {
  String _userName = 'Arjun Reddy';
  String _vehicleNumber = 'MH 12 AB 1234';

  final List<Contact> _contacts = [
    const Contact(name: 'POLICE CONTROL ROOM', phone: '100', isSystem: true),
    const Contact(name: 'AMBULANCE', phone: '102', isSystem: true),
    const Contact(name: 'Father (Primary)', phone: '+91 98765 43210'),
    const Contact(name: 'Sister', phone: '+91 91234 56789'),
  ];

  String get userName => _userName;
  String get vehicleNumber => _vehicleNumber;
  List<Contact> get contacts => List.unmodifiable(_contacts);

  void updateProfile({String? userName, String? vehicleNumber}) {
    if (userName != null) _userName = userName;
    if (vehicleNumber != null) _vehicleNumber = vehicleNumber;
    notifyListeners();
  }

  void addContact(Contact contact) {
    _contacts.add(contact);
    notifyListeners();
  }
}
