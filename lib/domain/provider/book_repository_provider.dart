import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uaizu_app/domain/provider/client_provider.dart';
import 'package:uaizu_app/domain/repository/book_repository_impl.dart';
import 'package:uaizu_app/infrastructure/data_source/book_data_source.dart';

final _bookDataSourceProvider = Provider((ref) {
  return BookDataSource(ref.watch(libraryClientProvider));
});

final bookRepositoryProvider = Provider((ref) {
  return BookRepositoryImpl(ref.watch(_bookDataSourceProvider));
});
