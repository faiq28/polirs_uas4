import 'package:get/get.dart';

import '../modules/admin/bindings/admin_binding.dart';
import '../modules/admin/views/admin_view.dart';
import '../modules/artikel/bindings/artikel_binding.dart';
import '../modules/artikel/views/artikel_view.dart';
import '../modules/bookingan/bindings/bookingan_binding.dart';
import '../modules/bookingan/views/bookingan_view.dart';
import '../modules/detail-poli-user/bindings/detail_poli_user_binding.dart';
import '../modules/detail-poli-user/views/detail_poli_user_view.dart';
import '../modules/histori-booking/bindings/histori_booking_binding.dart';
import '../modules/histori-booking/views/histori_booking_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/pasien/bindings/pasien_binding.dart';
import '../modules/pasien/views/pasien_view.dart';
import '../modules/poli-user/bindings/poli_user_binding.dart';
import '../modules/poli-user/views/poli_user_view.dart';
import '../modules/poli_admin/bindings/poli_admin_binding.dart';
import '../modules/poli_admin/views/poli_admin_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/scan/bindings/scan_binding.dart';
import '../modules/scan/views/scan_view.dart';
import '../modules/selesaiAdmin/bindings/selesai_admin_binding.dart';
import '../modules/selesaiAdmin/views/selesai_admin_view.dart';
import '../modules/tambah-poli/bindings/tambah_poli_binding.dart';
import '../modules/tambah-poli/views/tambah_poli_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN,
      page: () => AdminView(),
      binding: AdminBinding(),
    ),
    GetPage(
      name: _Paths.ARTIKEL,
      page: () => ArtikelView(),
      binding: ArtikelBinding(),
    ),
    GetPage(
      name: _Paths.TAMBAH_POLI,
      page: () => TambahPoliView(),
      binding: TambahPoliBinding(),
    ),
    GetPage(
      name: _Paths.POLI_USER,
      page: () => PoliUserView(),
      binding: PoliUserBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_POLI_USER,
      page: () => DetailPoliUserView(),
      binding: DetailPoliUserBinding(),
    ),
    GetPage(
      name: _Paths.PASIEN,
      page: () => PasienView(),
      binding: PasienBinding(),
    ),
    GetPage(
      name: _Paths.BOOKINGAN,
      page: () => BookinganView(),
      binding: BookinganBinding(),
    ),
    GetPage(
      name: _Paths.HISTORI_BOOKING,
      page: () => HistoriBookingView(),
      binding: HistoriBookingBinding(),
    ),
    GetPage(
      name: _Paths.POLI_ADMIN,
      page: () => PoliAdminView(),
      binding: PoliAdminBinding(),
    ),
    GetPage(
      name: _Paths.SCAN,
      page: () => ScanView(),
      binding: ScanBinding(),
    ),
    GetPage(
      name: _Paths.SELESAI_ADMIN,
      page: () =>  SelesaiAdminView(),
      binding: SelesaiAdminBinding(),
    ),
  ];
}
