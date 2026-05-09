import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../../widgets/cards/pokemon_card.dart';

import 'admin_screen_controller.dart';
import '../domain/troop_model.dart';  // ignore: unused_import
import '../domain/pokemon_model.dart';

class MyAdminScreen extends StatefulWidget {
  const MyAdminScreen({super.key});

  @override
  State<MyAdminScreen> createState() => _MyAdminScreenState();
}

class _MyAdminScreenState extends State<MyAdminScreen> {
  final _controller = AdminScreenController();
  final _imagePicker = ImagePicker();
  final _formKey = GlobalKey<FormState>();

  final _formData = <String, String>{};
  TroopMovementType? _selectedType;
  XFile? _pickedImage;
  Uint8List? _pickedImageBytes;
  String? _imageError;

  @override
  void initState() {
    super.initState();
    _loadPokemons();
  }

  Future<void> _loadPokemons() async {
    await _controller.loadPokemons();
    if (!mounted) return;
    setState(() {});
  }

  Future<void> _pickImage(ImageSource source) async {
    final file = await _imagePicker.pickImage(source: source);
    if (!mounted || file == null) return;

    final bytes = await file.readAsBytes();
    if (!mounted) return;

    setState(() {
      _pickedImage = file;
      _pickedImageBytes = bytes;
      _imageError = null;
    });
  }

  Future<void> _onSave() async {
    final form = _formKey.currentState!;
    final formValid = form.validate();
    final imageError = _controller.validateImage(_pickedImage != null);

    setState(() => _imageError = imageError);

    if (!formValid || imageError != null) return;

    form.save();

    final pokemon = _controller.createPokemon(
      id: _formData['id']!,
      name: _formData['name']!,
      type: _selectedType!,
      hp: _formData['hp']!,
      attack: _formData['attack']!,
      defense: _formData['defense']!,
      imageBytes: _pickedImageBytes!,
      mimeType: _pickedImage!.mimeType,
    );

    await _controller.addPokemon(pokemon);
    if (!mounted) return;
    setState(() {});
    _showSavedDialog(pokemon);
    _resetForm();
  }

  //Reset del formulari
  void _resetForm() {
    _formKey.currentState?.reset();
    setState(() {
      _selectedType = null;
      _pickedImage = null;
      _pickedImageBytes = null;
      _imageError = null;
    });
  }

