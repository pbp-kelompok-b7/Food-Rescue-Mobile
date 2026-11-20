# Endpoint Modul Food Rescue

Endpoint Django REST Framework menggunakan backend proyek tengah semester. Root API yang dapat digunakan melalui proxy situs web Food Rescue adalah `https://food-rescue-fe.vercel.app/api/v1/`.

| Modul | PIC | Halaman Flutter | Endpoint daftar | Akses |
| --- | --- | --- | --- | --- |
| Supply Listing | Fiqhi | `lib/screens/supply_listing_page.dart` | `GET /api/v1/listings/` | Publik |
| Request Board | Kaysan | `lib/screens/request_board_page.dart` | `GET /api/v1/requests/` | Publik |
| Match/Reservation | Evan | `lib/screens/reservation_page.dart` | `GET /api/v1/reservations/` | Login |
| Pickup & Fulfillment | Nabila | `lib/screens/pickup_page.dart` | `GET /api/v1/pickups/` | Login |

Pemeriksaan tanpa sesi login pada 20 November 2026 menghasilkan HTTP 200 untuk Supply Listing dan Request Board. Reservation dan Pickup menghasilkan HTTP 401 dengan kode `authentication_required`. Akses kedua endpoint tersebut setelah login perlu diuji saat integrasi autentikasi dikerjakan.

Halaman setiap modul saat ini berupa kerangka yang dapat diisi masing-masing PIC. Navigasi antarmodul berada di `lib/screens/home_page.dart`. Pemanggilan API dan pengolahan data pada halaman dilanjutkan oleh anggota yang mengerjakan modul tersebut.

Rujukan implementasi endpoint ada pada URLconf dan views di aplikasi `listings`, `requests_app`, `reservations`, dan `pickups` dalam [repositori backend Food Rescue](https://github.com/pbp-kelompok-b7/Food-Rescue-Be).
