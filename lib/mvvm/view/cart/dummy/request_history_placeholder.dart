import 'package:emenu/mvvm/data/model/product_model.dart';
import 'package:emenu/mvvm/data/model/request_history/request_history_model.dart';

final requestHistoryItemPlaceholder = RequestHistoryModel(
    valueStatus: "Placeholder Status",
    qty: 0,
    product: ProductModel(
      name: "Placeholder Product",
    ),
    salesPrice: 1000.0,
    created: "00:00 00-0000",
    timeWaiting: "10");
