import 'package:chef_wizz/gen/assets.gen.dart';
import 'package:chef_wizz/ui/ui.dart';
import 'package:chef_wizz/utils/localization_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

@RoutePage()
class ProfileScreen extends HookWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = context.appLocalizations;
    final nameController = useTextEditingController(text: 'Taiwo Farawe');
    final emailController =
        useTextEditingController(text: 'farawetaiwo@gmail.com');
    return ScaffoldLayout(
      padding: const EdgeInsets.fromLTRB(16, 24 + kToolbarHeight, 16, 37),
      resizeToAvoidBottomInset: false,
      child: Column(
        children: [
          Center(
            child: Text(
              locale.profile,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 24,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  CircleAvatar(
                    child: AppAssets.images.tempAvatar.image(
                      width: 72,
                      height: 72,
                    ),
                  ),
                  const SizedBox(height: 24),
                  AppTextField(
                    label: locale.fullName,
                    controller: nameController,
                  ),
                  const SizedBox(height: 24),
                  AppTextField(
                    label: locale.emailAddress,
                    controller: emailController,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
