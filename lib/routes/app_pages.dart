import 'package:get/get.dart';


// Routes
import 'app_routes.dart';

// Views
import '../views/auth/splash_view.dart';
import '../views/auth/login_view.dart';
import '../views/home/home_view.dart';
import '../views/main/main_view.dart';
import '../views/profile/profile_view.dart';
import '../views/chat/chat_view.dart';
import '../views/users/user_list_view.dart';
// import '../views/friends/friends_view.dart';
// import '../views/friends/friend_requests_view.dart';
// import '../views/notifications/notifications_view.dart';

// // Controllers
import '../controllers/home_controller.dart';
import '../controllers/main_controller.dart';
import '../controllers/profile_controller.dart';
import '../controllers/chat_controller.dart';
import '../controllers/users_list_controller.dart';
// import '../controllers/friends_controller.dart';
// import '../controllers/friend_requests_controller.dart';
// import '../controllers/notifications_controller.dart';

class AppPages {
  static const initial = AppRoutes.splash;

  static final routes = [

    // ───────── SPLASH ─────────
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashView(),
    ),

    // ───────── LOGIN ─────────
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginView(),
    ),

    // // ───────── HOME ─────────
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeView(),
      binding: BindingsBuilder(() {
        Get.put(HomeController());
      }),
    ),

    // // ───────── MAIN ─────────
    GetPage(
      name: AppRoutes.main,
      page: () => const MainView(),
      binding: BindingsBuilder(() {
        Get.put(MainController());
      }),
    ),

    // // ───────── PROFILE ─────────
    GetPage(
      name: AppRoutes.profile,
      page: () => const ProfileView(),
      binding: BindingsBuilder(() {
        Get.put(ProfileController());
      }),
    ),

    // ───────── CHAT ─────────
    GetPage(
      name: AppRoutes.chat,
      page: () => const ChatView(),
      binding: BindingsBuilder(() {
        Get.put(ChatController());
      }),
    ),

    // // ───────── USERS ─────────
    GetPage(
      name: AppRoutes.userList,
      page: () => const UserListView(),
      binding: BindingsBuilder(() {
        Get.put(UsersListController());
      }),
    ),

    // // ───────── FRIENDS ─────────
    // GetPage(
    //   name: AppRoutes.friends,
    //   page: () => const FriendsView(),
    //   binding: BindingsBuilder(() {
    //     Get.put(FriendsController());
    //   }),
    // ),

    // // ───────── FRIEND REQUESTS ─────────
    // GetPage(
    //   name: AppRoutes.friendRequests,
    //   page: () => const FriendRequestsView(),
    //   binding: BindingsBuilder(() {
    //     Get.put(FriendRequestsController());
    //   }),
    // ),

    // // ───────── NOTIFICATIONS ─────────
    // GetPage(
    //   name: AppRoutes.notifications,
    //   page: () => const NotificationsView(),
    //   binding: BindingsBuilder(() {
    //     Get.put(NotificationsController());
    //   }),
    // ),
  ];
}