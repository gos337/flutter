import 'package:a05_homet_mobile_renewal_01/1_model/ContentDetail.dart';
import 'package:a05_homet_mobile_renewal_01/4_viewModel/VM_ContentDetail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
  final VM_ContentDetail _vmContentDetail = VM_ContentDetail();

  DetailScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    print("####### DetailScreen Entered");
    return Consumer<VM_ContentDetail>(
      builder: (context, provider, widget) {
        print("####### DetailScreen Inner");

        ContentDetail data = provider.contentDetail;

        return DetailPageUI(context: context, data: data);
      },
    );
  }

  Scaffold DetailPageUI({required BuildContext context, required ContentDetail data}) {
    return Scaffold(
      backgroundColor: const Color(0xff292c33),
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ContentDetailView(snapshot: data),
        ),
      ),
    );
  }
}

class ContentDetailView extends StatelessWidget {
  final ContentDetail snapshot;
  const ContentDetailView({super.key, required this.snapshot});

  static const textStyle = TextStyle(
    color: Colors.white54,
    fontSize: 30,
    fontWeight: FontWeight.w300,
  );

  @override
  Widget build(BuildContext context) {
    Map items = MakeResource(snapshot);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          _UpperUI(items),
          _MiddleUI(items),
          const Divider(
            height: 40,
            color: Colors.white54,
            thickness: 0.5,
            // endIndent: 30,
          ),
          Container(child: const Text("CCC")),
        ],
      ),
    );

    // ContentDetail
  }

  Map MakeResource(ContentDetail data) {
    Map items = <String, String?>{};

    items = {
      "title": data.result.content.title,
      "desc": data.result.content.desc,
      "count": data.result.content.count,
    };

    return items;
  }

  Widget _UpperUI(Map items) {
    return SizedBox(
      height: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            items["title"],
            style: textStyle.copyWith(fontWeight: FontWeight.w700, color: Colors.white),
          ),
          Text(
            items["desc"],
            style: textStyle.copyWith(fontSize: 15),
          ),
        ],
      ),
    );
  }

  Widget _MiddleUI(Map items) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "운동",
            style: textStyle.copyWith(fontWeight: FontWeight.w700, fontSize: 15),
          ),
          Text(
            "${items["count"]} 편",
            style: textStyle.copyWith(fontWeight: FontWeight.w700, fontSize: 15, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
