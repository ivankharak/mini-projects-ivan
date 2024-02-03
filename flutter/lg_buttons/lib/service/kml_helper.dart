_orbitTag() {
  double heading = 0;
  int orbit = 0;
  String finalOrbit = '';

  while (orbit <= 36) {
    if (heading >= 360) heading -= 360;
    finalOrbit += '''
            <gx:FlyTo>
              <gx:duration>1.2</gx:duration>
              <gx:flyToMode>smooth</gx:flyToMode>
              <LookAt>
                 <LookAt><longitude>${76.6084}</longitude><latitude>${28.8958}</latitude><altitude>200</altitude><range>${3000}</range><tilt>70</tilt><heading>$heading</heading><gx:altitudeMode>relativeToGround</gx:altitudeMode></LookAt>
              </LookAt>
            </gx:FlyTo>
          ''';
    heading += 10;
    orbit += 1;
  }
  return finalOrbit;
}

String orbit() {
  final content = _orbitTag();
  String orbit = '''
<?xml version="1.0" encoding="UTF-8"?>
      <kml xmlns="http://www.opengis.net/kml/2.2" xmlns:gx="http://www.google.com/kml/ext/2.2" xmlns:kml="http://www.opengis.net/kml/2.2" xmlns:atom="http://www.w3.org/2005/Atom">
        <gx:Tour>
          <name>Orbit</name>
          <gx:Playlist> 
            $content
          </gx:Playlist>
        </gx:Tour>
      </kml>
    ''';
  return orbit;
}

String balloon() {
  return '''
<?xml version="1.0" encoding="UTF-8"?>
<kml xmlns="http://www.opengis.net/kml/2.2" xmlns:gx="http://www.google.com/kml/ext/2.2" xmlns:kml="http://www.opengis.net/kml/2.2" xmlns:atom="http://www.w3.org/2005/Atom">
<Document>
 <name>balloon.kml</name>
 <Style id="purple_paddle">
   <BalloonStyle>
     <text>\$[description]</text>
     <bgColor>fffcfcfc</bgColor>
   </BalloonStyle>
 </Style>
 <Placemark>
   <name>Home town</name>
   <Snippet maxLines="0"></Snippet>
   <description><![CDATA[<
   <h1>Sidharth Mudgil</h1>
   <h2>Rohtak, Haryana, India</h2>
]]></description>
   <styleUrl>#purple_paddle</styleUrl>
   <gx:balloonVisibility>1</gx:balloonVisibility>
   <Point>
     <coordinates>76.6084,28.8958,0</coordinates>
   </Point>
 </Placemark>
</Document>
</kml>
''';
}