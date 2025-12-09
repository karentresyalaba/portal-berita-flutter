import 'package:flutter/material.dart';
import '../models/profile_model.dart';
import '../services/firestore_service.dart';

class ProfileProvider extends ChangeNotifier {
  final FirestoreService _firestoreService = FirestoreService();
  ProfileModel? _profile;
  bool _isLoading = false;
  String? _errorMessage;

  ProfileModel? get profile => _profile;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  // Load profile
  Future<void> loadProfile(String uid) async {
    try {
      _isLoading = true;
      notifyListeners();

      _profile = await _firestoreService.getUserProfile(uid);

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  // Update profile
  Future<bool> updateProfile(ProfileModel profile) async {
    try {
      _isLoading = true;
      _errorMessage = null;
      notifyListeners();

      await _firestoreService.updateUserProfile(profile);
      _profile = profile;

      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _errorMessage = e.toString();
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  // Create profile
  Future<bool> createProfile(ProfileModel profile) async {
    try {
      _isLoading = true;
      _errorMessage = null;
      notifyListeners();

      await _firestoreService.createUserProfile(profile);
      _profile = profile;

      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _errorMessage = e.toString();
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  void clearProfile() {
    _profile = null;
    notifyListeners();
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}