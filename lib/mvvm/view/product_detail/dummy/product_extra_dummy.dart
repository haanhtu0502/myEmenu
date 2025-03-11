class ProductExtraDummy {
  final String? name;
  final num? price;
  final int? qty;

  ProductExtraDummy({
    this.name,
    this.price,
    this.qty,
  });
}

List<ProductExtraDummy> listProductExtras = [
  ProductExtraDummy(
    name: 'Extra 1',
    price: 10000,
    qty: 1,
  ),
  ProductExtraDummy(
    name: 'Extra 2',
    price: 20000,
    qty: 2,
  ),
  ProductExtraDummy(
    name: 'Extra 3',
    price: 30000,
    qty: 3,
  ),
  ProductExtraDummy(
    name: 'Extra 4',
    price: 40000,
    qty: 4,
  ),
];
