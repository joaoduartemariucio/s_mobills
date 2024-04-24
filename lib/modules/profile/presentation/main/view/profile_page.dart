import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:s_mobills/l10n/l10n.dart';
import 'package:s_mobills/modules/profile/domain/usecase/do_logout_user_use_case.dart';
import 'package:s_mobills/modules/profile/presentation/main/cubit/profile_cubit.dart';
import 'package:s_mobills/modules/profile/presentation/widgets/widgets.dart';
import 'package:s_mobills/ui/ui.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileCubit(
        doLogoutUserUseCase: GetIt.I<DoLogoutUserUseCase>(),
      ),
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
      backgroundColor: context.colorScheme.primary,
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
                Text(
                  'João Vitor Duarte Mariucio',
                  style: SMobillsTextStyles.h6.copyWith(
                    color: context.colorScheme.onPrimary,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'joaovitorduartemariucio@gmail.com',
                  style: SMobillsTextStyles.subtitle1.copyWith(
                    color: context.colorScheme.onPrimary.withAlpha(150),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(24),
                  topLeft: Radius.circular(24),
                ),
                color: context.colorScheme.background,
              ),
              child: Column(
                children: [
                  ProfileMenuItem(
                    title: context.l10n.myRegistration,
                    icon: Icons.person_outlined,
                    onTap: context.read<ProfileCubit>().editProfile,
                  ),
                  ProfileMenuItem(
                    title: context.l10n.myWallet,
                    icon: Icons.credit_card_outlined,
                    onTap: () {},
                  ),
                  ProfileMenuItem(
                    title: context.l10n.bankAccounts,
                    icon: Icons.wallet_outlined,
                    onTap: () {},
                  ),
                  ProfileMenuItem(
                    title: context.l10n.deleteAccount,
                    icon: Icons.delete_outlined,
                    onTap: () {},
                  ),
                  ProfileMenuItem(
                    title: context.l10n.exit,
                    icon: Icons.logout_outlined,
                    onTap: context.read<ProfileCubit>().logout,
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
