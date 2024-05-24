import 'package:flutter/material.dart';
import 'package:s_mobills/core/core.dart';
import 'package:s_mobills/modules/home/presentation/main/cubit/home_cubit.dart';
import 'package:s_mobills/modules/home/presentation/widgets/home_empty_state.dart';
import 'package:s_mobills/ui/utils/s_mobills_styles.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SpendingCategory extends StatelessWidget {
  const SpendingCategory({
    super.key,
    required this.categoriesDataSource,
  });

  final List<PieByCategory> categoriesDataSource;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Gastos por categoria',
            style: SMobillsTextStyles.subtitle1.copyWith(
              color:
                  Theme.of(context).colorScheme.onBackground.withOpacity(0.75),
              fontWeight: FontWeight.w600,
            ),
          ),
          SMobillsSpacing.sm,
          Card(
            margin: EdgeInsets.zero,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: categoriesDataSource.isEmpty
                  ? const HomeEmptyState()
                  : SfCircularChart(
                      legend: const Legend(
                        isVisible: true,
                        overflowMode: LegendItemOverflowMode.wrap,
                      ),
                      series: [
                        DoughnutSeries<PieByCategory, String>(
                          explode: true,
                          dataSource: categoriesDataSource,
                          xValueMapper: (PieByCategory data, _) =>
                              data.categoryType.displayName,
                          yValueMapper: (PieByCategory data, _) => data.value,
                          dataLabelMapper: (PieByCategory data, _) =>
                              data.categoryType.displayName,
                        ),
                      ],
                      tooltipBehavior: TooltipBehavior(
                        enable: true,
                        format: r'point.x : R$ point.y',
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
