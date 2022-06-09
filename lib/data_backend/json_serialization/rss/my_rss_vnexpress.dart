import 'RSS_Helper.dart';
import 'RSSItem.dart';
import 'my_rss_page.dart';

import 'package:flutter/material.dart';
class MyRSSPage1 extends StatefulWidget {
  const MyRSSPage1({Key? key}) : super(key: key);

  @override
  State<MyRSSPage1> createState() => _MyRSSPage1State();
}

class _MyRSSPage1State extends State<MyRSSPage1> {

  late Future<List<RSSItem>?> rssitems;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("VNExpress"),
      ),
      body: RefreshIndicator(
        onRefresh: () async{
          rssitems = RSS_Helper.readVNExpressRSS()
              .whenComplete(() => setState);
        },
        child: FutureBuilder<List<RSSItem>?>(
          future: rssitems,
          builder: (context,snapshot){
            if(snapshot.hasError){
              print("Lỗi");
              // print();
              return const Text("lỗi");
            }
            return snapshot.hasData
                ? Container(
              child: ListView.separated(

                itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () async{
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RSSPage2(url: snapshot.data![index].link)
                                )
                            );
                          },
                          child: Row(
                            children: [
                              Container(
                                height: 80,
                                width:  120,
                                child: _getImage(snapshot.data![index].imageUrl),
                              ),
                              const SizedBox(width: 10,),
                              Expanded(
                                child: Text(
                                  snapshot.data![index].title!,
                                  style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w800),
                                ),
                              ),
                            ],
                          ),

                        ),
                        Text(
                          snapshot.data![index].description!,
                          style: const TextStyle(fontSize: 14),
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => Divider(thickness:1 ),
                itemCount: snapshot.data?.length??0,

              ),
            )
                :Center(child: const CircularProgressIndicator(),);
          },

        ),
      ),
    );
  }
  @override
  void initState()
  {
    super.initState();
    rssitems=RSS_Helper.readVNExpressRSS();
  }
  Widget _getImage(String? Url) {
    if (Url == null)
      return Center(
        child: Icon(Icons.image),
      );
    else
      return Image.network(Url, fit: BoxFit.fitWidth,);
  }
}



