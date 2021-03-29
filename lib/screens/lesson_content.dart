import 'package:flutter/material.dart';
import 'package:taleb/widgets/my_appbar.dart';
import 'package:taleb/widgets/drawer.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';
class LessonContent extends StatefulWidget {

  @override
  _LessonContentState createState() => _LessonContentState();
}

class _LessonContentState extends State<LessonContent> {
  String url='https://drive.google.com/file/d/1CQYeu89lxXfQB6xxj98o0Aw5k0J4m29h/view?usp=sharing';
  // String pdfAssets='assets/ccna.pdf';
  PDFDocument _doc;
  bool _loading;

  _initPdf()async{
    setState(() {
      _loading =true;
    });
    final doc= await PDFDocument.fromURL(url);
    setState(() {
      _doc=doc;
      _loading=false;
    });
  }

  @override
  void initState() {
    super.initState();
    _initPdf();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myAppBar('الدرس الاول'),
        drawer: MyDrawer(),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/onlinecourse.jpg"),
              fit: BoxFit.cover,
              colorFilter:
              ColorFilter.mode(Colors.black45, BlendMode.darken),
            ),
          ),
          child:_loading?Center(child: CircularProgressIndicator(),):PDFViewer(document: _doc,),
        ));
  }
}