  //Mostra el missatge de guardat correctament
  void _showSavedDialog(Pokemon pokemon) {
    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Pokémon guardat'),
        content: Text(
          'El Pokémon "${pokemon.name}" s\'ha guardat correctament.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('D\'acord'),
          ),
        ],
      ),
    );
  }

  //Widget que mostra un camp de text amb validació
  Widget _buildField({
    required String key,
    required String label,
    required String hint,
    required String? Function(String?) validator,
  }) {
    return TextFormField(
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        hintStyle: const TextStyle(
          color: Colors.grey, // O Colors.black38 para un gris suave
          fontSize: 14,
        ),
        border: const OutlineInputBorder(),
      ),
      validator: validator,
      onSaved: (value) => _formData[key] = value ?? '',
    );
  }

  //Widged que deixa un espai de separació entre dos camps del formulari, per defecte 12
  Widget _buildSpacerBetweenFields( {double space = 12}) {
    return SizedBox(height: space);
  }

  //Widged que mostra 
  Widget _buildDropdownMenuTipus() {
    return DropdownMenu<TroopMovementType>(
      // Para que ocupe todo el ancho disponible como un FormField
      expandedInsets: EdgeInsets.zero,
      initialSelection: _selectedType,
      label: const Text('Tipus'),
      hintText: 'Selecciona un tipus',
      dropdownMenuEntries: TroopMovementType.values.map((t) {
        return DropdownMenuEntry<TroopMovementType>(value: t, label: t.label);
      }).toList(),
      onSelected: (value) => setState(() => _selectedType = value),
      // Personalización del estilo para que parezca un OutlinedBorder
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 12),
      ),
    );
  }

  //Estableix el punt d'amplada on passem de portrait a landscape
  static const _wideBreakpoint = 720.0;

  //Construcció del formulari
  Widget _buildForm(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Nou Pokémon', style: theme.textTheme.titleLarge),
        const SizedBox(height: 12),
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // *** ID ***
              _buildField(
                key: FieldsInForm.id.key,
                label: FieldsInForm.id.label,
                hint: _controller.getHintId(),
                validator: _controller.validateId,
              ),
              _buildSpacerBetweenFields(),
              // *** NOM ***
              _buildField(
                key: FieldsInForm.name.key,
                label: FieldsInForm.name.label,
                hint: _controller.getHintName(),
                validator: _controller.validateName,
              ),
              _buildSpacerBetweenFields(space:40),
              // *** TIPUS ***
              _buildDropdownMenuTipus(),
              _buildSpacerBetweenFields(space:40),

              // *** VIDA ***
              _buildField(
                key: FieldsInForm.hp.key,
                label: FieldsInForm.hp.label,
                hint: _controller.getHintHp(),
                validator: _controller.validateHp,
              ),
              _buildSpacerBetweenFields(),

              // *** ATAC ***
              _buildField(
                key: FieldsInForm.attack.key,
                label: FieldsInForm.attack.label,
                hint: _controller.getHintAttack(),
                validator: _controller.validateAttack,
              ),
              _buildSpacerBetweenFields(),

              // *** DEFENSA ***
              _buildField(
                key: FieldsInForm.defense.key,
                label: FieldsInForm.defense.label,
                hint: _controller.getHintDefense(),
                validator: _controller.validateDefense,
              ),
              _buildSpacerBetweenFields(),

              // *** BOTONS D'IMATGE ***
              Text(FieldsInForm.image.label, style: theme.textTheme.titleSmall),
              _buildSpacerBetweenFields(),
              Row(
                children: [
                  Expanded(
                    child: FilledButton.tonalIcon(
                      onPressed: () => _pickImage(ImageSource.gallery),
                      icon: const Icon(Icons.photo_library_outlined),
                      label: const Text('Galeria'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () => _pickImage(ImageSource.camera),
                      icon: const Icon(Icons.photo_camera_outlined),
                      label: const Text('Càmera'),
                    ),
                  ),
                ],
              ),
              _buildSpacerBetweenFields(),

              // *** MOSTRA LA IMATGE TRIADA ***
              AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                height: _pickedImageBytes != null ? 180 : 100,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: _imageError != null
                        ? theme.colorScheme.error
                        : theme.colorScheme.outlineVariant,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(11),
                  child: _pickedImageBytes != null
                      ? Image.memory(
                          _pickedImageBytes!,
                          fit: BoxFit.contain,
                          width: double.infinity,
                        )
                      : Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.add_photo_alternate_outlined,
                                size: 40,
                                color: _imageError != null
                                    ? theme.colorScheme.error
                                    : theme.colorScheme.outline,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Cap imatge seleccionada',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: _imageError != null
                                      ? theme.colorScheme.error
                                      : theme.colorScheme.outline,
                                ),
                              ),
                            ],
                          ),
                        ),
                ),
              ),
              if (_imageError != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 12),
                  child: Text(
                    _imageError!,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.error,
                    ),
                  ),
                ),
              _buildSpacerBetweenFields(),

              // *** BOTÓ GUARDAR ***
              FilledButton.icon(
                onPressed: _onSave,
                icon: const Icon(Icons.save),
                label: const Text('Guardar'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPokemonList(ThemeData theme) {
    final pokemons = _controller.tropa;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Pokémons guardats (${pokemons.length})',
          style: theme.textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        if (pokemons.isEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Text(
              'Encara no hi ha cap Pokémon guardat.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          )
        else
          for (final pokemon in pokemons) PokemonCard(pokemon: pokemon),
      ],
    );
  }

  //Dibuixa la pantalla
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('LA MEVA Admin')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth >= _wideBreakpoint;

          if (isWide) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(24),
                    children: [_buildForm(theme)],
                  ),
                ),
                const VerticalDivider(width: 1),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(24),
                    children: [_buildPokemonList(theme)],
                  ),
                ),
              ],
            );
          }

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              _buildForm(theme),
              const SizedBox(height: 24),
              _buildPokemonList(theme),
            ],
          );
        },
      ),
    );
  }
}
