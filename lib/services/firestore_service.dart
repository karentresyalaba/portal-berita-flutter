import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/profile_model.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Get user profile
  Future<ProfileModel?> getUserProfile(String uid) async {
    try {
      DocumentSnapshot doc = await _firestore.collection('users').doc(uid).get();
      if (doc.exists) {
        return ProfileModel.fromMap(doc.data() as Map<String, dynamic>);
      }
      return null;
    } catch (e) {
      throw Exception('Error getting profile: $e');
    }
  }

  // Update user profile
  Future<void> updateUserProfile(ProfileModel profile) async {
    try {
      await _firestore
          .collection('users')
          .doc(profile.uid)
          .update(profile.toMap());
    } catch (e) {
      throw Exception('Error updating profile: $e');
    }
  }

  // Create user profile
  Future<void> createUserProfile(ProfileModel profile) async {
    try {
      await _firestore
          .collection('users')
          .doc(profile.uid)
          .set(profile.toMap());
    } catch (e) {
      throw Exception('Error creating profile: $e');
    }
  }

  // Delete user profile
  Future<void> deleteUserProfile(String uid) async {
    try {
      await _firestore.collection('users').doc(uid).delete();
    } catch (e) {
      throw Exception('Error deleting profile: $e');
    }
  }

  // Stream user profile
  Stream<ProfileModel?> streamUserProfile(String uid) {
    return _firestore.collection('users').doc(uid).snapshots().map((doc) {
      if (doc.exists) {
        return ProfileModel.fromMap(doc.data() as Map<String, dynamic>);
      }
      return null;
    });
  }
}