import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:s_mobills/core/helpers/typedefs.dart';

part 'period_request.freezed.dart';

@freezed
class PeriodRequest with _$PeriodRequest {
  factory PeriodRequest({
    required DateTime initialDate,
    required DateTime endDate,
  }) = _PeriodRequest;

  PeriodRequest._();

  JSON toJson() {
    return <String, Object?>{
      'initialDate': initialDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
    };
  }
}
