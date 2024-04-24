import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:s_mobills/l10n/l10n.dart';
import 'package:s_mobills/modules/profile/presentation/edit/cubit/edit_cubit.dart';
import 'package:s_mobills/ui/ui.dart';

class EditPage extends StatelessWidget {
  const EditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => EditCubit(),
      child: const EditView(),
    );
  }
}

class EditView extends StatelessWidget {
  const EditView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SMobillsAppBar(
        title: context.l10n.myRegistration,
      ),
      backgroundColor: context.colorScheme.primary,
      body: const Column(
        children: [
          Center(
            child: Text('Editar Perfil'),
          ),
        ],
      ),
    );
  }
}
