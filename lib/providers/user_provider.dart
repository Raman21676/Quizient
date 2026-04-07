import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_profile.dart';

class UserProvider extends ChangeNotifier {
  static const String _userKey = 'user_profile';
  
  SharedPreferences? _prefs;
  UserProfile? _userProfile;

  UserProfile? get userProfile => _userProfile;
  bool get hasUser => _userProfile != null;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    await _loadUser();
  }

  Future<void> _loadUser() async {
    final userJson = _prefs?.getString(_userKey);
    if (userJson != null) {
      _userProfile = UserProfile.fromJson(jsonDecode(userJson));
      notifyListeners();
    }
  }

  Future<void> _saveUser() async {
    if (_userProfile != null) {
      await _prefs?.setString(_userKey, jsonEncode(_userProfile!.toJson()));
    }
  }

  Future<void> createProfile(String nickname) async {
    _userProfile = UserProfile(
      nickname: nickname,
      joinedAt: DateTime.now(),
    );
    await _saveUser();
    notifyListeners();
  }

  Future<void> updateStats({int quizzesTaken = 0, int correctAnswers = 0}) async {
    if (_userProfile != null) {
      _userProfile = UserProfile(
        nickname: _userProfile!.nickname,
        joinedAt: _userProfile!.joinedAt,
        totalQuizzesTaken: _userProfile!.totalQuizzesTaken + quizzesTaken,
        totalCorrectAnswers: _userProfile!.totalCorrectAnswers + correctAnswers,
      );
      await _saveUser();
      notifyListeners();
    }
  }

  Future<void> clearProfile() async {
    _userProfile = null;
    await _prefs?.remove(_userKey);
    notifyListeners();
  }
}
