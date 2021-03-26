import 'package:url_launcher/url_launcher.dart';

void customLauncher (command) async {
  if (await canLaunch(command)){
    await launch(command);
  }else{
    print('cannot launch $command');
  }
}