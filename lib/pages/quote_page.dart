import 'package:flutter/material.dart';
import 'package:stdio_week_5/dummydata.dart';
import 'package:stdio_week_5/widgets/quote_item.dart';

class QuotePage extends StatelessWidget {
  const QuotePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      children: quoteData.map((e) => QuoteItem(quote: e)).toList(),
    );
  }
}
