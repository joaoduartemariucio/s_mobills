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
      backgroundColor: context.isDarkMode ? Colors.black : Colors.white,
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
                      color: context.isDarkMode ? Colors.grey : Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'João Vitor Duarte Mariucio',
                  style: SMobillsTextStyles.h6.copyWith(
                    color: context.isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'joaovitorduartemariucio@gmail.com',
                  style: SMobillsTextStyles.subtitle1.copyWith(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(24),
                ),
                color:
                    context.isDarkMode ? SMobillsColors.darkBlue : Colors.white,
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
