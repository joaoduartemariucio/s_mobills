import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:s_mobills/l10n/l10n.dart';
import 'package:s_mobills/modules/auth/module.dart';
import 'package:s_mobills/ui/ui.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignUpCubit(
        doCreateUserUseCase: GetIt.I<DoCreateUserUseCase>(),
      ),
      child: const SignUpView(),
    );
  }
}

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
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
                        controller: context
                            .read<SignUpCubit>()
                            .nameTextEditingController,
                        hintText: context.l10n.name,
                        keyboardType: TextInputType.name,
                      ),
                      SMobillsTextField(
                        controller: context
                            .read<SignUpCubit>()
                            .ageTextEditingController,
                        hintText: context.l10n.age,
                        keyboardType: TextInputType.number,
                      ),
                      SMobillsTextField(
                        controller: context
                            .read<SignUpCubit>()
                            .emailTextEditingController,
                        hintText: context.l10n.email,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SMobillsTextField(
                        hintText: context.l10n.password,
                        controller: context
                            .read<SignUpCubit>()
                            .passwordTextEditingController,
                        obscureText: true,
                      ),
                      SizedBox(
                        height: context.mediaQuery.size.height * 0.075,
                      ),
                      SMobillsButton(
                        title: context.l10n.signUp,
                        onPressed: context.read<SignUpCubit>().createAccount,
                        isLoading: state.isLoading,
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
