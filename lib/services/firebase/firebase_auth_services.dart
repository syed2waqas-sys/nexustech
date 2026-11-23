/*//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:nexustech/view/auth/login.dart';
import 'package:nexustech/view/main_screens/admin/admin_dashboard/manage_projects.dart';
import 'package:nexustech/view/main_screens/client/dashboard/client_dashboad.dart';
import 'package:nexustech/view/main_screens/developer/dashboard/developer_dashboard.dart';

class FirebaseAuthServices {

  // SIGNUP
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

      // Create account
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: emailAddress.trim(),
        password: password,
      );

      // Get UID
      final uid = credential.user!.uid;

      // Save user in Firestore
      await FirebaseFirestore.instance.collection('users').doc(uid).set({
        'uid': uid,
        'name': name.trim(),
        'email': emailAddress.trim(),
        'role': role.trim().toLowerCase(),
        'createdAt': FieldValue.serverTimestamp(),
      });

      // Navigate to Login
      if (!context.mounted) return credential;

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
          SnackBar(content: Text(e.message ?? 'Signup failed')),
        );
      }

      return null;

    } catch (e) {
      debugPrint('Signup error: $e');

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }

      return null;

    } finally {
      if (context.mounted) {
        setLoading(false);
      }
    }
  }

  // LOGIN
  Future<UserCredential?> loginWithEmailAndPassword({
    required String emailAddress,
    required String password,
    required BuildContext context,
    Function(bool)? setLoading,
  }) async {
    try {
      setLoading?.call(true);

      // Login
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: emailAddress.trim(),
        password: password,
      );

      // Get UID
      final uid = credential.user!.uid;

      // Get user document
      final userData = await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .get();

      // Check user document
      if (!userData.exists) {
        await FirebaseAuth.instance.signOut();

        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('User data not found in Firestore'),
            ),
          );
        }

        return null;
      }

      // Get role
      final role = userData.data()?['role']
          ?.toString()
          .trim()
          .toLowerCase();

      if (!context.mounted) return credential;

      // Client dashboard
      if (role == 'client') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const ClientHomeScreen(),
          ),
        );

      // Developer dashboard
      } else if (role == 'developer') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const DashboardScreen(),
          ),
        );

      // Admin dashboard
      } else if (role == 'admin') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const ManageProjects(),
          ),
        );

      // Invalid role
      } else {
        await FirebaseAuth.instance.signOut();

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid user role')),
        );

        return null;
      }

      return credential;

    } on FirebaseAuthException catch (e) {
      debugPrint('Login error: ${e.code}');

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message ?? 'Login failed')),
        );
      }

      return null;

    } catch (e) {
      debugPrint('Login error: $e');

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }

      return null;

    } finally {
      if (context.mounted) {
        setLoading?.call(false);
      }
    }
  }
}*/




import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:nexustech/view/auth/login.dart';
import 'package:nexustech/view/main_screens/admin/admin_dashboard/manage_projects.dart';
import 'package:nexustech/view/main_screens/client/dashboard/client_dashboad.dart';
import 'package:nexustech/view/main_screens/developer/dashboard/developer_dashboard.dart';

class FirebaseAuthServices {

  // SIGNUP
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
        email: emailAddress.trim(),
        password: password,
      );

      // Get UID
      final uid = credential.user!.uid;

      // Save user information in Firestore
      await FirebaseFirestore.instance.collection('users').doc(uid).set({
        'uid': uid,
        'name': name.trim(),
        'email': emailAddress.trim(),
        'role': role.trim().toLowerCase(),
        'createdAt': FieldValue.serverTimestamp(),
      });

      if (!context.mounted) return credential;

      // Navigate to Login
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
            content: Text(e.message ?? 'Signup failed'),
          ),
        );
      }

      return null;

    } catch (e) {
      debugPrint('Signup error: $e');

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: $e'),
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

  // LOGIN
  Future<UserCredential?> loginWithEmailAndPassword({
    required String emailAddress,
    required String password,
    required BuildContext context,
    Function(bool)? setLoading,
  }) async {
    try {
      setLoading?.call(true);

      // Login with Firebase Authentication
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: emailAddress.trim(),
        password: password,
      );

      // Get UID
      final uid = credential.user!.uid;

      // Get user data from Firestore
      final userData = await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .get();

      // Check user document
      if (!userData.exists) {
        await FirebaseAuth.instance.signOut();

        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('User data not found in Firestore'),
            ),
          );
        }

        return null;
      }

      // Get role
      final role = userData.data()?['role']
          ?.toString()
          .trim()
          .toLowerCase();

      if (!context.mounted) return credential;

      // CLIENT
      if (role == 'client') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const ClientHomeScreen(),
          ),
        );

      // DEVELOPER
      } else if (role == 'developer') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const DashboardScreen(),
          ),
        );

      // ADMIN
      } else if (role == 'admin') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const ManageProjects(),
          ),
        );

      // INVALID ROLE
      } else {
        await FirebaseAuth.instance.signOut();

        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Invalid user role'),
            ),
          );
        }

        return null;
      }

      return credential;

    } on FirebaseAuthException catch (e) {
      debugPrint('Login error: ${e.code}');

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.message ?? 'Login failed'),
          ),
        );
      }

      return null;

    } catch (e) {
      debugPrint('Login error: $e');

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: $e'),
          ),
        );
      }

      return null;

    } finally {
      if (context.mounted) {
        setLoading?.call(false);
      }
    }
  }
}