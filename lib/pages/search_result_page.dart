import 'package:flutter/material.dart';
import 'package:stdio_week_6/blocs/switch_list_type_bloc.dart';
import 'package:stdio_week_6/constants/assest_image.dart';
import 'package:stdio_week_6/constants/my_color.dart';
import 'package:stdio_week_6/constants/my_font.dart';
import 'package:stdio_week_6/models/hotel.dart';
import 'package:stdio_week_6/pages/hotel_detail_page.dart';
import 'package:stdio_week_6/widgets/custom_loading.dart';

class SearchResultPage extends StatefulWidget {
  const SearchResultPage({Key? key, required this.result}) : super(key: key);
  final List<Hotel> result;

  @override
  State<SearchResultPage> createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage>
    with TickerProviderStateMixin {
  final _switchListTypeBloc = SwitchListTypeBloc();
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
    _switchListTypeBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: _switchListTypeBloc.stream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CustomLoading();
          }
          final isGrid = snapshot.data!;

          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Result',
                style: MyFont.blueHeading,
              ),
              actions: [
                Align(
                  child: InkWell(
                    onTap: () {
                      if (isGrid) {
                        _animationController.reverse();
                        _switchListTypeBloc.toggleListType();
                      } else {
                        _animationController.forward();
                        _switchListTypeBloc.toggleListType();
                      }
                    },
                    child: AnimatedIcon(
                        icon: AnimatedIcons.list_view,
                        progress: _animationController),
                  ),
                ),
                const SizedBox(width: 18)
              ],
              foregroundColor: MyColor.blue,
              backgroundColor: MyColor.background,
              elevation: 0,
              centerTitle: true,
            ),
            body: GridView.builder(
                itemCount: widget.result.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: isGrid ? 2 : 1,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) {
                  final hotel = widget.result[index];
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => HotelDetailPage(hotel: hotel)));
                    },
                    child: Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 6,
                          // offset: Offset(0, 7), // changes position of shadow
                        ),
                      ]),
                      child: Stack(
                        children: [
                          FadeInImage.assetNetwork(
                            placeholder: AssetsImage.fadeImageLoading,
                            image: hotel.imagePath,
                            width: double.infinity,
                            height: 350,
                            fit: BoxFit.cover,
                          ),
                          Align(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                hotel.name,
                                style: MyFont.whiteSpacing,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          );
        });
  }
}
