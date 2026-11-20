import 'package:flutter/material.dart';

/// Detail satu reservation beserta aksi approval.
///
/// Integrasi web service (Evan):
/// - GET    /api/v1/reservations/{id}/
/// - POST   /api/v1/reservations/{id}/accept/
/// - POST   /api/v1/reservations/{id}/reject/
/// - POST   /api/v1/reservations/{id}/cancel/
/// - PATCH  /api/v1/reservations/{id}/ (revise quantity)
class ReservationDetailPage extends StatelessWidget {
  const ReservationDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO(Evan): Ambil detail reservation dari GET /api/v1/reservations/{id}/
    // dan tampilkan terms, status, serta kontak counterparty. Saat ini
    // placeholder.
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Reservation')),
      body: const Center(
        child: Text('Detail Reservation (placeholder)'),
      ),
    );
  }
}
