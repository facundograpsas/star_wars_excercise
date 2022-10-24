import 'package:equatable/equatable.dart';

enum ReportCharStatus { notLoading, loading, success, failure }

class ReportCharState extends Equatable {
  const ReportCharState({this.status = ReportCharStatus.notLoading});

  final ReportCharStatus status;

  ReportCharState copyWith({ReportCharStatus? status}) {
    return ReportCharState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [status];
}
