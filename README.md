EasyQRImage provides the facility with a lightweight package to generate qr and customize them.

The creation of this package was thanks to the API of https://goqr.me/

## Getting started

Easily creation of QR Images with custom data 

Customize QR Images

## Usage

```dart
       EasyQRImage(
            data: 'String', //Required
            size: 100, //Optional
            color: Colors.white, //Optional
            backgroundColor: Colors.black, //Optional
            margin: 5, //Optional
            quietZone: 4, //Optional
            format: Formats.png, //Optional
            charsetSource: Charsets.UTF8, //Optional
            charsetTarget: Charsets.UTF8, //Optional
            ECC: Ecc.High, //Optional
        ),
```

## API DOCS

https://goqr.me/api/doc/create-qr-code/

## Aditional Info

The example was added on another github for lower package size
