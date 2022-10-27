import 'package:equatable/equatable.dart';

enum ReportCharStatus { notLoading, loading, success, failure }

class ReportCharState extends Equatable {
  const ReportCharState(
      {this.status = ReportCharStatus.notLoading, this.message = ''});

  final ReportCharStatus status;
  final String message;

  ReportCharState copyWith({ReportCharStatus? status, String? message}) {
    return ReportCharState(
        status: status ?? this.status, message: message ?? this.message);
  }

  @override
  List<Object?> get props => [status];
}
