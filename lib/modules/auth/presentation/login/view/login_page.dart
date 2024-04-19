import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:s_mobills/l10n/l10n.dart';
import 'package:s_mobills/modules/auth/presentation/login/cubit/login_cubit.dart';
import 'package:s_mobills/modules/auth/presentation/widgets/widgets.dart';
import 'package:s_mobills/ui/ui.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(),
      child: const LoginView(),
    );
  }
}

class LoginView extends StatelessWidget {
  const LoginView({super.key});

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
                  context.l10n.login,
                  textAlign: TextAlign.center,
                  style: SMobillsTextStyles.h4.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: context.mediaQuery.size.height * 0.075,
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
                  title: context.l10n.login,
                  onPressed: () {},
                ),
                SizedBox(
                  height: context.mediaQuery.size.height * 0.075,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      context.l10n.dontHaveAccount,
                      textAlign: TextAlign.center,
                      style: SMobillsTextStyles.body1,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    GestureDetector(
                      child: Text(
                        context.l10n.signUp,
                        textAlign: TextAlign.center,
                        style: SMobillsTextStyles.button,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
