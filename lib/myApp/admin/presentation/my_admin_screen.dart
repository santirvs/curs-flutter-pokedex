import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../../widgets/utils/utils.dart';
import '../../widgets/cards/troop_card.dart';

import 'my_admin_screen_controller.dart';
import '../domain/troop_model.dart';

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
  TroopType? _selectedType;
  XFile? _pickedImage;
  Uint8List? _pickedImageBytes;
  String? _imageError;

  @override
  void initState() {
    super.initState();
    _loadPokemons();
  }

  Future<void> _loadPokemons() async {
    await _controller.loadTroops();
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

  // Guardar el personatge
  Future<void> _onSave() async {
    final form = _formKey.currentState!;
    final formValid = form.validate();
    final imageError = _controller.validateImage(_pickedImage != null);

    setState(() => _imageError = imageError);

    if (!formValid || imageError != null) return;

    form.save();

    final troop = _controller.createTroop(
      id: _formData['id']!,
      name: _formData['name']!,
      type: _selectedType!,
      level: _formData['level']!,
      life: _formData['life']!,
      damage: _formData['damage']!,
      range: _formData['range']!,
      imageBytes: _pickedImageBytes!,
      mimeType: _pickedImage!.mimeType,
    );

    await _controller.addTroop(troop);
    if (!mounted) return;
    setState(() {});
    showCustomDialog(context, 'Tropa guardada', 'La tropa ${troop.name} s\'ha guardat correctament');
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


 

  //Widged que mostra el dropdown de tipus
  Widget _buildDropdownMenuTipus() {
    return DropdownMenu<TroopType>(
      // Para que ocupe todo el ancho disponible como un FormField
      expandedInsets: EdgeInsets.zero,
      initialSelection: _selectedType,
      label: const Text('Tipus'),
      hintText: 'Selecciona un tipus',
      dropdownMenuEntries: TroopType.values.map((t) {
        return DropdownMenuEntry<TroopType>(value: t, label: t.label);
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
        Text('Nova Tropa', style: theme.textTheme.titleLarge),
        const SizedBox(height: 12),
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // *** ID ***
              buildField(
                key: FieldsInForm.id.key,
                label: FieldsInForm.id.label,
                hint: _controller.getHintId(),
                validator: _controller.validateId,
                formData: _formData,
                numericOnly: true
              ),
              buildSpacer(),
              // *** NOM ***
              buildField(
                key: FieldsInForm.name.key,
                label: FieldsInForm.name.label,
                hint: _controller.getHintName(),
                validator: _controller.validateName,
                formData: _formData
              ),
              buildSpacer(),
              // *** TIPUS ***
              _buildDropdownMenuTipus(),
              buildSpacer(),

              // *** NIVELL ***
              buildField(
                key: FieldsInForm.level.key,
                label: FieldsInForm.level.label,
                hint: _controller.getHintLevel(),
                validator: _controller.validateLevel,   
                formData: _formData,     
                numericOnly: true
              ),
              buildSpacer(),

              // *** VIDA ***
              buildField(
                key: FieldsInForm.life.key,
                label: FieldsInForm.life.label,
                hint: _controller.getHintLife(),
                validator: _controller.validateLife,   
                formData: _formData,     
                numericOnly: true
              ),
              buildSpacer(),

              // *** ATAC ***
              buildField(
                key: FieldsInForm.damage.key,
                label: FieldsInForm.damage.label,
                hint: _controller.getHintDamage(),
                validator: _controller.validateDamage,   
                formData : _formData,     
                numericOnly: true
              ),
              buildSpacer(),

              // *** RANGE ***
              buildField(
                key: FieldsInForm.range.key,
                label: FieldsInForm.range.label,
                hint: _controller.getHintRange(),
                validator: _controller.validateRange,      
                formData: _formData,  
                numericOnly: true
              ),
              buildSpacer(),

              // *** BOTONS D'IMATGE ***
              Text(FieldsInForm.image.label, style: theme.textTheme.titleSmall),
              buildSpacer(space: 8),
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
              buildSpacer(),

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
              buildSpacer(),

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

  Widget _buildTroopList(ThemeData theme) {
    final troops = _controller.tropes;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Tropes creades (${troops.length})',
          style: theme.textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        if (troops.isEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Text(
              'Encara no hi ha cap tropa guardada.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          )
        else
        for (final tropa in troops) TroopCard(troop: tropa),
      ],
    );
  }

  //Dibuixa la pantalla
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Tropes creades')),
      body: LayoutBuilder(
        builder: (context, constraints) {

          //Fa un doble disseny en funció de si está apaisat (isWide=true) o no
          final isWide = constraints.maxWidth >= _wideBreakpoint;

          if (isWide) {
            // **** DISSENY LANDSCAPE ****
            //Una fila amb _buildForm i a la dreta _buildList 
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
                    children: [_buildTroopList(theme)],
                  ),
                ),
              ],
            );
          }

          // **** DISSENY PORTRAIT ****
          //Una ListView amb _buildForm i a sota _buildList 
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              _buildForm(theme),
              const SizedBox(height: 24),
              _buildTroopList(theme),
            ],
          );
        },
      ),
    );
  }
}
