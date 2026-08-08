import 'package:flutter/material.dart';

class ContactModel {
  final String title;
  final String value;
  final IconData icon;
  final String url;

  const ContactModel({
    required this.title,
    required this.value,
    required this.icon,
    required this.url,
  });
}