import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  
  static const String name = 'buttons_sreen';

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen'),
      ),
      body: _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon( Icons.arrow_back_ios_new_rounded ),
        onPressed: () {
            context.pop();
        },
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 10,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: const Text('Elevated Button')),
            
            const ElevatedButton(onPressed: null, child: Text('Elevated Button')),
            
            ElevatedButton.icon(
              onPressed: (){}, 
              icon: const Icon( Icons.access_alarm_rounded ),
              label: const Text('Elevated icon')
            ),

            FilledButton( onPressed: (){}, child: const Text('Filled')),
            FilledButton.icon(
              onPressed: (){},
              icon: const Icon( Icons.accessibility_new ),
              label: const Text(' Filled Button '),
            ),

            OutlinedButton(onPressed: (){}, child: const Text('Outline')),
            OutlinedButton.icon(
              onPressed: (){},
              label:const Text('Outline Icon'),
              icon: const Icon( Icons.add_a_photo_sharp )  
            ),

            TextButton(onPressed: (){}, child: const Text('Text Button')),
            TextButton.icon(
              onPressed: (){}, 
              label:const Text('Text Button Icon') ,
              icon: const Icon( Icons.add_chart_outlined )
            ),

            const CustomButton(),

            IconButton(onPressed: (){}, icon: const Icon( Icons.abc_rounded )),
            IconButton(
              onPressed: (){}, 
              icon: const Icon( Icons.app_blocking_rounded ),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(colors.primary),
                iconColor: const WidgetStatePropertyAll(Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: (){},
          child: const Padding(
            padding:  EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text('Hola Mundo', style: TextStyle(color: Colors.white))
          ),
        ),
      ),
    );
  }
}