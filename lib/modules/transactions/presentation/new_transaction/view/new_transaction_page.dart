// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:s_mobills/l10n/l10n.dart';
import 'package:s_mobills/modules/transactions/domain/model/category_type.dart';
import 'package:s_mobills/modules/transactions/domain/model/transaction_type.dart';
import 'package:s_mobills/modules/transactions/module.dart';
import 'package:s_mobills/modules/transactions/presentation/select_category/view/select_category_page.dart';
import 'package:s_mobills/modules/transactions/presentation/new_transaction/cubit/new_transaction_cubit.dart';
import 'package:s_mobills/ui/ui.dart';

class NewTransactionPage extends StatelessWidget {
  const NewTransactionPage({
    required this.transactionType,
    super.key,
  });

  final TransactionType transactionType;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewTransactionCubit()
        ..setupTransactionType(
          transactionType: transactionType,
        ),
      child: const NewTransactionView(),
    );
  }
}

class NewTransactionView extends StatelessWidget {
  const NewTransactionView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewTransactionCubit, NewTransactionState>(
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: SMobillsAppBar(
            title: state.transactionType == TransactionType.expense
                ? context.l10n.newExpenseTransaction
                : context.l10n.newIncomeTransaction,
            backgroundColor: context.colorScheme.primary,
            elevation: 0,
          ),
          backgroundColor: context.colorScheme.primary,
          body: Column(
            children: [
              Text(
                context.l10n.transactionInstructions,
                style: SMobillsTextStyles.caption.copyWith(
                  color: context.colorScheme.onPrimary,
                ),
              ),
              SMobillsSpacing.md,
              TransactionValue(
                controller: context
                    .read<NewTransactionCubit>()
                    .transactionValueCurrencyTextFieldController,
              ),
              SMobillsSpacing.sm,
              Flexible(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: context.colorScheme.background,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(15),
                    ),
                  ),
                  child: Column(
                    children: [
                      InputRow.checkbox(
                        icon: Icons.check_circle_outline,
                        hintText:
                            state.transactionType == TransactionType.expense
                                ? context.l10n.paidOut
                                : context.l10n.received,
                        switchOn: state.done,
                        onChanged:
                            context.read<NewTransactionCubit>().onChangedDone,
                      ),
                      InputRow.text(
                        controller: context
                            .read<NewTransactionCubit>()
                            .descriptionTextEditingController,
                        icon: Icons.edit_outlined,
                        hintText: context.l10n.description,
                      ),
                      InputRow.selectable(
                        icon: Icons.calendar_today_outlined,
                        hintText: context.l10n.date,
                        options: _dateOptions(state, context),
                      ),
                      Visibility(
                        visible:
                            state.transactionType == TransactionType.expense,
                        child: InputRow.selectable(
                          icon: Icons.category_outlined,
                          hintText: context.l10n.category,
                          options: _categoriesOptions(state, context),
                        ),
                      ),
                      Visibility(
                        visible:
                            state.transactionType == TransactionType.income,
                        child: InputRow.selectable(
                          icon: Icons.category_outlined,
                          hintText: context.l10n.category,
                          options: _categoriesOptions(state, context),
                        ),
                      ),
                      const Spacer(),
                      SMobillsButton(
                        title: context.l10n.save,
                        onPressed: () {
                          context.read<NewTransactionCubit>().saveTransaction();
                        },
                      ),
                      SMobillsSpacing.lg,
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  List<Widget> _categoriesOptions(
    NewTransactionState state,
    BuildContext context,
  ) {
    return [
      GestureDetector(
        onTap: () async {
          final result = await showModalBottomSheet<Map<String, dynamic>>(
            context: context,
            builder: (_) {
              return SelectCategoryPage(type: state.transactionType);
            },
          );

          if (result != null) {
            final categoryType = result['categoryType'] as CategoryType;

            context
                .read<NewTransactionCubit>()
                .onChangeSelectedCategory(categoryType);
          }
        },
        child: Chip(
          label: Text(
            state.categoryType.displayName,
          ),
        ),
      ),
    ];
  }

  List<Widget> _dateOptions(NewTransactionState state, BuildContext context) {
    return [
      Visibility(
        visible: state.showAllDateOptions,
        child: GestureDetector(
          onTap: () => context.read<NewTransactionCubit>().onChangeSelectedDate(
                TransactionDate.yesterdayDate,
              ),
          child: Chip(
            label: Text(context.l10n.yesterday),
            backgroundColor: (state.selectedDate?.isYesterday ?? false)
                ? context.colorScheme.primaryContainer
                : context.colorScheme.background,
          ),
        ),
      ),
      SMobillsInline.sm,
      Visibility(
        visible: state.showAllDateOptions,
        child: GestureDetector(
          onTap: () => context.read<NewTransactionCubit>().onChangeSelectedDate(
                TransactionDate.todayDate,
              ),
          child: Chip(
            label: Text(context.l10n.today),
            backgroundColor: (state.selectedDate?.isToday ?? false)
                ? context.colorScheme.primaryContainer
                : context.colorScheme.background,
          ),
        ),
      ),
      SMobillsInline.sm,
      Visibility(
        visible: state.showAllDateOptions,
        child: GestureDetector(
          onTap: () async {
            final date = await showDatePicker(
              context: context,
              initialDate: state.selectedDate ?? DateTime.now(),
              firstDate: TransactionDate.initialDate,
              lastDate: TransactionDate.lastDate,
            );

            context.read<NewTransactionCubit>().onChangeSelectedDate(date);
          },
          child: Chip(
            label: Text(context.l10n.other),
          ),
        ),
      ),
      Visibility(
        visible: !state.showAllDateOptions,
        child: GestureDetector(
          onTap: () async {
            final date = await showDatePicker(
              context: context,
              initialDate: state.selectedDate ?? DateTime.now(),
              firstDate: TransactionDate.initialDate,
              lastDate: TransactionDate.lastDate,
            );

            context.read<NewTransactionCubit>().onChangeSelectedDate(date);
          },
          child: Column(
            children: [
              SMobillsSpacing.md,
              Text(
                SMobillsDateFormatter.formatDate(
                  context: context,
                  date: state.selectedDate ?? DateTime.now(),
                ),
                style: SMobillsTextStyles.body1,
              ),
              SMobillsSpacing.md,
            ],
          ),
        ),
      ),
    ];
  }
}
