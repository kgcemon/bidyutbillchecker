import 'dart:convert';
import 'package:get/state_manager.dart';
import '../model/bidyut_bill_model.dart';
import 'package:http/http.dart' as http;

class BillScreenControllers extends GetxController {

  List<BidyutBillModel> billList = [];

  Future<void> fetchBidyutBillModel() async {
    try {
      final response = await http.get(
        Uri.parse('https://billonwebapi.bpdb.gov.bd/api/CustomerInformation/84641428'),
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = jsonDecode(response.body);
        billList.add(BidyutBillModel.fromJson(jsonData));
        update();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
