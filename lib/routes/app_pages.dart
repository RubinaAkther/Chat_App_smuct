import 'package:get/get.dart';
import 'package:mastery_flutter/routes/app_routes.dart';
import 'package:mastery_flutter/views/auth/splash_view.dart';





class AppPages {
  static const initial = AppRoutes.splash;

  static final routes = [

    // ───────── SPLASH ─────────
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashView(),
    
    ),

    // // ───────── AUTH ─────────
    // GetPage(
    //   name: AppRoutes.login,
    //   page: () => const LoginView(),
    
    // ),

    // GetPage(
    //   name: AppRoutes.register,
    //   page: () => const RegisterView(),
    
    // ),

    // GetPage(
    //   name: AppRoutes.forgotPassword,
    //   page: () => const ForgotPasswordView(),
    
    // ),

    // GetPage(
    //   name: AppRoutes.changePassword,
    //   page: () => const ChangePasswordView(),
    
    // ),

    // // ───────── HOME ─────────
    // GetPage(
    //   name: AppRoutes.home,
    //   page: () => const HomeView(),
    //   binding: BindingsBuilder(() {
    //     HomeController()
    //   }),
    // ),

    // GetPage(
    //   name: AppRoutes.main,
    //   page: () => const HomeView(),
    //   binding: BindingsBuilder(() {
    //     MainController()
    //   }),
    // ),

    // // ───────── PROFILE ─────────
    // GetPage(
    //   name: AppRoutes.profile,
    //   page: () => const ProfileView(),
    //   binding: BindingsBuilder(() {
    //     Get.put(ProfileController())
    //   }),
    // ),

    // // ───────── CHAT ─────────
    // GetPage(
    //   name: AppRoutes.chat,
    //   page: () => const ChatView(),
    //   binding: BindingsBuilder(() {
    //     Get.put(ChatController())
    //   }),
    // ),

    // // ───────── USERS ─────────
    // GetPage(
    //   name: AppRoutes.userList,
    //   page: () => const UserListView(),
    //   binding: BindingsBuilder(() {
    //     Get.put(UsersListController());
    //   }),
    // ),

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