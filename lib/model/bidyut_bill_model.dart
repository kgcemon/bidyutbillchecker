class BidyutBillModel {
  String message;
  List<List<CustomerInfo>> customerInfo;
  BalanceInfo balanceInfo;
  List<BillInfo> billInfo;
  String finalBalanceInfo;

  BidyutBillModel({
    required this.message,
    required this.customerInfo,
    required this.balanceInfo,
    required this.billInfo,
    required this.finalBalanceInfo,
  });

  factory BidyutBillModel.fromJson(Map<String, dynamic> json) => BidyutBillModel(
    message: json["message"],
    customerInfo: List<List<CustomerInfo>>.from(json["customerInfo"].map((x) =>
    List<CustomerInfo>.from(x.map((x) => CustomerInfo.fromJson(x))))),
    balanceInfo: BalanceInfo.fromJson(json["balanceInfo"]),
    billInfo: List<BillInfo>.from(json["billInfo"].map((x) => BillInfo.fromJson(x))),
    finalBalanceInfo: json["finalBalanceInfo"],
  );
}

class BalanceInfo {
  List<Result> result;
  int id;
  int status;
  bool isCanceled;
  bool isCompleted;
  bool isCompletedSuccessfully;
  int creationOptions;
  bool isFaulted;

  BalanceInfo({
    required this.result,
    required this.id,
    required this.status,
    required this.isCanceled,
    required this.isCompleted,
    required this.isCompletedSuccessfully,
    required this.creationOptions,
    required this.isFaulted,
  });

  factory BalanceInfo.fromJson(Map<String, dynamic> json) => BalanceInfo(
    result: List<Result>.from(json["Result"].map((x) => Result.fromJson(x))),
    id: json["Id"] ?? "",
    status: json["Status"] ?? "",
    isCanceled: json["IsCanceled"] ?? "",
    isCompleted: json["IsCompleted"] ?? "",
    isCompletedSuccessfully: json["IsCompletedSuccessfully"] ?? "",
    creationOptions: json["CreationOptions"] ?? "",
    isFaulted: json["IsFaulted"] ?? "",
  );
}

class Result {
  dynamic opnKwhSrRdng;
  dynamic consKwhSr;
  dynamic currentBill;
  dynamic arrearBill;
  dynamic totalBill;
  dynamic paidAmt;
  dynamic balance;
  dynamic invoiceNum;

  Result({
    required this.opnKwhSrRdng,
    required this.consKwhSr,
    required this.currentBill,
    required this.arrearBill,
    required this.totalBill,
    required this.paidAmt,
    required this.balance,
    required this.invoiceNum,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    opnKwhSrRdng: json["OPN_KWH_SR_RDNG"] ?? "",
    consKwhSr: json["CONS_KWH_SR"] ?? "",
    currentBill: json["CURRENT_BILL"] ?? "",
    arrearBill: json["ARREAR_BILL"] ?? "",
    totalBill: json["TOTAL_BILL"] ?? "",
    paidAmt: json["PAID_AMT"] ?? "",
    balance: json["BALANCE"] ?? "",
    invoiceNum: json["INVOICE_NUM"] ?? "",
  );
}

class BillInfo {
  String consumerNumber;
  Descr descr;
  CustomerName customerName;
  Tariff tariff;
  DateTime billMonth;
  String billNo;
  String cd;
  String meterCondKwh;
  dynamic opnKwhSrRdng;
  dynamic consKwhSr;
  dynamic currentBill;
  dynamic arrearBill;
  dynamic totalBill;
  DateTime invoiceDueDate;
  dynamic paidAmt;
  DateTime? receiptDate;
  dynamic balance;
  dynamic invoiceNum;

  BillInfo({
    required this.consumerNumber,
    required this.descr,
    required this.customerName,
    required this.tariff,
    required this.billMonth,
    required this.billNo,
    required this.cd,
    required this.meterCondKwh,
    required this.opnKwhSrRdng,
    required this.consKwhSr,
    required this.currentBill,
    required this.arrearBill,
    required this.totalBill,
    required this.invoiceDueDate,
    required this.paidAmt,
    this.receiptDate,
    required this.balance,
    required this.invoiceNum,
  });

