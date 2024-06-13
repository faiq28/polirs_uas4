import 'package:get/get.dart';

import '../modules/admin/bindings/admin_binding.dart';
import '../modules/admin/views/admin_view.dart';
import '../modules/artikel/bindings/artikel_binding.dart';
import '../modules/artikel/views/artikel_view.dart';
import '../modules/detail-poli-user/bindings/detail_poli_user_binding.dart';
import '../modules/detail-poli-user/views/detail_poli_user_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/pasien/bindings/pasien_binding.dart';
import '../modules/pasien/views/pasien_view.dart';
import '../modules/poli-user/bindings/poli_user_binding.dart';
import '../modules/poli-user/views/poli_user_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/tambah-poli/bindings/tambah_poli_binding.dart';
import '../modules/tambah-poli/views/tambah_poli_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

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
      page: () => const AdminView(),
      binding: AdminBinding(),
    ),
    GetPage(
      name: _Paths.ARTIKEL,
      page: () => ArtikelView(),
      binding: ArtikelBinding(),
    ),
    GetPage(
      name: _Paths.TAMBAH_POLI,
      page: () => const TambahPoliView(),
      binding: TambahPoliBinding(),
    ),
    GetPage(
      name: _Paths.POLI_USER,
      page: () => const PoliUserView(),
      binding: PoliUserBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_POLI_USER,
      page: () => DetailPoliUserView(),
      binding: DetailPoliUserBinding(),
    ),
    GetPage(
      name: _Paths.PASIEN,
      page: () => const PasienView(),
      binding: PasienBinding(),
    ),
  ];
}
