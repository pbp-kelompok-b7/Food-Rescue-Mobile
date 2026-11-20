import 'package:flutter/material.dart';

/// Form claim sebuah Supply Listing menjadi reservation PENDING.
///
/// Integrasi web service (Evan): POST /api/v1/listings/{id}/claims/
/// Body hanya memuat quantity; provider, harga, unit, dan mode diturunkan
/// server dari listing.
class ClaimFormPage extends StatelessWidget {
  const ClaimFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO(Evan): Bangun form input quantity dan kirim POST ke
    // /api/v1/listings/{id}/claims/ secara asinkron. Saat ini placeholder.
    return Scaffold(
      appBar: AppBar(title: const Text('Claim Listing')),
      body: const Center(
        child: Text('Form Claim Listing (placeholder)'),
      ),
    );
  }
}
