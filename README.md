# Food Rescue Mobile

## Sustainable Food & Diet / Waste Management

## Kolaborator

1. 2506534245 - FIQHI DESKI ISMAIL
2. 2506593613 - NABILA OKTAVIA RAMADHANI
3. 2506539082 - EVAN ANDRIAN
4. 2506625470 - KAYSAN NAVID MUSYAFFA

## Deskripsi Aplikasi

Platform untuk meredistribusikan dua jenis _resource_ pangan sebelum menjadi _waste_.

1. Packaged Food Surplus, yaitu makanan siap konsumsi yang masih layak dan belum dikonsumsi seperti _rice box_, _snack box_, _bakery packs_, _catering portions_, dan _unopened event food_.
2. Compostable Food Waste, yaitu sisa pangan organik yang masih dapat dimanfaatkan untuk _composting_, BSF/_maggot_, _animal feed_ tertentu, atau _upcycling_.

User dapat membuat _supply listing_ untuk DONATE atau SELL, user lain dapat menemukan _supply_ atau membuat _request resource_ yang dibutuhkan, melakukan _reservation_, lalu mengatur _pickup_. Komunikasi lanjutan diarahkan ke platform pihak ke-3. Pembayaran dan negosiasi final dilakukan di luar platform.

Food Rescue Mobile dikembangkan menggunakan Flutter sebagai versi mobile dari situs web Food Rescue pada Proyek Tengah Semester. Aplikasi mobile terhubung dengan backend Django yang sama melalui web service Django REST Framework.

## Problem & Solution

_Packaged food surplus_ dan _compostable food waste_ sering tidak tersalurkan karena pemilik tidak mengetahui pihak yang dapat memanfaatkannya. Akibatnya, makanan layak konsumsi maupun sisa pangan yang masih berguna berakhir menjadi _waste_.

Food Rescue menyediakan _platform matching_ yang mempertemukan pihak yang memiliki _resource_ dengan pihak yang dapat memanfaatkannya melalui Supply Listing, Request Board, Reservation, dan Pickup. Listing dapat berupa DONATE atau SELL. Untuk SELL, harga ditentukan owner dan pembayaran dilakukan di luar platform.

## Daftar Modul

Setiap modul dikembangkan menjadi halaman-halaman Flutter yang terhubung dengan web service Django REST Framework.

### Module 1 — Supply Listing (ResourceListing)

User membuat dan mengelola resource yang dimiliki. Registered User dapat melakukan CRUD, sedangkan public hanya dapat browse/search/filter listing.

Data utama meliputi berikut.

- resource_type dengan pilihan PACKAGED_FOOD_SURPLUS atau COMPOSTABLE_FOOD_WASTE
- title, category, description
- quantity, unit
- mode dengan pilihan DONATE atau SELL
- price jika SELL
- condition
- suitable_for / intended_use dengan pilihan HUMAN_CONSUMPTION, COMPOSTING, BSF, ANIMAL_FEED, atau UPCYCLING sesuai resource
- pickup_location
- available_until/deadline
- storage notes, allergen notes, packaging status bila relevan
- status

### Module 2 — Request Board (ResourceRequest)

User membuat dan mengelola request resource yang sedang dicari/dibutuhkan. Modul ini memungkinkan user untuk browse active requests, search/filter request, dan provider dapat menawarkan resource terhadap request tertentu.

Data utama meliputi berikut.

- resource_type/category
- quantity_needed, unit
- location/area
- donate_only/max_price
- intended_use
- valid_until
- status

### Module 3 — Match/Reservation (Reservation)

Mengelola kesepakatan antara provider dan receiver. Reservation dapat dibuat ketika receiver claim Supply Listing, atau ketika provider menawarkan supply terhadap Resource Request.

Modul ini berfokus pada siapa mengambil resource apa, berapa quantity, harga yang disepakati, serta approval.

Data utama meliputi berikut.

- provider
- receiver
- listing/request
- quantity
- agreed_price jika ada
- status dengan pilihan PENDING, ACCEPTED, REJECTED, atau CANCELLED

Setelah reservation diterima, stock pada listing dapat diperbarui.

### Module 4 — Pickup & Fulfillment (Pickup)

Mengelola pelaksanaan pengambilan setelah reservation diterima. Modul ini berfokus pada kapan dan di mana handoff dilakukan serta apakah fulfillment berhasil.

Data utama meliputi berikut.

- reservation
- pickup_date
- pickup_time
- final pickup_location
- pickup instructions / notes
- status dengan pilihan SCHEDULED, COMPLETED, NO_SHOW, atau CANCELLED

Fitur mencakup reschedule pickup, update fulfillment status, dan opsi contact redirect ke pihak ke-3. Payment dan negosiasi final dilakukan di luar platform.

### Shared Foundation — Account & Authentication

Fondasi bersama ini menangani autentikasi dan otorisasi pengguna.

Cakupannya meliputi berikut.

