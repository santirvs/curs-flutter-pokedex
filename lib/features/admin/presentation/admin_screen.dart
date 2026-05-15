import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../../../widgets/cards/pokemon_card.dart';
import '../domain/pokemon_model.dart';
import 'admin_screen_controller.dart';

@RoutePage()
class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  final _controller = AdminScreenController();
  final _imagePicker = ImagePicker();
  final _formKey = GlobalKey<FormState>();

  final _formData = <String, String>{};
  PokemonType? _selectedType;
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
    final XFile? file;
    try {
      file = await _imagePicker.pickImage(source: source);
    } on PlatformException catch (e) {
      if (!mounted) return;
      final message = switch (e.code) {
        'camera_access_denied' =>
          'S’ha denegat l’accés a la càmera. Pots activar-lo als ajustos de l’app.',
        'photo_access_denied' =>
          'S’ha denegat l’accés a la fototeca. Pots activar-lo als ajustos de l’app.',
        _ => 'No s’ha pogut obrir la imatge (${e.code}).',
      };
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(message)));
      return;
    }
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

  void _resetForm() {
    _formKey.currentState?.reset();
    setState(() {
      _selectedType = null;
      _pickedImage = null;
      _pickedImageBytes = null;
      _imageError = null;
    });
  }

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

  Widget _buildStatField({
    required String key,
    required String label,
    required String? Function(String?) validator,
  }) {
    return TextFormField(
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
        labelText: label,
        hintText: '1 - 255',
        border: const OutlineInputBorder(),
      ),
      validator: validator,
      onSaved: (value) => _formData[key] = value ?? '',
    );
  }

  static const _wideBreakpoint = 720.0;

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
              TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                  labelText: 'ID',
                  hintText: 'Ex. 25',
                  border: OutlineInputBorder(),
                ),
                validator: _controller.validateId,
                onSaved: (value) => _formData['id'] = value ?? '',
              ),
              const SizedBox(height: 12),
              TextFormField(
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                  labelText: 'Nom',
                  hintText: 'Ex. Pikachu',
                  border: OutlineInputBorder(),
                ),
                validator: _controller.validateName,
                onSaved: (value) => _formData['name'] = value ?? '',
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<PokemonType>(
                initialValue: _selectedType,
                decoration: const InputDecoration(
                  labelText: 'Tipus',
                  border: OutlineInputBorder(),
                ),
                hint: const Text('Selecciona un tipus'),
                items: [
                  for (final t in PokemonType.values)
                    DropdownMenuItem(value: t, child: Text(t.label)),
                ],
                onChanged: (value) => setState(() => _selectedType = value),
                validator: _controller.validateType,
              ),
              const SizedBox(height: 12),
              _buildStatField(
                key: 'hp',
                label: 'Vida',
                validator: _controller.validateHp,
              ),
              const SizedBox(height: 12),
              _buildStatField(
                key: 'attack',
                label: 'Atac',
                validator: _controller.validateAttack,
              ),
              const SizedBox(height: 12),
              _buildStatField(
                key: 'defense',
                label: 'Defensa',
                validator: _controller.validateDefense,
              ),
              const SizedBox(height: 16),
              Text('Imatge *', style: theme.textTheme.titleSmall),
              const SizedBox(height: 8),
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
              const SizedBox(height: 12),
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
              const SizedBox(height: 16),
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
    final pokemons = _controller.pokemons;
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final body = LayoutBuilder(
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
    );

    return body;
  }
}
