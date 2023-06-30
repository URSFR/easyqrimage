import 'package:flutter/material.dart';

enum Ecc {
  Low,
  Middle,
  Quality,
  High,

}

enum Charsets{
  ISO88591,
  UTF8

}

enum Formats{
  png,
  gif,
  jpeg,
  jpg,
  svg,
  eps
}

class EasyQRImage extends StatelessWidget {
  /// The text to store within the QR code.
  ///
  /// Minimal charcount: 1
  ///
  /// Maximal charcount: Depends on the ecc parameter (the more data redundancy is used, the less characters fit in your QR code) and from other factors, which are too complicated to describe here in a short way. Nevertheless up to 900 characters should work in general.
  ///
  /// Best practice: The shorter the better. Since many older cell phones have problems with QR codes >Version 4 (that means a matrix with 33×33 modules), you should use as little data as possible. We suggest using URL shorteners like bitly for very long URLs. However, industrial scanners should have no problems regarding complex QR codes.
  final String data;

  /// Specifies the size of the QR code image you want to generate (in px for raster graphic formats like png, gif or jpeg); as logical unit for vector graphics (svg, eps).
  ///
  /// Minimum value: 10
  ///
  /// Maximal value: 1000 (if format=png/gif/jpeg/jpg), 1000000 (if format=svg/eps)
  ///
  /// Default value: 200
  final int size;

  /// Color of the data modules
  ///
  /// Default value: Colors.black
  ///
  /// Best Practice: Colors.black. Otherwise a much darker color than the color of the background to get a good contrast. A helpful color may be found by looking for the so called web colors.
  final Color? color;

  /// Color of the background
  ///
  /// Default: Colors.white
  ///
  /// Best Practice: Colors.white. Otherwise a much brighter color than the color of the data modules to get a good contrast. A helpful color may be found by looking for the so called web colors https://en.wikipedia.org/wiki/Web_colors.
  final Color? backgroundColor;

  /// Thickness of a margin in pixels. The margin will always have the same color as the background.
  ///
  ///  It will not be added to the width of the image set by size, therefore it has to be smaller than at least one third of the size value. The margin will be drawn in addition to an eventually set qzone value. The margin parameter will be ignored if svg or eps is used as QR code format (=if the QR code output is a vector graphic).
  ///
  /// Minimum Value: 0
  ///
  /// Maximum Value: 50
  ///
  /// Default Value: 1
  final int? margin;

  /// Thickness of a margin (=“quiet zone”, an area without disturbing elements to help readers locating the QR code), in modules as measuring unit.
  ///
  /// This means a value of 1 leads to a drawn margin around the QR code which is as thick as a data pixel/module of the QR code. The quiet zone will always have the same color as the background
  ///
  /// The quiet zone will be drawn in addition to an eventually set margin value.
  ///
  /// Minimum Value: 0
  ///
  /// Maximum Value: 100
  ///
  /// Default Value: 0
  ///
  /// Best Practice: An at least 1 module wide quiet zone is required for optimal scanning results. The QR code standard recommendes a “quiet zone” of 4.
  final int? quietZone;

  /// It is possible to create the QR code picture using different file formats, available are PNG, GIF, JPEG and the vector graphic formats SVG and EPS (=you can create QR code vector graphics / QR code EPS / QR code SVG as needed for professional printing).
  ///
  /// Default Value: png
  ///
  /// Best Practice: For websites: png oder gif. JPEG was developed for natural pictures, its results are worse than GIF/PNG for line drawings and comparable contents. For professional print usage: svg oder eps because vector-based graphics can be scaled by any amount without degrading quality.
  final Formats? format;

  /// Specifies the charset the text submitted via data parameter is encoded in. Note: you don't have to care about converting your data if charset-source and charset-target got different values, the API does all the needed work automatically.
  ///
  /// Default value: UTF-8
  final Charsets? charsetTarget;

  /// Specifies the charset to encode the text submitted via data parameter with, before storing it within the QR code. Note: you don't have to care about converting your data if charset-source and charset-target got different values, the API does all the needed work automatically.
  ///
  /// Default value: UTF-8
  ///
  /// Best Practice: Unfortunately, the QR code specification does not provide a place to store the used charset within a QR code. This means that QR code readers have to take a guess, or always assume a certain charset. Some older software even just ignores non ASCII characters, but we usually had no problems with ISO-8859-1 regarding legacy readers. In common (=if support for very old devices is not needed or you want to store special characters), you should use UTF-8 here. If you want to be on the safe side in every case, you should use only the following characters (=ASCII): !"#$%&'()*+,-./0123456789:;<=>? @ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_ `abcdefghijklmnopqrstuvwxyz{|}~
  final Charsets? charsetSource;

  /// Defines the error correction code (ECC) which determines the degree of data redundancy. The more data redundancy exists, the more data can be restored if a QR code is damaged (i.e. scratches on a QR code sticker or something like that).
  ///
  /// Default value: L
  ///
  /// Best Practice: L. A higher ECC results in more data to save and thus leads to a QR code with more data pixels and a larger data matrix. Because many cell phone readers have problems with QR codes >Version 4 (that means a matrix of 33×33 modules), the lowest ECC is the best choice for common purpose – legacy QR code readers are a more common problem than destroyed QR codes.
  final Ecc? ECC;

  EasyQRImage({Key? key, required this.data, this.size = 10, this.color = Colors.black, this.backgroundColor = Colors.white, this.margin = 1, this.quietZone = 0, this.format, this.charsetTarget, this.charsetSource, this.ECC}) : super(key: key);

  String get getFormats {
    switch (format) {
      case Formats.gif:
        return 'gif';
      case Formats.eps:
        return 'eps';
      case Formats.jpeg:
        return 'jpeg';
      case Formats.jpg:
        return 'jpg';
      case Formats.png:
        return 'png';
      case Formats.svg:
        return 'svg';
      default:
        return 'png';
    }
  }

  String get getCharsetsTarget {
    switch (charsetTarget) {
      case Charsets.ISO88591:
        return 'ISO-8859-1';
      case Charsets.UTF8:
        return 'UTF-8';
      default:
        return 'UTF-8';
    }
  }

  String get getCharsetsSource {
    switch (charsetSource) {
      case Charsets.ISO88591:
        return 'ISO-8859-1';
      case Charsets.UTF8:
        return 'UTF-8';
      default:
        return 'UTF-8';
    }
  }
  String get getECC {
    switch (ECC) {
      case Ecc.Low:
        return 'L';
      case Ecc.Middle:
        return 'M';
      case Ecc.Quality:
        return 'Q';
      case Ecc.High:
        return 'H';
      default:
        return 'L';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network("http://api.qrserver.com/v1/create-qr-code/?data=$data&size=${size}x$size&charset-source=$getCharsetsSource&charset-target=$getCharsetsTarget&ecc=$getECC&color=${color!.value.toRadixString(16).substring(2)}&bgcolor=${backgroundColor!.value.toRadixString(16).substring(2)}&margin=$margin&qzone=$quietZone&format=$getFormats"
      ),
    );
  }
}
