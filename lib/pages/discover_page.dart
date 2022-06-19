import 'package:flutter/material.dart';
import 'package:stdio_week_6/blocs/discover_bloc.dart';
import 'package:stdio_week_6/constants/my_decoration.dart';
import 'package:stdio_week_6/models/hotel.dart';
import 'package:stdio_week_6/pages/widgets/search_item.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  late final TextEditingController controller;
  final _discoverBloc = DiscoverBloc();

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    _discoverBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          TextField(
              controller: controller,
              onChanged: _discoverBloc.query,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.search,
                    color: Colors.blueAccent,
                  ),
                  onPressed: () => _discoverBloc.goResultPage(context),
                ),
                hintText: 'Search anything',
                border: MyDecoration.outlineInputBorder,
                enabledBorder: MyDecoration.outlineInputBorder,
                focusedBorder: MyDecoration.outlineInputBorder,
              ),
              onSubmitted: (value) => _discoverBloc.goResultPage(context)),
          Expanded(
            child: StreamBuilder<List<Hotel>>(
                stream: _discoverBloc.stream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const SizedBox();
                  }
                  final data = snapshot.data!;
                  return ListView.separated(
                    separatorBuilder: (context, index) => const Divider(
                      thickness: 2,
                      height: 40,
                    ),
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      final hotel = data[index];
                      return SearchItem(hotel: hotel);
                    },
                  );
                }),
          )
        ],
      ),
    );
  }
}
