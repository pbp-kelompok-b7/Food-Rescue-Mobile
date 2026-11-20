import 'package:flutter/material.dart';

import 'claim_form_page.dart';
import 'offer_form_page.dart';
import 'reservation_detail_page.dart';

/// Daftar reservation milik user (provider/receiver).
///
/// Integrasi web service (Evan): GET /api/v1/reservations/
/// Halaman ini adalah entry point modul Match/Reservation dan menjadi pusat
/// navigasi ke detail reservation serta form claim/offer.
class ReservationInboxPage extends StatelessWidget {
  const ReservationInboxPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO(Evan): Ambil daftar reservation dari GET /api/v1/reservations/
    // secara asinkron lalu tampilkan sebagai list. Saat ini placeholder.
    //
    // Halaman ini adalah root tab modul reservation di dalam HomePage yang
    // sudah menyediakan AppBar, sehingga tidak membungkus dirinya dengan
    // Scaffold. Halaman turunan (detail, claim, offer) memakai Scaffold sendiri
    // agar tombol back tersedia saat di-push.
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Daftar Reservation (placeholder)'),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const ReservationDetailPage(),
                ),
              );
            },
            child: const Text('Lihat Detail Reservation'),
          ),
          const SizedBox(height: 8),
          OutlinedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const ClaimFormPage()),
              );
            },
            child: const Text('Claim Listing'),
          ),
          const SizedBox(height: 8),
          OutlinedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const OfferFormPage()),
              );
            },
            child: const Text('Offer ke Request'),
          ),
        ],
      ),
    );
  }
}
