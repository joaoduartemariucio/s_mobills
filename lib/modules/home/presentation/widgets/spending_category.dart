import 'package:flutter/material.dart';
import 'package:s_mobills/modules/home/presentation/main/cubit/home_cubit.dart';
import 'package:s_mobills/ui/utils/s_mobills_styles.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SpendingCategory extends StatelessWidget {
  const SpendingCategory({
    super.key,
    required this.days,
  });

  final List<SalesData> days;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Gastos por categoria',
            style: SMobillsTextStyles.subtitle1.copyWith(
              color:
                  Theme.of(context).colorScheme.onBackground.withOpacity(0.75),
            ),
          ),
          SMobillsSpacing.sm,
          Card(
            margin: EdgeInsets.zero,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: SfCircularChart(
                legend: const Legend(
                  isVisible: true,
                  overflowMode: LegendItemOverflowMode.wrap,
                ),
                series: [
                  DoughnutSeries<SalesData, String>(
                    explode: true,
                    dataSource: days,
                    xValueMapper: (SalesData data, _) => data.year,
                    yValueMapper: (SalesData data, _) => data.sales,
                    dataLabelMapper: (SalesData data, _) => data.year,
                    dataLabelSettings: const DataLabelSettings(isVisible: true),
                  )
                ],
                tooltipBehavior:
                    TooltipBehavior(enable: true, format: 'point.x : point.y%'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
