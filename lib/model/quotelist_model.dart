class QuoteList {
  QuoteList({
    required this.authorName,
    required this.quote,
    required this.title,
    this.docId = '',
  });
  factory QuoteList.fromMap(Map<String, dynamic> data) {
    return QuoteList(
        authorName: data['authorName'],
        quote: data['content'],
        title: data['title'],
        docId: data['docId']);
  }
  late String authorName;
  late String quote;
  late String title;
  String docId;

  // Convert the Quote instance to a Map
  Map<String, dynamic> toMap() {
    return {
      'authorName': authorName,
      'content': quote,
      'title': title,
      'docId': docId,
    };
  }
}

List favList = [];
//
// final quoteList = <QuoteList>[
//   QuoteList(
//       title: 'Love Yourself',
//       authorName: 'Peter McWilliams',
//       quote:
//           'To love yourself is to understand that you dont need to be perfect to be good.',
//       docId: 'quote1'),
//   QuoteList(
//       title: 'Love Yourself',
//       authorName: 'William Shakespeare',
//       quote: 'Self-love, my liege, is not so vile a sin, as self-neglecting.',
//       docId: 'quote2'),
//   QuoteList(
//       title: 'Love Yourself',
//       authorName: 'Lucille Ball',
//       quote: 'Love yourself first and everything else falls into line.',
//       docId: 'quote3'),
//   QuoteList(
//       title: 'Love Yourself',
//       authorName: 'Buddha',
//       quote:
//           'You yourself, as much as anybody in the entire universe, deserve your love and affection.',
//       docId: 'quote4'),
//   QuoteList(
//       title: 'Love Yourself',
//       authorName: 'Robert Morley',
//       quote: 'To fall in love with yourself is the first secret to happiness.',
//       docId: 'quote5'),
//   QuoteList(
//       title: 'Love Yourself',
//       authorName: 'Jean Shinoda Bolen',
//       quote:
//           'When you recover or discover something that nourishes your soul and brings joy, care enough about yourself to make room for it in your life.',
//       docId: 'quote6'),
//   QuoteList(
//       title: 'Love Yourself',
//       authorName: 'Katrina Mayer',
//       quote: 'Loving yourself isn’t vanity. It’s sanity.',
//       docId: 'quote7'),
//   QuoteList(
//       title: 'Sadness',
//       authorName: 'Charlie Chaplin',
//       quote: 'The saddest thing I can imagine is to get used to luxury.',
//       docId: 'quote8'),
//   QuoteList(
//       title: 'Sadness',
//       authorName: 'Jim Rohn',
//       quote:
//           'The walls we build around us to keep out the sadness also keep out the joy.',
//       docId: 'quote9'),
// ];

List<String> imagesList = [
  'https://images.unsplash.com/photo-1433086966358-54859d0ed716?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8bmF0dXJlfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60',
  'https://images.unsplash.com/photo-1426604966848-d7adac402bff?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8bmF0dXJlfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60',
  'https://plus.unsplash.com/premium_photo-1673264933212-d78737f38e48?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fG5hdHVyZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60',
  'https://images.unsplash.com/photo-1475924156734-496f6cac6ec1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fG5hdHVyZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60',
  'https://images.unsplash.com/photo-1475113548554-5a36f1f523d6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fG5hdHVyZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60',
  'https://images.unsplash.com/photo-1470252649378-9c29740c9fa8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjF8fG5hdHVyZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60'
      'https://www.zedge.net/wallpaper/a0689271-c618-4c70-b47e-bc3728cd2527'
      'https://images.unsplash.com/photo-1455218873509-8097305ee378?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mjh8fG5hdHVyZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60',
  'https://images.unsplash.com/photo-1444464666168-49d633b86797?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzR8fG5hdHVyZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60',
  'https://plus.unsplash.com/premium_photo-1664547606956-22749d0e0d77?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mzd8fG5hdHVyZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60',
  'https://plus.unsplash.com/premium_photo-1673002094173-b16f2b946780?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NTl8fG5hdHVyZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60',
  'https://images.unsplash.com/photo-1536431311719-398b6704d4cc?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NjJ8fG5hdHVyZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60',
  'https://images.unsplash.com/photo-1499002238440-d264edd596ec?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8ODB8fG5hdHVyZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60',
  'https://images.unsplash.com/photo-1517928260182-5688aead3066?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8bmF0dXJlJTIwaWNlJTIwbmlnaHR8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60',
  'https://images.unsplash.com/photo-1501862700950-18382cd41497?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fG5hdHVyZSUyMHN0YXJzfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60'
];
