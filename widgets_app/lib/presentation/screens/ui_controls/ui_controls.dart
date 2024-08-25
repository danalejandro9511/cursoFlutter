import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {

  static const String name = 'ui_controls_screen';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls'),
      ),
      body: const _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView({
    super.key,
  });

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { car, bike, plane, boat }

class _UiControlsViewState extends State<_UiControlsView> {

  bool isDeveloper = true;
  Transportation selectedTransportation = Transportation.car;
  bool wantsBreakfast = false;
  bool wantsLaunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [

        SwitchListTile(
          title: const Text('Developer Mode'),
          subtitle: const Text('Activar modo desarrollador'), 
          value: isDeveloper, 
          onChanged: (value)  => setState(() { 
            isDeveloper = !isDeveloper;
          }),
        ),

        ExpansionTile(
          title: const Text('Vehiculo escogido'),
          subtitle: Text('$selectedTransportation'),
          children: [
            RadioListTile(
              title: const Text('Car'),
              subtitle: const Text('Vehiculo terrestre'),
              value: Transportation.car,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.car;
              }),
            ),
            RadioListTile(
              title: const Text('Bicicleta'),
              subtitle: const Text('Vehiculo terrestre'),
              value: Transportation.bike,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.bike;
              }),
            ),
            RadioListTile(
              title: const Text('Bote'),
              subtitle: const Text('Vehiculo marino'),
              value: Transportation.boat,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.boat;
              }),
            ),
            RadioListTile(
              title: const Text('Avion'),
              subtitle: const Text('Vehiculo aereo'),
              value: Transportation.plane,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.plane;
              }),
            ),
          ]
        ),

        ExpansionTile(
          title: const Text('Comida'),
          subtitle: const Text('Que deseas comer?'),
          children: [
            CheckboxListTile(
              title: const Text('Desayuno'),
              subtitle: const Text('Quieres desayunar?'),
              value: wantsBreakfast, 
              onChanged: (value) => setState(() {
                wantsBreakfast = !wantsBreakfast;
              }),
            ),
            CheckboxListTile(
              title: const Text('Almuerzo'),
              subtitle: const Text('Quieres almorzar?'),
              value: wantsLaunch, 
              onChanged: (value) => setState(() {
                wantsLaunch = !wantsLaunch;
              }),
            ),
            CheckboxListTile(
              title: const Text('Cena'),
              subtitle: const Text('Quieres cenar?'),
              value: wantsDinner, 
              onChanged: (value) => setState(() {
                wantsDinner = !wantsDinner;
              }),
            ),
          ]
        ),
        
        
      ],
    );
  }
}