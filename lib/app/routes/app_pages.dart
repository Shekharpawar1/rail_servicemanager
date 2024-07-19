import 'package:get/get.dart';

import '../modules/Books/bindings/books_binding.dart';
import '../modules/Books/views/books_view.dart';
import '../modules/Calculators/bindings/calculators_binding.dart';
import '../modules/Calculators/views/calculators_view.dart';
import '../modules/ComingSoon/bindings/coming_soon_binding.dart';
import '../modules/ComingSoon/views/coming_soon_view.dart';
import '../modules/Contacts/bindings/contacts_binding.dart';
import '../modules/Contacts/views/contacts_view.dart';
import '../modules/CreateAccount/bindings/create_account_binding.dart';
import '../modules/CreateAccount/views/create_account_view.dart';
import '../modules/DutyRecords/bindings/duty_records_binding.dart';
import '../modules/DutyRecords/bindings/leavepagebinding.dart';
import '../modules/DutyRecords/controllers/leavepage_controller.dart';
import '../modules/DutyRecords/views/MyDutyDetails/leaveappbar.dart';
import '../modules/DutyRecords/views/duty_records_view.dart';
import '../modules/EditProfile/bindings/edit_profile_binding.dart';
import '../modules/EditProfile/views/edit_profile_view.dart';
import '../modules/FindRoasterSet/bindings/find_roaster_set_binding.dart';
import '../modules/FindRoasterSet/views/find_roaster_set_view.dart';
import '../modules/Forms/bindings/forms_binding.dart';
import '../modules/Forms/views/forms_view.dart';
import '../modules/OfflineWTT/bindings/offline_w_t_t_binding.dart';
import '../modules/OfflineWTT/views/offline_w_t_t_view.dart';
import '../modules/Roaster/bindings/roaster_binding.dart';
import '../modules/Roaster/views/roaster_view.dart';
import '../modules/RulesAndUpdates/bindings/rules_and_updates_binding.dart';
import '../modules/RulesAndUpdates/views/rules_and_updates_view.dart';
import '../modules/SETOffline/bindings/s_e_t_offline_binding.dart';
import '../modules/SETOffline/views/s_e_t_offline_view.dart';
import '../modules/SignIn/bindings/sign_in_binding.dart';
import '../modules/SignIn/views/sign_in_view.dart';
import '../modules/Splash/bindings/splash_binding.dart';
import '../modules/Splash/views/splash_view.dart';
import '../modules/Videos/bindings/videos_binding.dart';
import '../modules/Videos/views/videos_view.dart';
import '../modules/WorkingHistory/bindings/working_history_binding.dart';
import '../modules/WorkingHistory/views/working_history_view.dart';
import '../modules/WorkingSet/bindings/working_set_binding.dart';
import '../modules/WorkingSet/views/working_set_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_IN,
      page: () => SignInView(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_ACCOUNT,
      page: () => CreateAccountView(),
      binding: CreateAccountBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => EditProfileView(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: _Paths.ROASTER,
      page: () => const RoasterView(),
      binding: RoasterBinding(),
    ),
    GetPage(
      name: _Paths.WORKING_HISTORY,
      page: () => const WorkingHistoryView(),
      binding: WorkingHistoryBinding(),
    ),
    GetPage(
      name: _Paths.WORKING_SET,
      page: () => WorkingSetView(),
      binding: WorkingSetBinding(),
    ),
    GetPage(
      name: _Paths.DUTY_RECORDS,
      page: () => DutyRecordsView(),
      binding: DutyRecordsBinding(),
    ),
    GetPage(
      name: _Paths.Leave_Page,
      page: () => LeavePageView(),
      binding: LeavePageBinding(),
    ),
    GetPage(
      name: _Paths.CONTACTS,
      page: () => ContactsView(),
      binding: ContactsBinding(),
    ),
    GetPage(
      name: _Paths.RULES_AND_UPDATES,
      page: () => RulesAndUpdatesView(),
      binding: RulesAndUpdatesBinding(),
    ),
    GetPage(
      name: _Paths.FORMS,
      page: () => FormsView(),
      binding: FormsBinding(),
    ),
    GetPage(
      name: _Paths.BOOKS,
      page: () => BooksView(),
      binding: BooksBinding(),
    ),
    GetPage(
      name: _Paths.CALCULATORS,
      page: () => CalculatorsView(),
      binding: CalculatorsBinding(),
    ),
    GetPage(
      name: _Paths.OFFLINE_W_T_T,
      page: () => OfflineWTTView(),
      binding: OfflineWTTBinding(),
    ),
    GetPage(
      name: _Paths.S_E_T_OFFLINE,
      page: () => const SETOfflineView(),
      binding: SETOfflineBinding(),
    ),
    GetPage(
      name: _Paths.FIND_ROASTER_SET,
      page: () => const FindRoasterSetView(),
      binding: FindRoasterSetBinding(),
    ),
    GetPage(
      name: _Paths.COMING_SOON,
      page: () => const ComingSoonView(),
      binding: ComingSoonBinding(),
    ),
    GetPage(
      name: _Paths.VIDEOS,
      page: () => const VideosView(),
      binding: VideosBinding(),
    ),
  ];
}
