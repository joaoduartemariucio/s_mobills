import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:s_mobills/core/local/key_value_storage_service.dart';
import 'package:s_mobills/l10n/l10n.dart';
import 'package:s_mobills/modules/auth/presentation/splash/cubit/splash_cubit.dart';
import 'package:s_mobills/ui/ui.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashCubit(storage: GetIt.I<KeyValueStorageService>()),
      child: const SplashView(),
    );
  }
}

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashCubit, SplashState>(
      builder: (context, state) {
        context.read<SplashCubit>().checkIfUserAuthenticated();

        return Scaffold(
          backgroundColor: context.colorScheme.background,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: DefaultTextStyle(
                  textAlign: TextAlign.center,
                  style: SMobillsTextStyles.h2.copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.colorScheme.onBackground,
                    letterSpacing: 2,
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      WavyAnimatedText(context.l10n.appName),
                      FlickerAnimatedText(context.l10n.appName),
                      ScaleAnimatedText(context.l10n.appName),
                    ],
                    totalRepeatCount: 100,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