  factory BillInfo.fromJson(Map<String, dynamic> json) => BillInfo(
    consumerNumber: json["CONSUMER_NUMBER"] ?? "",
    descr: descrValues.map[json["DESCR"]]!,
    customerName: customerNameValues.map[json["CUSTOMER_NAME"]]!,
    tariff: tariffValues.map[json["TARIFF"]]!,
    billMonth: DateTime.parse(json["BILL_MONTH"]),
    billNo: json["BILL_NO"] ?? "",
    cd: json["CD"] ?? "",
    meterCondKwh: json["METER_COND_KWH"] ?? "",
    opnKwhSrRdng: json["OPN_KWH_SR_RDNG"] ?? "",
    consKwhSr: json["CONS_KWH_SR"] ?? "",
    currentBill: json["CURRENT_BILL"]?.toDouble() ?? "",
    arrearBill: json["ARREAR_BILL"]?.toDouble() ?? "",
    totalBill: json["TOTAL_BILL"] ?? "",
    invoiceDueDate: DateTime.parse(json["INVOICE_DUE_DATE"]),
    paidAmt: json["PAID_AMT"] ?? "",
    receiptDate: json["RECEIPT_DATE"] == null ? null : DateTime.parse(json["RECEIPT_DATE"]) ,
    balance: json["BALANCE"] ?? "",
    invoiceNum: json["INVOICE_NUM"] ?? "",
  );
}

enum CustomerName {
  MD_ABUL_KASHEM
}

final customerNameValues = EnumValues({
  "MD. ABUL KASHEM": CustomerName.MD_ABUL_KASHEM
});

enum Descr {
  DIST_DIV_KHAGRACHARI
}

final descrValues = EnumValues({
  "Dist. Div. Khagrachari": Descr.DIST_DIV_KHAGRACHARI
});

enum Tariff {
  LT_A
}

final tariffValues = EnumValues({
  "LT-A": Tariff.LT_A
});

class CustomerInfo {
  int custId;
  String customerNumber;
  CustomerName customerName;
  Tariff tariff;
  String address;
  String locationCode;
  String billGroup;
  String book;
  int walkingSequence;
  String startBillCycle;
  Descr descr;
  String consExtgNum;
  String billCycleCode;
  String meterNum;
  int connectionId;
  DateTime meterConnectDate;
  DateTime meterInstallDate;
  String meterStatus;
  String meterSide;
  dynamic overallMfKwh;
  String usageType;

  CustomerInfo({
    required this.custId,
    required this.customerNumber,
    required this.customerName,
    required this.tariff,
    required this.address,
    required this.locationCode,
    required this.billGroup,
    required this.book,
    required this.walkingSequence,
    required this.startBillCycle,
    required this.descr,
    required this.consExtgNum,
    required this.billCycleCode,
    required this.meterNum,
    required this.connectionId,
    required this.meterConnectDate,
    required this.meterInstallDate,
    required this.meterStatus,
    required this.meterSide,
    required this.overallMfKwh,
    required this.usageType,
  });

  factory CustomerInfo.fromJson(Map<String, dynamic> json) => CustomerInfo(
    custId: json["CUST_ID"],
    customerNumber: json["CUSTOMER_NUMBER"],
    customerName: customerNameValues.map[json["CUSTOMER_NAME"]]!,
    tariff: tariffValues.map[json["TARIFF"]]!,
    address: json["ADDRESS"],
    locationCode: json["LOCATION_CODE"],
    billGroup: json["BILL_GROUP"],
    book: json["BOOK"],
    walkingSequence: json["WALKING_SEQUENCE"],
    startBillCycle: json["START_BILL_CYCLE"],
    descr: descrValues.map[json["DESCR"]]!,
    consExtgNum: json["CONS_EXTG_NUM"],
    billCycleCode: json["BILL_CYCLE_CODE"],
    meterNum: json["METER_NUM"],
    connectionId: json["CONNECTION_ID"],
    meterConnectDate: DateTime.parse(json["METER_CONNECT_DATE"]),
    meterInstallDate: DateTime.parse(json["METER_INSTALL_DATE"]),
    meterStatus: json["METER_STATUS"],
    meterSide: json["METER_SIDE"],
    overallMfKwh: json["OVERALL_MF_KWH"],
    usageType: json["USAGE_TYPE"],
  );
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
