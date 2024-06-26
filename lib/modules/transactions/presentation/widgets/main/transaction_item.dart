import 'package:flutter/material.dart';
import 'package:s_mobills/ui/ui.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    super.key,
    required this.isExpense,
    required this.isDone,
    required this.name,
    required this.description,
    required this.value,
  });

  final bool isExpense;
  final bool isDone;
  final String name;
  final String description;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: isExpense ? Colors.red : Colors.green,
            child: const Icon(
              size: 16,
              Icons.sync_alt_outlined,
              color: Colors.white,
            ),
          ),
          SMobillsInline.md,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: SMobillsTextStyles.body1,
              ),
              Text(
                description,
                style: SMobillsTextStyles.subtitle2.copyWith(
                  color: Colors.grey,
                ),
              ),
              Text(
                isExpense
                    ? isDone
                        ? "Pago"
                        : "Pendente"
                    : isDone
                        ? "Recebido"
                        : "Pendente",
                style: SMobillsTextStyles.body2.copyWith(
                  fontWeight: FontWeight.w600,
                  color: isDone ? Colors.green : Colors.yellow,
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            value,
            style: SMobillsTextStyles.body2.copyWith(
              fontWeight: FontWeight.w600,
              color: isExpense ? Colors.red : Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
