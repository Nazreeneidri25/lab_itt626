import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loader_overlay/loader_overlay.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();

}
final String apiKey = "https://api.mypapit.net/crypto/XRPMYR.json";
List<dynamic> dataList = [];


class _HomepageState extends State<Homepage> {
  Future<void> fetchData() async{
    setState(() {
      dataList.clear();
    });

    context.loaderOverlay.show();
    final response = await http.get(Uri.parse(apiKey));

    if(response.statusCode == 200){
      context.loaderOverlay.hide();
      final results = jsonDecode(response.body);
      setState(() {
        dataList.add(results);
      });
    }

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();

  }

  Widget _buildInfoRow(String label, String? value) {
    dynamic displayValue = value;

    if (value != null) {
      switch (label) {
        case "Bid":
        case "Ask":
        case "Last Trade":
          displayValue = "${double.tryParse(value)?.toStringAsFixed(2)} MYR";
          break;
        case "24h volume":
          displayValue = double.tryParse(value)?.toStringAsFixed(2);
          break;
        case "Date Updated":
          try {
            final date = DateTime.fromMillisecondsSinceEpoch(int.parse(value));
            displayValue = "${date.toLocal()}"; // or format with intl
          } catch (_) {
            displayValue = "Invalid timestamp";
          }
          break;
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Icon(Icons.arrow_right, size: 18, color: Colors.grey.shade600),
          const SizedBox(width: 4),
          Text(
            '$label: ',
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          Flexible(child: Text("$displayValue")
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return
          ListView.builder(
            itemCount: dataList.length,
            itemBuilder: (context, index) {
              final item = dataList[index];
              final timestamp = item['timestamp'];
              final bid = item["bid"];
              final ask = item["ask"];
              final lastTrade = item["last_trade"];
              final volume = item["rolling_24_hour_volume"];
              final status = item["status"];

              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                  Icons.currency_exchange, color: Colors.green),
                              const SizedBox(width: 8),
                              const Text(
                                "XRP/MYR",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: status == "ACTIVE"
                                  ? Colors.green.shade100
                                  : Colors.red.shade100,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              status,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: status == "ACTIVE"
                                    ? Colors.green
                                    : Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),

                      /// Values Rows
                      _buildInfoRow("Bid", bid),
                      _buildInfoRow("Ask", ask),
                      _buildInfoRow("Last Trade", lastTrade),
                      _buildInfoRow("24h Volume", volume),
                      _buildInfoRow("Date Updated", timestamp.toString()),
                    ],
                  ),
                ),
              );
            }
    );
  }
}
