import 'package:equatable/equatable.dart';

class BottomSheetSelectionModel extends Equatable {
  const BottomSheetSelectionModel({
    required this.id,
    required this.name,
  });

  final num id;
  final String name;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
