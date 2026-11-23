import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nexustech/view/auth/login.dart';
import 'package:nexustech/view/main_screens/admin/admin_dashboard/manage_projects.dart';
import 'package:nexustech/view/main_screens/client/dashboard/client_dashboad.dart';
import 'package:nexustech/view/main_screens/developer/dashboard/developer_dashboard.dart';

class FirebaseAuthServices {
  // SIGNUP WITH FIREBASE AUTHENTICATION + FIRESTORE
  Future<UserCredential?> signupWithEmailAndPassword({
    required String name,
    required String emailAddress,
    required String password,
    required String role,
    required BuildContext context,
    required Function(bool) setLoading,
  }) async {
    try {
      setLoading(true);

      // Create account in Firebase Authentication
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      // Get user's UID
      final uid = credential.user!.uid;

      // Save user information in Firestore
      await FirebaseFirestore.instance.collection('users').doc(uid).set({
        'uid': uid,
        'name': name,
        'email': emailAddress,
        'role': role,
        'createdAt': FieldValue.serverTimestamp(),
      });

      if (!context.mounted) return credential;

      // Navigate to Login screen after successful signup
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );

      return credential;

    } on FirebaseAuthException catch (e) {
      debugPrint('Signup error: ${e.code}');

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.message ?? "Signup failed"),
          ),
        );
      }

      return null;

    } catch (e) {
      debugPrint('Signup error: $e');

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Error: $e"),
          ),
        );
      }

      return null;

    } finally {
      if (context.mounted) {
        setLoading(false);
      }
    }
  }

  // LOGIN WITH FIREBASE AUTHENTICATION
  /*Future<UserCredential?> loginWithEmailAndPassword({
    required String emailAddress,
    required String password,
    required BuildContext context,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      if (!context.mounted) return credential;

      // Navigate to Developer Dashboard after login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const ClientHomeScreen(),
        ),
      );

      return credential;

    } on FirebaseAuthException catch (e) {
      debugPrint('Login error: ${e.code}');

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.message ?? "Login failed"),
          ),
        );
      }

      return null;

    } catch (e) {
      debugPrint('Login error: $e');

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Error: $e"),
          ),
        );
      }

      return null;
    }
  }*/

  Future<UserCredential?> loginWithEmailAndPassword({
  required String emailAddress,
  required String password,
  required BuildContext context,
}) async {
  try {
    // 1. Login with Firebase Authentication
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: emailAddress.trim(),
      password: password,
    );

    // 2. Get user's UID
    final uid = credential.user!.uid;

    // 3. Get user's role from Firestore
    final userData = await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get();

    final role = userData.data()?['role'];

    if (!context.mounted) return credential;

    // 4. Navigate according to role
    if (role == 'client') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const ClientHomeScreen(),
        ),
      );
    } else if (role == 'developer') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const DashboardScreen(),
        ),
      );
    } 

    else if (role == 'admin') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const ManageProjects(),
        ),
      );
    } 
    
    else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("User role not found")),
      );
    }

    return credential;

  } on FirebaseAuthException catch (e) {
    debugPrint('Login error: ${e.code}');

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? "Login failed")),
      );
    }

    return null;

  } catch (e) {
    debugPrint('Login error: $e');

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }

    return null;
  }
}
}