import 'package:flutter/material.dart';

/// Form offer resource terhadap sebuah Resource Request menjadi reservation
/// PENDING.
///
/// Integrasi web service (Evan): POST /api/v1/requests/{id}/offers/
/// Provider adalah user; receiver adalah pemilik request. Provider mengisi
/// detail resource, quantity, mode, unit_price, dan resource_deadline.
class OfferFormPage extends StatelessWidget {
  const OfferFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO(Evan): Bangun form detail offer dan kirim POST ke
    // /api/v1/requests/{id}/offers/ secara asinkron. Saat ini placeholder.
    return Scaffold(
      appBar: AppBar(title: const Text('Offer ke Request')),
      body: const Center(
        child: Text('Form Offer ke Request (placeholder)'),
      ),
    );
  }
}
