import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mt5_leeon1/core/di/service_locator.dart';
import 'package:mt5_leeon1/core/router/app_router.gr.dart';
import 'package:mt5_leeon1/core/services/secure_storage_service/secure_storage_service.dart';

class NewsPreferencesPage extends StatelessWidget {
  const NewsPreferencesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(6),
        width: 400,
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              const Text(''),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'Preferences',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Container(
                width: double.infinity,
                height: 1,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              _settings('ACCOUNT'),
              Container(
                width: double.infinity,
                height: 1,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              _settings('SETTINGS'),
              Container(
                width: double.infinity,
                height: 1,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              _settings('GENRES PREFERENCES'),
              Container(
                width: double.infinity,
                height: 1,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              _settingsLogout(context, 'LOGOUT'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _settings(String settingName) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(settingName, style: const TextStyle(color: Colors.black)),
          const Icon(Icons.arrow_forward_ios, color: Colors.black),
        ],
      ),
    );
  }

  Future<void> _logout(BuildContext context) async {
    final secureStorageService = getIt<SecureStorageService>();

    await secureStorageService.delete(SecureStorageKeys.accessToken);
    await secureStorageService.delete(SecureStorageKeys.refreshToken);

    if (!context.mounted) return;

    context.router.replaceAll([const AuthRouter()]);
  }

  Widget _settingsLogout(BuildContext context, String settingName) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      onPressed: () => _logout(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(settingName, style: const TextStyle(color: Colors.black)),
        ],
      ),
    );
  }
}
