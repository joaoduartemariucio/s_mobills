import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:s_mobills/core/core.dart';
import 'package:s_mobills/l10n/l10n.dart';
import 'package:s_mobills/modules/profile/module.dart';
import 'package:s_mobills/modules/transactions/module.dart';
import 'package:s_mobills/ui/ui.dart';

class TransactionView extends StatelessWidget {
  const TransactionView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: SMobillsAppBar(
            title: state.transactionId != -1
                ? (state.transactionType == TransactionType.expense
                    ? context.l10n.editExpenseTransaction
                    : context.l10n.editIncomeTransaction)
                : (state.transactionType == TransactionType.expense
                    ? context.l10n.newExpenseTransaction
                    : context.l10n.newIncomeTransaction),
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
                    .read<TransactionCubit>()
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
                            context.read<TransactionCubit>().onChangedDone,
                      ),
                      InputRow.text(
                        controller: context
                            .read<TransactionCubit>()
                            .descriptionTextEditingController,
                        icon: Icons.edit_outlined,
                        hintText: context.l10n.description,
                      ),
                      InputRow.selectable(
                        icon: Icons.calendar_today_outlined,
                        hintText: context.l10n.date,
                        options: _dateOptions(state, context),
                      ),
                      InputRow.selectable(
                        icon: Icons.money_outlined,
                        hintText: context.l10n.account,
                        options: _selectAccountOptions(state, context),
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
                          context.read<TransactionCubit>().saveTransaction();
                        },
                        isLoading: state.isLoading,
                      ),
                      SMobillsSpacing.sm,
                      Visibility(
                        visible: state.transactionId != -1,
                        child: SMobillsButton(
                          title: context.l10n.deleteAccount,
                          onPressed: context
                              .read<TransactionCubit>()
                              .deleteTransaction,
                          buttonStyle: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                          ),
                          textStyle: SMobillsTextStyles.button.copyWith(
                            fontSize: FontSize.subtitle1,
                            color: context.colorScheme.error,
                          ),
                        ),
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
    TransactionState state,
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
                .read<TransactionCubit>()
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

  List<Widget> _selectAccountOptions(
    TransactionState state,
    BuildContext context,
  ) {
    return [
      GestureDetector(
        onTap: () async {
          final result = await showModalBottomSheet<Map<String, dynamic>>(
            context: context,
            builder: (_) {
              return const AccountsPage(
                isNewTransaction: true,
              );
            },
          );

          if (result != null) {
            final bankAccount = result['bankAccount'] as BankAccount;
            context
                .read<TransactionCubit>()
                .onChangeSelectedBankAccount(bankAccount);
          }
        },
        child: Chip(
          label: Text(
            state.bankAccountName,
          ),
        ),
      ),
    ];
  }

  List<Widget> _dateOptions(
    TransactionState state,
    BuildContext context,
  ) {
    return [
      Visibility(
        visible: state.showAllDateOptions,
        child: GestureDetector(
          onTap: () => context.read<TransactionCubit>().onChangeSelectedDate(
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
          onTap: () => context.read<TransactionCubit>().onChangeSelectedDate(
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

            context.read<TransactionCubit>().onChangeSelectedDate(date);
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

            context.read<TransactionCubit>().onChangeSelectedDate(date);
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
