import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:s_mobills/l10n/l10n.dart';
import 'package:s_mobills/modules/auth/presentation/sign_up/cubit/sign_up_cubit.dart';
import 'package:s_mobills/modules/auth/presentation/widgets/widgets.dart';
import 'package:s_mobills/ui/ui.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignUpCubit(),
      child: const SignUpView(),
    );
  }
}

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const AuthHeader(),
          AuthContainer(
            child: Column(
              children: [
                const SizedBox(
                  height: 8,
                ),
                Text(
                  context.l10n.signUp,
                  textAlign: TextAlign.center,
                  style: SMobillsTextStyles.h4.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: context.mediaQuery.size.height * 0.025,
                ),
                SMobillsTextField(
                  hintText: context.l10n.name,
                ),
                SMobillsTextField(
                  hintText: context.l10n.age,
                ),
                SMobillsTextField(
                  hintText: context.l10n.email,
                ),
                SMobillsTextField(
                  hintText: context.l10n.password,
                ),
                SizedBox(
                  height: context.mediaQuery.size.height * 0.075,
                ),
                SMobillsButton(
                  title: context.l10n.signUp,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
