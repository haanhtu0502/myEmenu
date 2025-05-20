class AppInformation {
  int? _orgId;
  int? _tenantId;
  int? _tableId;
  int? _floorId;
  int? _posTerminalId;
  String? _tableNo;
  String? _floorNo;
  int? _priceListId;
  String? _orgName;
  String? _address;

  static final AppInformation _instance = AppInformation._internal();
  factory AppInformation() {
    return _instance;
  }
  AppInformation._internal();

  void initData({
    int? orgId,
    int? tenantId,
    int? tableId,
    int? floorId,
    int? posTerminalId,
    String? tableNo,
    String? floorNo,
    int? priceListId,
    String? orgName,
    String? address,
  }) {
    _orgId = orgId;
    _tenantId = tenantId;
    _tableId = tableId;
    _floorId = floorId;
    _posTerminalId = posTerminalId;
    _tableNo = tableNo;
    _floorNo = floorNo;
    _priceListId = priceListId;
    _orgName = orgName;
    _address = address;
  }

  void updateData({
    int? orgId,
    int? tenantId,
    int? tableId,
    int? floorId,
    int? posTerminalId,
    String? tableNo,
    String? floorNo,
    int? priceListId,
    String? orgName,
    String? address,
  }) {
    _orgId = orgId ?? _orgId;
    _tenantId = tenantId ?? _tenantId;
    _tableId = tableId ?? _tableId;
    _floorId = floorId ?? _floorId;
    _posTerminalId = posTerminalId ?? _posTerminalId;
    _tableNo = tableNo ?? _tableNo;
    _floorNo = floorNo ?? _floorNo;
    _priceListId = priceListId ?? _priceListId;
    _orgName = orgName ?? _orgName;
    _address = address ?? _address;
  }

  bool isInitialized() {
    return _tenantId != null &&
        _orgId != null &&
        _tableId != null &&
        _floorId != null &&
        _posTerminalId != null &&
        _tableNo != null &&
        _floorNo != null &&
        _priceListId != null &&
        _orgName != null &&
        _address != null;
  }

  @override
  String toString() {
    return 'AppInformation{_orgId: $_orgId, _tenantId: $_tenantId, _tableId: $_tableId, _floorId: $_floorId, _posTerminalId: $_posTerminalId, _tableNo: $_tableNo, _floorNo: $_floorNo, _priceListId: $_priceListId, _orgName: $_orgName, _address: $_address}';
  }

  int? get orgId => _orgId;
  int? get tenantId => _tenantId;
  int? get tableId => _tableId;
  int? get floorId => _floorId;
  int? get posTerminalId => _posTerminalId;
  String? get tableNo => _tableNo;
  String? get floorNo => _floorNo;
  int? get priceListId => _priceListId;
  String? get orgName => _orgName;
  String? get address => _address;
}