- register, login, logout
- basic profile dan contact/WhatsApp number
- authentication
- ownership/authorization rules agar user hanya dapat mengelola data miliknya

### Core Flow

Supply Listing / Resource Request → Reservation → Pickup → Completed

## Pembagian Modul

Pembagian modul melanjutkan pembagian kerja pada Proyek Tengah Semester.

| Modul | Penanggung Jawab |
| --- | --- |
| Supply Listing | Fiqhi Deski Ismail |
| Request Board | Kaysan Navid Musyaffa |
| Match/Reservation | Evan Andrian |
| Pickup & Fulfillment | Nabila Oktavia Ramadhani |
| Shared Foundation — Account & Authentication | Fiqhi Deski Ismail |

Setiap anggota mengembangkan halaman Flutter dan integrasi web service untuk modulnya masing-masing.

## Alur Integrasi Data Mobile dan Situs Web

Aplikasi Flutter terhubung dengan backend Django dari Proyek Tengah Semester yang di-deploy di PWS melalui web service Django REST Framework.

1. User membuka halaman atau melakukan interaksi pada aplikasi Flutter.
2. Flutter mengirim HTTP request secara asinkron ke web service Django.
3. Backend memeriksa hak akses dan memproses permintaan dengan membaca atau memperbarui data pada database.
4. Backend mengembalikan respons dalam format JSON.
5. Flutter mengolah respons JSON dan menampilkan hasilnya pada aplikasi.

Aplikasi mobile dan situs web menggunakan database yang sama sehingga perubahan data melalui salah satu platform dapat ditampilkan pada platform lainnya. Autentikasi pengguna menggunakan session Django.

## Public API

OpenStreetMap/Nominatim digunakan untuk pencarian dan geocoding lokasi pada Supply Listing, Resource Request, dan Pickup.

Penggunaannya meliputi berikut.

- User mencari alamat/lokasi ketika membuat supply atau request.
- Nominatim mengubah pencarian lokasi menjadi data terstruktur seperti display name dan koordinat.
- Lokasi final pickup dapat dicari/dikonfirmasi dengan data lokasi tersebut.
- Data lokasi dari API dapat difilter berdasarkan area/kota sebelum dipilih atau ditampilkan.

Untuk scope saat ini, platform tidak menjanjikan nearest-listing search, radius search, route optimization, ETA, atau distance calculation.

## Peran Pengguna

### Potential Users

Penyedia Packaged Food Surplus meliputi event organizer, catering, bakery, restoran/kafe, hotel, kantin, dan komunitas/organisasi yang mengadakan acara.

Penyedia Compostable Food Waste meliputi kafe, restoran, juice shop, bakery, pasar, food-processing business, dan rumah tangga.

Receivers meliputi individu, komunitas/NGO, composter/composting community, urban farmer/community garden, BSF/maggot farm, peternak untuk jenis waste yang sesuai, dan upcycling business.

### User Roles

- **Guest** dapat browse Supply Listing dan Request Board yang tersedia.
- **Registered User** dapat bertindak sebagai provider maupun receiver tergantung aktivitasnya, membuat supply/request, melakukan reservation, dan mengatur pickup.
- **Admin** melakukan moderasi user, listing, request, reservation, dan pickup.

Peran provider dan receiver mengikuti aktivitas pengguna dan dapat dijalankan oleh akun Registered User yang sama.

## Desain Aplikasi

https://www.figma.com/design/IHKy4C88HVCrLH0B3wCbsU/Food-Rescue?node-id=0-1

## Tautan APK

Tautan APK akan ditambahkan setelah Checkpoint 1.

## Scope & Safety Notes

### Scope

- Packaged Food Surplus yang masih layak konsumsi dan belum dikonsumsi, misalnya rice box, snack box, bakery packs, catering portions, dan unopened event food.
- Compostable Food Waste yang masih dapat dimanfaatkan, misalnya coffee grounds, fruit/vegetable scraps, eggshells, dan kategori organik lain yang sesuai.
- Donate/sell, request, reservation, local pickup, dan contact via WhatsApp.

### Safety/Platform Limitation

- Provider wajib mencantumkan condition, deadline/available-until, dan catatan penyimpanan bila relevan.
- Platform hanya memfasilitasi listing dan matching; platform tidak melakukan automatic food safety verification.
- Food waste untuk animal feed hanya boleh ditandai jika jenis resource memang sesuai; platform tidak menganggap semua food waste aman untuk pakan.

### Out of Scope

- payment gateway
- delivery/logistics
- AI/CV identification
- in-app chat/call
- route optimization
- pengolahan sampah
- automatic safety verification

## AI Disclosure

Dalam proses pengerjaan proyek ini, tim menggunakan bantuan AI sebagai alat pendukung untuk _brainstorming_ ide, penyusunan awal Product Requirements Document (PRD), perumusan _user flow_, serta penyusunan struktur modul aplikasi. AI juga digunakan untuk membantu mengevaluasi _scope_ fitur agar tetap sesuai dengan tema Sustainable Living dan kebutuhan tugas.