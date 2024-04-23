import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:s_mobills/l10n/l10n.dart';
import 'package:s_mobills/modules/auth/domain/usecase/do_login_use_case.dart';
import 'package:s_mobills/modules/auth/presentation/login/cubit/login_cubit.dart';
import 'package:s_mobills/modules/auth/presentation/widgets/widgets.dart';
import 'package:s_mobills/ui/ui.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(
        doLoginUseCase: GetIt.I<DoLoginUseCase>(),
      ),
      child: const LoginView(),
    );
  }
}

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: context.colorScheme.secondary,
          body: SingleChildScrollView(
            child: Stack(
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
                        controller: context
                            .read<LoginCubit>()
                            .emailTextEditingController,
                        hintText: context.l10n.email,
                      ),
                      SMobillsTextField(
                        controller: context
                            .read<LoginCubit>()
                            .passwordTextEditingController,
                        hintText: context.l10n.password,
                        obscureText: true,
                      ),
                      SizedBox(
                        height: context.mediaQuery.size.height * 0.075,
                      ),
                      SMobillsButton(
                        title: context.l10n.login,
                        onPressed: context.read<LoginCubit>().login,
                        isLoading: state.isLoading,
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
                            onTap: context.read<LoginCubit>().signUp,
                            child: Text(
                              context.l10n.signUp,
                              textAlign: TextAlign.center,
                              style: SMobillsTextStyles.button.copyWith(
                                color: context.colorScheme.inversePrimary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
