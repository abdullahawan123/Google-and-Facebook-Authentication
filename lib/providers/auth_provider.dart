import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();
  User? _user;
  bool _isLoading = false;
  bool _isFacebookLogin = false;

  User? get user => _user;
  bool get isLoading => _isLoading;
  bool get isAuthenticated => _user != null;
  bool get isFacebookLogin => _isFacebookLogin;

  AuthProvider() {
    _authService.userStream.listen((User? user) {
      _user = user;
      notifyListeners();
    });
  }

  Future<void> signIn() async {
    _isLoading = true;
    notifyListeners();
    try {
      final googleUser = await _authService.signInWithGoogle();
      if (googleUser == null) {
        debugPrint('Google Sign-In canceled by user');
        return;
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> signInWithFacebook() async {
    _isFacebookLogin = true;
    notifyListeners();
    try {
      final facebookUser = await _authService.signInWithFacebook();
      if (facebookUser == null) {
        debugPrint('Facebook Sign-In canceled by user');
        return;
      }
    } finally {
      _isFacebookLogin = false;
      notifyListeners();
    }
  }

  Future<void> signOut() async {
    _isLoading = true;
    notifyListeners();
    try {
      await _authService.signOut();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
