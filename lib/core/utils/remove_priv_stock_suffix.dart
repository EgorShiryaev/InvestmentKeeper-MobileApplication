import 'to_upper_case_first.dart';

const privStocks = 'привилегированные акции';
const privStocksV2 = 'акции привилегированные';
const newPrivStocks = 'прив. акции';

String removePrivStockSuffix(String title) {
  final privStockUpperFirst = toUpperCaseFirst(privStocks);
  final privStockV2UpperFirst = toUpperCaseFirst(privStocksV2);
  return title
      .replaceAll(privStocks, newPrivStocks)
      .replaceAll(privStockUpperFirst, newPrivStocks)
      .replaceAll(privStocksV2, newPrivStocks)
      .replaceAll(privStockV2UpperFirst, newPrivStocks);
}
