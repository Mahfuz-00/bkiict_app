import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../Data/Models/profilemodel.dart';
import '../../Data/Models/profileModelFull.dart';

part 'auth_state.dart';

/// A Cubit class responsible for managing user authentication state.
///
/// The `AuthCubit` handles user authentication actions such as login, logout,
/// and fetching or updating the user profile. It emits different states
/// based on the user's actions.
///
/// ### States:
/// - [AuthInitial]: The initial state when no user is authenticated.
/// - [AuthAuthenticated]: The state when a user is authenticated with a valid profile and token.
class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  Future<void> initializeAuthState() async {
    try {
      final token = await _secureStorage.read(key: 'auth_token');

      if (token != null && token.isNotEmpty) {
        print('Emiting authentication');
        final userProfile = UserProfile(
          Id: 0,
          name: 'N/A',
          photo: 'N/A',
        );
        emit(AuthAuthenticated(userProfile: userProfile, token: token));
      } else {
        print('No authentication data found in secure storage');
        emit(AuthInitial());
      }
    } catch (e) {
      print('Error initializing authentication state: $e');
      emit(AuthInitial());
    }
  }

  Future<void> login(UserProfile userProfile, String token) async {
    emit(AuthAuthenticated(userProfile: userProfile, token: token));
    await _secureStorage.write(key: 'auth_token', value: token);
    String? savedToken = await _secureStorage.read(key: 'auth_token');
    print('Saved Token: $savedToken');
    print('User profile and token saved in Cubit:');
    print('User Profile: ${userProfile.Id}, ${userProfile.name}, ${userProfile.photo}');
    print('Token: $token');
  }

  void updateProfile(UserProfile userProfile) {
    if (state is AuthAuthenticated) {
      final currentState = state as AuthAuthenticated;
      emit(AuthAuthenticated(
        userProfile: userProfile,
        token: currentState.token,
      ));
      print('User profile updated in Cubit:');
      print('User Profile: ${userProfile.Id}, ${userProfile.name}, ${userProfile.photo}');
    }
  }

  Future<void> logout() async {
    emit(AuthInitial());
    await _secureStorage.delete(key: 'auth_token');
    print('User profile and token removed from Cubit');
  }
}
