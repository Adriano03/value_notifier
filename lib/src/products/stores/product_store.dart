import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:value_notifier/src/products/services/products_service.dart';
import 'package:value_notifier/src/products/states/product_state.dart';

class ProductStore extends ValueNotifier<ProductState> {
  final ProductsService service;

  ProductStore(this.service) : super(InitialProductState());

  // A reatividade é a partir do value que recebe a lista de produtos;
  Future fetchProducts() async {
    value = LoadingProductState();
    await Future.delayed(const Duration(seconds: 1));
    try {
      final products = await service.fetchProducts();
      value = SuccessProductState(products);
    } catch (e) {
      log(e.toString());
      value = ErrorProductState(e.toString());
    }
  }
}
