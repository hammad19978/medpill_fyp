import 'package:flutter/material.dart';
import 'package:medpill_fyp/colorCode/colors.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Policy'),
      ),
      body: Container(
        color: Color(ColorCodes.bg),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 30),
              alignment: Alignment.topCenter,
              child: Text(
                'Privacy Policy',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            Container(
              padding: EdgeInsets.all(30),
              child: Text(
                'Cognates Non-cognates electricidad F bolsa F energía F medioambiente M polución F luz M gasolina F agua F bicicleta F ducha F aire M basura F cartón F embalaje M plástico M baño M aluminio M gasoil M papel M cartón M atmósfera F reciclaje M transporte M autobús M coche M Mi familia es pequeña. Mi mamá se llama Ana. Ella es enfermera. Mi mamá es muy amable e inteligente. Tengo dos hermanos. Mi hermano se llama Alan. Él es muy alegre. Es alto. Yo soy bajo. Mi hermana es bonita. Mi papá es muy trabajador. Mis abuelos son divertidos y nos quieren mucho. Somos una familia feliz.',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
