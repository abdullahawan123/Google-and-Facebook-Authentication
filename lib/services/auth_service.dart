import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  static const String _serverClientId =
      '483135072279-vc6km9fn48n5k7gp6h1l1thkcn43t9h7.apps.googleusercontent.com';
  static const List<String> scopes = <String>[
    'https://www.googleapis.com/auth/contacts.readonly',
  ];

  AuthService() {
    _googleSignIn.initialize(serverClientId: _serverClientId);
  }

  Stream<User?> get userStream => _auth.authStateChanges();

  User? get currentUser => _auth.currentUser;

  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount user = await _googleSignIn.authenticate();

      final GoogleSignInAuthentication auth = user.authentication;

      if (auth.idToken == null) {
        return null;
      }

      final credential = GoogleAuthProvider.credential(
        accessToken: auth.idToken,
        idToken: auth.idToken,
      );

      return await _auth.signInWithCredential(credential);
    } on GoogleSignInException catch (e) {
      if (e.code == GoogleSignInExceptionCode.canceled) {
        debugPrint('Google sign-in canceled by user');
        return null;
      }
      rethrow;
    } catch (e) {
      debugPrint('Google sign-in error: $e');
      rethrow;
    }
  }

  Future<UserCredential?> signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login(
        permissions: ['email', 'public_profile'],
      );

      if (result.status == LoginStatus.cancelled) {
        return null;
      }

      if (result.status != LoginStatus.success) {
        throw Exception(result.message);
      }

      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(result.accessToken!.tokenString);

      return await _auth.signInWithCredential(facebookAuthCredential);
    } catch (e) {
      if (kDebugMode) {
        print('Facebook sign-in error: $e');
      }
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      await _googleSignIn.signOut();
      await _auth.signOut();
      await FacebookAuth.instance.logOut();
    } catch (e) {
      if (kDebugMode) {
        print('Error signing out: $e');
      }
      rethrow;
    }
  }
}
