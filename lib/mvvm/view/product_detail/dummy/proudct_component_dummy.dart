class ProductComponentDummy {
  final String? name;
  final String? qty;
  final String? uomName;

  ProductComponentDummy({
    this.name,
    this.qty,
    this.uomName,
  });
}

final List<ProductComponentDummy> listProductComponents = [
  ProductComponentDummy(
    name: 'Cà chua',
    qty: '1',
    uomName: 'kg',
  ),
  ProductComponentDummy(
    name: 'Trứng',
    qty: '1',
    uomName: 'quả',
  ),
  ProductComponentDummy(
    name: 'Kem',
    qty: '500',
    uomName: 'gram',
  ),
];
