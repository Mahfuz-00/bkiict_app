import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:in_app_update/in_app_update.dart';
import '../../../Data/Data Sources/API Service (Profile)/apiserviceprofile.dart';
import '../../../Data/Models/profilemodel.dart';
import '../../Bloc/auth_cubit.dart';
import '../Dashboard UI/dashboardUI.dart';
import '../Login UI/loginUI.dart';
import '../Sign Up UI/signupUI.dart';

/// SplashScreenUI is a [StatefulWidget] that displays a splash screen
/// with animations for fading and sliding effects. It includes navigation
/// to the login and signup screens after a specified duration.
///
/// Variables:
/// - animationController: [AnimationController] responsible for managing animations.
/// - FadeAnimation: [Animation<double>] for the fade transition effect.
/// - SlideAnimation: [Animation<Offset>] for sliding effect during the transition.
/// - animatedpadding: [Animation<Offset>] for padding animation effect.
class SplashScreenUI extends StatefulWidget {
  const SplashScreenUI({super.key});

  @override
  State<SplashScreenUI> createState() => _SplashScreenUIState();
}

class _SplashScreenUIState extends State<SplashScreenUI>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> FadeAnimation;
  late Animation<Offset> SlideAnimation;
  late Animation<Offset> animatedpadding;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    SlideAnimation = Tween(begin: const Offset(0, 3), end: const Offset(0, 0))
        .animate(CurvedAnimation(
            parent: animationController, curve: Curves.easeInOutCirc));
    FadeAnimation = Tween(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut));
    animatedpadding = Tween(begin: const Offset(0, 0.3), end: Offset.zero)
        .animate(
            CurvedAnimation(parent: animationController, curve: Curves.easeIn));

    checkForUpdate(context);
    _checkAuthAndNavigate(context);
  }

  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

// In the SplashScreen widget:
  Future<void> _checkAuthAndNavigate(BuildContext context) async {
    final authCubit = context.read<AuthCubit>();
    print('Auth Invoked');
    try {
      // Retrieve the token and user type from secure storage
      final token = await _secureStorage.read(key: 'auth_token');

      print(token);

      // If token or userType is missing, handle this case appropriately
      if (token == null || token.isEmpty) {
        print('No token or user type found, staying on current screen');
        animationController.forward();
        // You can either show a message, keep the user on the page, or handle differently
        return; // Stay on the current screen without navigating
      }

      // If token and userType exist, check if the state is AuthInitial or AuthAuthenticated
      if (authCubit.state is AuthInitial) {
        // Proceed with fetching the user profile
        await _fetchUserProfile(token, context);
      } else if (authCubit.state is AuthAuthenticated) {
        // If already authenticated, navigate based on the user type
        final currentState = authCubit.state as AuthAuthenticated;
        final userProfile = currentState.userProfile;

        print(
            'User Profile from State: ${userProfile.name}, ${userProfile.Id}, ${userProfile.photo}');
        await _fetchUserProfile(token, context);
        print(
            'User Profile from State: ${userProfile.name}, ${userProfile.Id}, ${userProfile.photo}');
        _navigateToAppropriateDashboard(context);
      }
    } catch (e) {
      print('Error while checking authentication: $e');
      _navigateToLogin(context);
    }
  }

  Future<void> _fetchUserProfile(String token, BuildContext context) async {
    try {
      // Fetch user profile from the API
      final apiService = ProfileAPIService();
      final profile = await apiService.fetchUserProfile(token);

      // If profile is fetched successfully, create the UserProfile and login
      final userProfile = UserProfile.fromJson(profile);

      print('Profile Loaded: $userProfile');

      // Log the user in via the AuthCubit
      context.read<AuthCubit>().login(userProfile, token);

      // Navigate to the appropriate dashboard after login
      _navigateToAppropriateDashboard(context);
    } catch (e) {
      print('Error fetching user profile: $e');
      _navigateToLogin(context);
    }
  }

  void _navigateToLogin(BuildContext context) {
    showTopToast(context, 'Session expired. Please log in again.');
    print('Navigating to login');
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginUI()),
    );
  }

  void _navigateToAppropriateDashboard(BuildContext context) {
    print('Navigating to appropriate dashboard');
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => DashboardUI()),
      (route) => false,
    );
  }

  void showTopToast(BuildContext context, String message) {
    OverlayState? overlayState = Overlay.of(context);
    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).padding.top + 10,
        left: 20,
        right: 20,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.7),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              message,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );

    overlayState?.insert(overlayEntry);

    Future.delayed(Duration(seconds: 3)).then((_) {
      overlayEntry.remove();
    });
  }

  void checkForUpdate(BuildContext context) async {
    // Check for available updates
    AppUpdateInfo updateInfo = await InAppUpdate.checkForUpdate();

    if (updateInfo.updateAvailability == UpdateAvailability.updateAvailable) {
      // Show a dialog to inform the user about the update
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Update Available",
              style: TextStyle(
                color: Color.fromRGBO(134, 188, 66, 1),
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'default',
              ),
            ),
            content: Text(
              "A new version of the app is available. Please update to the latest version.",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'default',
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  // Trigger the immediate update
                  InAppUpdate.performImmediateUpdate();
                },
                child: Text(
                  "Update",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'default',
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  // Close the dialog without updating
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Later",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'default',
                  ),
                ),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(246, 246, 246, 255),
            Color.fromRGBO(246, 246, 246, 255)
          ],
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage(
                'Assets/Images/Learning Engineering Institute-Logo.png',
              ),
              width: 200,
              height: 200,
            ),
            const SizedBox(
              height: 20,
            ),
            SlideTransition(
              position: animatedpadding,
              child: const Padding(
                padding: EdgeInsets.all(30),
                child: Text(
                  'Learning Engineering Institute',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: 'default',
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                FadeTransition(
                  opacity: FadeAnimation,
                  child: const Image(
                    image: AssetImage('Assets/Images/Powered by TNS.png'),
                    height: 100,
                    width: 150,
                    alignment: Alignment.bottomCenter,
                  ),
                ),
                SlideTransition(
                  position: SlideAnimation,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginUI()));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color(0xFFFF5202),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            fixedSize: Size(screenWidth * 0.9, 70),
                          ),
                          child: const Text('Login',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: 'default',
                              ))),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignupUI()));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: const BorderSide(
                                  color: Colors.black, width: 2),
                            ),
                            fixedSize: Size(screenWidth * 0.9, 70),
                          ),
                          child: const Text('Register',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontFamily: 'default',
                              )))
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
