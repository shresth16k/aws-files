import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:jeevan/theme.dart';
import 'package:jeevan/widgets/glass_card.dart';
import 'package:jeevan/widgets/neon_button.dart';
import 'package:jeevan/models/app_state.dart';

class AddContactScreen extends StatefulWidget {
  const AddContactScreen({super.key});

  @override
  State<AddContactScreen> createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactScreen> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  bool _saving = false;

  Future<void> _save() async {
    final name = _nameController.text.trim();
    final phone = _phoneController.text.trim();
    if (name.isEmpty || phone.isEmpty) {
      _showDialog(const Icon(Icons.error_outline, color: AppColors.alertRed, size: 48),
          'MISSING INFO', 'Please enter both name and phone number.');
      return;
    }
    setState(() => _saving = true);
    await Future.delayed(const Duration(milliseconds: 600));
    if (!mounted) return;
    context.read<AppState>().addContact(Contact(name: name, phone: phone));
    await _showDialog(
      const Icon(Icons.check_circle_outline, color: AppColors.neonGreen, size: 56),
      'CONTACT ADDED SUCCESSFULLY',
      'The contact has been saved.',
    );
    if (!mounted) return;
    context.pop(true);
  }

  Future<void> _showDialog(Widget icon, String title, String message) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => Dialog(
        backgroundColor: Colors.transparent,
        child: GlassCard(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              icon,
              const SizedBox(height: AppSpacing.md),
              Text(title, style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: AppSpacing.sm),
              Text(message, style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: AppSpacing.lg),
              NeonButton(text: 'OK', onPressed: () => context.pop(), isOutline: true, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(AppSpacing.md, AppSpacing.lg, AppSpacing.md, AppSpacing.xl),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppSpacing.lg),
              GlassCard(
                child: Row(
                  children: [
                    const Icon(Icons.person_add, color: AppColors.neonCyan),
                    const SizedBox(width: AppSpacing.md),
                    Text('ADD NEW CONTACT', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: AppColors.neonCyan)),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              GlassCard(
                child: Column(
                  children: [
                    _buildField('NAME', _nameController, Icons.badge),
                    const SizedBox(height: AppSpacing.md),
                    _buildField('PHONE NUMBER', _phoneController, Icons.call),
                    const SizedBox(height: AppSpacing.xl),
                    NeonButton(text: 'SAVE CONTACT', onPressed: _save, isLoading: _saving),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildField(String label, TextEditingController controller, IconData icon) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.neonCyan),
          ),
          child: Icon(icon, color: AppColors.neonCyan, size: 20),
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: TextField(
            controller: controller,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: label,
              labelStyle: const TextStyle(color: Colors.white54),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
