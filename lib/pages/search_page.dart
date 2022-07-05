import 'package:flutter/material.dart';
import 'package:stdio_week_6/blocs/search_bloc.dart';
import 'package:stdio_week_6/constants/assets_icon.dart';
import 'package:stdio_week_6/constants/my_color.dart';
import 'package:stdio_week_6/constants/my_font.dart';
import 'package:stdio_week_6/helper/hide_keyboard.dart';
import 'package:stdio_week_6/models/hotel.dart';
import 'package:stdio_week_6/widgets/image_button.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late final TextEditingController controller;
  final FocusNode _textFocusNode = FocusNode();
  final _searchBloc = SearchBloc();

  @override
  void initState() {
    controller = TextEditingController();
    _textFocusNode.requestFocus();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    _searchBloc.dispose();
    _textFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          hideKeyboard(context: context);
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      ImageButton(
                          assetsIcon: AssetsIcon.arrowBack,
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Hero(
                          tag: 'search',
                          child: Material(
                            color: MyColor.white,
                            elevation: 10,
                            borderRadius: BorderRadius.circular(32),
                            child: TextField(
                                controller: controller,
                                focusNode: _textFocusNode,
                                onChanged: _searchBloc.query,
                                textAlignVertical: TextAlignVertical.center,
                                style:
                                    const TextStyle(fontSize: 16, height: 1.53),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  isDense: true,
                                  suffixIcon: IconButton(
                                    icon: const Icon(Icons.search,
                                        color: Colors.blueAccent, size: 20),
                                    onPressed: () =>
                                        _searchBloc.goResultPage(context),
                                  ),
                                  hintText: 'Search anything',
                                  labelStyle: MyFont.greyTitle,
                                  border: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                ),
                                onSubmitted: (value) =>
                                    _searchBloc.goResultPage(context)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Expanded(
                  child: StreamBuilder<List<Hotel>>(
                      stream: _searchBloc.stream,
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
                            return InkWell(
                              onTap: () => _searchBloc.goResultPage(context, suggest: hotel.name),
                              child: Row(children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: Text(hotel.name),
                                  ),
                                ),
                              ]),
                            );
                          },
                        );
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
