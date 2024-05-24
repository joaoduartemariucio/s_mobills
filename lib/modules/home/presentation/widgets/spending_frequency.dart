import 'package:flutter/material.dart';
import 'package:s_mobills/modules/home/presentation/main/cubit/home_cubit.dart';
import 'package:s_mobills/modules/home/presentation/widgets/home_empty_state.dart';
import 'package:s_mobills/ui/utils/s_mobills_styles.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SpendingFrequency extends StatelessWidget {
  const SpendingFrequency({
    super.key,
    required this.days,
    required this.isSpendingEmpty,
  });

  final List<SalesData> days;
  final bool isSpendingEmpty;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Gastos nos últimos 7 dias',
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
              child: isSpendingEmpty
                  ? const HomeEmptyState()
                  : SfCartesianChart(
                      plotAreaBorderWidth: 0,
                      primaryXAxis: const CategoryAxis(
                        interval: 6,
                        majorGridLines: MajorGridLines(width: 0),
                        majorTickLines: MajorTickLines(size: 0),
                        edgeLabelPlacement: EdgeLabelPlacement.shift,
                      ),
                      primaryYAxis: const NumericAxis(
                        labelFormat: r'R$ {value}',
                        interval: 200,
                        axisLine: AxisLine(width: 0),
                        majorGridLines: MajorGridLines(width: 0),
                        majorTickLines: MajorTickLines(size: 0),
                      ),
                      series: [
                        SplineAreaSeries<SalesData, String>(
                          dataSource: days,
                          color: Theme.of(context)
                              .colorScheme
                              .primaryContainer
                              .withOpacity(0.6),
                          borderColor:
                              Theme.of(context).colorScheme.primaryContainer,
                          xValueMapper: (SalesData sales, _) => sales.year,
                          yValueMapper: (SalesData sales, _) => sales.sales,
                        ),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
