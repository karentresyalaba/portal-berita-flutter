import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import 'auth/login_screen.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkAuthStatus();
  }

  Future<void> _checkAuthStatus() async {
    // Delay untuk splash screen terlihat
    await Future.delayed(const Duration(seconds: 2));
    
    if (!mounted) return;

    try {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      
      // Tunggu sebentar untuk memastikan auth state sudah di-load
      await Future.delayed(const Duration(milliseconds: 500));
      
      if (!mounted) return;

      // Navigate berdasarkan status autentikasi
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => authProvider.isAuthenticated
              ? const HomeScreen()
              : const LoginScreen(),
        ),
      );
    } catch (e) {
      debugPrint('Error checking auth: $e');
      
      if (!mounted) return;
      
      // Jika error, arahkan ke login screen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
            ],
          ),
        ),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.article,
                size: 100,
                color: Colors.white,
              ),
              SizedBox(height: 24),
              Text(
                'Portal Berita',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 16),
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}