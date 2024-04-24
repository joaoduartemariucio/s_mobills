import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:s_mobills/l10n/l10n.dart';
import 'package:s_mobills/modules/profile/module.dart';
import 'package:s_mobills/ui/ui.dart';

class EditPage extends StatelessWidget {
  const EditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => EditCubit(
        doGetUserInfoUseCase: GetIt.I<DoGetUserInfoUseCase>(),
        doUpdateUserInfoUseCase: GetIt.I<DoUpdateUserInfoUseCase>(),
        doDeleteUserUseCase: GetIt.I<DoDeleteUserUseCase>(),
        doLogoutUserUseCase: GetIt.I<DoLogoutUserUseCase>(),
      )..getInfo(),
      child: const EditView(),
    );
  }
}

class EditView extends StatelessWidget {
  const EditView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditCubit, EditState>(
      builder: (context, state) {
        return Scaffold(
          appBar: SMobillsAppBar(
            title: context.l10n.myRegistration,
          ),
          backgroundColor: context.colorScheme.primary,
          body: SingleChildScrollView(
            child: state.startDeleteAccount
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      SMobillsSpacing.md,
                      Center(
                        child: Text(context.l10n.editProfileDetails),
                      ),
                      Container(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            SMobillsTextField(
                              controller:
                                  context.read<EditCubit>().nameEditController,
                              hintText: context.l10n.name,
                            ),
                            SMobillsSpacing.sm,
                            SMobillsTextField(
                              controller:
                                  context.read<EditCubit>().ageEditController,
                              hintText: context.l10n.age,
                            ),
                            SMobillsSpacing.sm,
                            SMobillsTextField(
                              controller:
                                  context.read<EditCubit>().emailEditController,
                              hintText: context.l10n.email,
                              readOnly: true,
                            ),
                            SMobillsSpacing.md,
                            SMobillsButton(
                              title: context.l10n.save,
                              onPressed: context.read<EditCubit>().updateInfo,
                              isLoading: state.isLoading,
                            ),
                            SMobillsSpacing.sm,
                            SMobillsButton(
                              title: context.l10n.deleteAccount,
                              onPressed:
                                  context.read<EditCubit>().deleteAccount,
                              isLoading: state.isLoading,
                              buttonStyle: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                              ),
                              textStyle: SMobillsTextStyles.button.copyWith(
                                fontSize: FontSize.subtitle1,
                                color: context.colorScheme.error,
                              ),
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
