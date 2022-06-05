import 'package:stdio_week_5/model/quote.dart';
import 'package:stdio_week_5/model/story.dart';

final List<Story> dummydata = [
  Story(
      id: '1',
      title: 'love',
      content: 'fall in love',
      feeling: 4,
      time: DateTime(2022, 5, 30)),
  Story(
      id: '2',
      title: 'yes',
      content: 'fall in yes',
      feeling: 1,
      time: DateTime(2022, 5, 31)),
  Story(
      id: '3',
      title: 'no',
      content: 'fall in no',
      feeling: 2,
      time: DateTime.now()),
  Story(
      id: '4',
      title: 'yub',
      content: 'fall in yub',
      feeling: 3,
      time: DateTime(2022, 5, 29)),
];

final List<Quote> quoteData = [
  const Quote(
    quote:
        "A person’s name is to him or her the sweetest and most important sound in any language.",
    athor: 'Dale Carnegie',
    imgPath:
        'https://zicxa.com/media/magefan_blog/dale-carnegie-9238769-1-402.jpg',
  ),
  const Quote(
    quote: 'Failure is the condiment that gives success its flavor.',
    athor: 'Truman',
    imgPath:
        'https://cdnmedia.baotintuc.vn/Upload/ESSoZh9IeVhxwO8Bh87Q/files/2020/11/3/truman4.jpg',
  ),
  const Quote(
    quote: 'Genius is one percent inspiration and 99 percent perspiration',
    athor: 'Thomas Edison',
    imgPath:
        'https://photo-cms-kienthuc.zadn.vn/zoom/800/uploaded/hongnhat/2021_06_10/4/su-that-ve-phat-minh-bong-den-day-toc-noi-tieng-cua-thomas-edison-hinh-3.jpg',
  )
];
