import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oyt_front_core/external/api_handler.dart';
import 'package:oyt_front_core/external/db_handler.dart';
import 'package:oyt_front_core/logger/logger.dart';
import 'package:oyt_front_product/models/product_model.dart';

final productDatasourceProvider = Provider<ProductDatasource>((ref) {
  return ProductDatasourceImpl.fromRead(ref);
});

abstract class ProductDatasource {
  Future<ProductDetailModel> productDetail(String productID);
}

class ProductDatasourceImpl implements ProductDatasource {
  factory ProductDatasourceImpl.fromRead(Ref ref) {
    final apiHandler = ref.read(apiHandlerProvider);
    final dbHandler = ref.read(dbHandlerProvider);
    return ProductDatasourceImpl(apiHandler, dbHandler);
  }

  const ProductDatasourceImpl(this.apiHandler, this.dbHandler);

  final ApiHandler apiHandler;
  final DBHandler dbHandler;

  @override
  Future<ProductDetailModel> productDetail(String productID) async {
    try {
      final res = await apiHandler.get('/menu/toppings/$productID');
      return ProductDetailModel.fromJson(res.responseMap!);
    } catch (e, s) {
      Logger.logError(e.toString(), s);
      rethrow;
    }
  }
}
