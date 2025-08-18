import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/models/vocation.dart';
import 'package:flutter_rpg/screens/create/vocation_card.dart';
import 'package:flutter_rpg/screens/home/home.dart';
import 'package:flutter_rpg/services/character_store.dart';
import 'package:flutter_rpg/shared/styled_button.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/shared/styled_text_field.dart';
import 'package:flutter_rpg/theme.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final _nameController = TextEditingController();
  final _sloganController = TextEditingController();

  @override
  void dispose() {
    // clean up the controller when the widget is disposed
    _nameController.dispose();
    _sloganController.dispose();
    super.dispose();
  }

  // handling vocation selection
  Vocation selectedVocation = Vocation.junkie;

  void updateVocation(Vocation vocation) {
    setState(() {
      selectedVocation = vocation;
    });
  }

  // submit handler
  void handleSubmit() {
    if (_nameController.text.trim().isEmpty) {
      // show error in dialog
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const StyledHeading('Missing Character Name'),
          content: const StyledText(
            'Every good RPG character needs a great name...',
          ),
          actions: [
            StyledButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const StyledHeading('Close'),
            ),
          ],
          actionsAlignment: MainAxisAlignment.center,
        ),
      );
      return;
    }
    if (_sloganController.text.trim().isEmpty) {
      // show error in dialog
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const StyledHeading('Missing Character Slogan'),
          content: const StyledText('Remember to add a catchy saying...'),
          actions: [
            StyledButton(
              onPressed: () => Navigator.pop(context),
              child: const StyledHeading('Close'),
            ),
          ],
          actionsAlignment: MainAxisAlignment.center,
        ),
      );
      return;
    }
    // create character and add to store
    Provider.of<CharacterStore>(context, listen: false).addCharacter(
      Character(
        selectedVocation,
        id: uuid.v4(),
        name: _nameController.text.trim(),
        slogan: _sloganController.text.trim(),
      ),
    );

    Navigator.of(context).push(MaterialPageRoute(builder: (_) => Home()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const StyledTitle('Character Creation')),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // welcome message
              Center(child: Icon(Icons.code, color: AppColors.primaryColor)),
              const Center(child: StyledHeading('Welcome, new player.')),
              const Center(
                child: StyledText('Create a name & slogan for your character.'),
              ),

              const SizedBox(height: 30),

              // input for name & slogan
              StyledTextfield(
                controller: _nameController,
                label: 'Character name',
                icon: Icons.person_2,
              ),
              const SizedBox(height: 10),
              StyledTextfield(
                controller: _sloganController,
                label: 'Character slogan',
                icon: Icons.chat,
              ),

              const SizedBox(height: 30),

              // select vocation title
              Center(child: Icon(Icons.code, color: AppColors.primaryColor)),
              const Center(child: StyledHeading('Choose a Vocation.')),
              const Center(
                child: StyledText('This determines your available skills.'),
              ),

              const SizedBox(height: 30),

              // vocation cards
              VocationCard(
                Vocation.junkie,
                onTap: updateVocation,
                selected: selectedVocation == Vocation.junkie,
              ),
              VocationCard(
                Vocation.ninja,
                onTap: updateVocation,
                selected: selectedVocation == Vocation.ninja,
              ),
              VocationCard(
                Vocation.wizard,
                onTap: updateVocation,
                selected: selectedVocation == Vocation.wizard,
              ),
              VocationCard(
                Vocation.raider,
                onTap: updateVocation,
                selected: selectedVocation == Vocation.raider,
              ),

              // good luck message
              Center(child: Icon(Icons.code, color: AppColors.primaryColor)),
              const Center(child: StyledHeading('Good Luck.')),
              const Center(child: StyledText('And enjoy the journey ahead...')),

              const SizedBox(height: 20),

              // submit button
              Center(
                child: StyledButton(
                  onPressed: handleSubmit,
                  child: const StyledHeading('Create Character'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
