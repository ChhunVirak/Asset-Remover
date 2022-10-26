import 'dart:async';
import 'dart:io';

Future<void> main() async {
  var assetdir = Directory('/Users/virak/App/cic-app/assets');
  var listasset = assetdir.listSync(recursive: true).whereType<File>();

  // var list = dir.listSync();\
  List<String> assetpaths = [];

  for (var a in listasset) {
    var p = a.path;
    // print(p);
    if (p.endsWith('png') ||
        p.endsWith('svg') ||
        p.endsWith('jpg') ||
        p.endsWith('jpeg')) {
      assetpaths.add(p);
    }
  }

  var dir = Directory('/Users/virak/App/cic-app/lib');
  var listFile = dir.listSync(recursive: true).whereType<File>();
  Future<bool> iscontain(String sortpath) async {
    for (var a in listFile) {
      var p = a.path;
      if (p.endsWith('dart')) {
        var content = await File(p).readAsString();
        // for (var line in content) {}
        bool contain = content.contains(sortpath);
        if (contain) {
          return true;
        }
      }
    }
    return false;
  }

  ///list
  List<String> png = [];
  List<String> jpg = [];
  List<String> jpeg = [];
  List<String> svg = [];

  for (String asset in assetpaths) {
    String sortpath = asset.substring(asset.indexOf('assets'));
    bool yesContain = await iscontain(sortpath);
    if (!yesContain) {
      if (sortpath.endsWith('png')) {
        png.add(sortpath);
      }
      if (sortpath.endsWith('jpg')) {
        jpg.add(sortpath);
      }
      if (sortpath.endsWith('jpeg')) {
        jpeg.add(sortpath);
      }
      if (sortpath.endsWith('svg')) {
        svg.add(sortpath);
      }

      print(sortpath);
    }
  }

  print('Unused png = ${png.length}');
  print('Unused svg = ${svg.length}');
  print('Unused jpg = ${jpg.length}');
  print('Unused jpeg = ${jpeg.length}');
}
