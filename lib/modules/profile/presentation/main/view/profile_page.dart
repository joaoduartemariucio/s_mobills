import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:s_mobills/l10n/l10n.dart';
import 'package:s_mobills/modules/profile/presentation/main/cubit/profile_cubit.dart';
import 'package:s_mobills/modules/profile/presentation/widgets/widgets.dart';
import 'package:s_mobills/ui/ui.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileCubit(),
      child: const ProfileView(),
    );
  }
}

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SMobillsAppBar(
        title: context.l10n.profile,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            width: context.mediaQuery.size.width,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 75,
                  backgroundColor: SMobillsColors.randomColor(),
                  child: Text(
                    'JM',
                    style: SMobillsTextStyles.h3.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'João Vitor Duarte Mariucio',
                  style: SMobillsTextStyles.h6,
                ),
                const SizedBox(
                  height: 4,
                ),
                const Text(
                  'joaovitorduartemariucio@gmail.com',
                  style: SMobillsTextStyles.subtitle1,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(24),
                ),
              ),
              child: Column(
                children: [
                  ProfileMenuItem(
                    title: context.l10n.myRegistration,
                    icon: Icons.person_outlined,
                    onTap: () {},
                  ),
                  ProfileMenuItem(
                    title: context.l10n.exit,
                    icon: Icons.logout_outlined,
                    onTap: () {},
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
