// ignore_for_file: avoid_dynamic_calls
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:s_mobills/l10n/l10n.dart';
import 'package:s_mobills/modules/home/presentation/main/cubit/home_cubit.dart';
import 'package:s_mobills/ui/ui.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SMobillsAppBar(
        title: context.l10n.home,
      ),
      body: const Column(
        children: [
          Text(
            'Hello Home Page',
            style: SMobillsTextStyles.body1,
          ),
        ],
      ),
    );
  }
}
