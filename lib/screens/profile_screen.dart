import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../providers/profile_provider.dart';
import '../models/profile_model.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _bioController = TextEditingController();
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  void _loadProfile() {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final profileProvider = Provider.of<ProfileProvider>(context, listen: false);
    
    if (authProvider.user != null) {
      profileProvider.loadProfile(authProvider.user!.uid);
      
      _nameController.text = authProvider.user!.displayName;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  Future<void> _handleUpdate() async {
    if (_formKey.currentState!.validate()) {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      final profileProvider = Provider.of<ProfileProvider>(context, listen: false);
      
      final profile = ProfileModel(
        uid: authProvider.user!.uid,
        displayName: _nameController.text.trim(),
        email: authProvider.user!.email,
        phoneNumber: _phoneController.text.trim(),
        bio: _bioController.text.trim(),
        updatedAt: DateTime.now(),
      );

      final success = await profileProvider.updateProfile(profile);

      if (mounted) {
        if (success) {
          setState(() {
            _isEditing = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Profil berhasil diperbarui'),
              backgroundColor: Colors.green,
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(profileProvider.errorMessage ?? 'Gagal memperbarui profil'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final profileProvider = Provider.of<ProfileProvider>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        actions: [
          if (!_isEditing)
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                setState(() {
                  _isEditing = true;
                });
              },
            ),
        ],
      ),
      body: profileProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      child: Text(
                        authProvider.user?.displayName[0].toUpperCase() ?? 'U',
                        style: const TextStyle(
                          fontSize: 48,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    CustomTextField(
                      controller: _nameController,
                      label: 'Nama Lengkap',
                      prefixIcon: Icons.person,
                      enabled: _isEditing,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nama tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      controller: TextEditingController(
                        text: authProvider.user?.email ?? '',
                      ),
                      label: 'Email',
                      prefixIcon: Icons.email,
                      enabled: false,
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      controller: _phoneController,
                      label: 'Nomor Telepon',
                      prefixIcon: Icons.phone,
                      keyboardType: TextInputType.phone,
                      enabled: _isEditing,
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      controller: _bioController,
                      label: 'Bio',
                      prefixIcon: Icons.info,
                      maxLines: 3,
                      enabled: _isEditing,
                    ),
                    const SizedBox(height: 24),
                    if (_isEditing)
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () {
                                setState(() {
                                  _isEditing = false;
                                  _loadProfile();
                                });
                              },
                              child: const Text('Batal'),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: CustomButton(
                              text: 'Simpan',
                              onPressed: _handleUpdate,
                              isLoading: profileProvider.isLoading,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
    );
  }
}