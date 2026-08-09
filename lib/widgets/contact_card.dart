import 'package:flutter/material.dart';

import '../models/contact_model.dart';
import '../utils/app_colors.dart';
import 'shared_components.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({super.key, required this.contact});

  final ContactModel contact;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.all(24),
      borderRadius: 20,
      color: AppColors.card,
      onTap: () {
        // We'll add URL launching later.
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(contact.icon, size: 48, color: Colors.white),

          const SizedBox(height: 20),

          Text(
            contact.title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 8),

          Text(
            contact.value,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white70, fontSize: 15),
          ),
        ],
      ),
    );
  }
}
