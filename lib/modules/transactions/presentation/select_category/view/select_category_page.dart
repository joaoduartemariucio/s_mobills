import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:s_mobills/modules/transactions/domain/model/category_type.dart';
import 'package:s_mobills/modules/transactions/domain/model/transaction_type.dart';
import 'package:s_mobills/modules/transactions/presentation/select_category/cubit/select_category_cubit.dart';

class SelectCategoryPage extends StatelessWidget {
  const SelectCategoryPage({
    required this.type,
    super.key,
  });

  final TransactionType type;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SelectCategoryCubit()..filterBy(type),
      child: const SelectCategoryView(),
    );
  }
}

class SelectCategoryView extends StatelessWidget {
  const SelectCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectCategoryCubit, SelectCategoryState>(
      builder: (context, state) {
        return Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(15),
            ),
          ),
          child: ListView.separated(
            itemBuilder: (context, index) {
              final item = state.categories[index];
              return GestureDetector(
                onTap: () => context
                    .read<SelectCategoryCubit>()
                    .onSelectedCategory(item),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: item.color,
                        child: Icon(item.icon),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        item.displayName,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Divider(
                height: 0.25,
                color:
                    Theme.of(context).colorScheme.onSurface.withOpacity(0.05),
              );
            },
            itemCount: state.categories.length,
          ),
        );
      },
    );
  }
}
