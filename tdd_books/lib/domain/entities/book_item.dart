import 'package:equatable/equatable.dart';

class BookItem extends Equatable {
  final String title;
  final String thumbnail;

  const BookItem({
    required this.title,
    required this.thumbnail,
  });

  @override
  List<Object?> get props => [title, thumbnail];
}
