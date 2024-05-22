
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import "package:bloc_practice/main.dart";
import "package:bloc_practice/widget_preview_wrapper.dart";

void main() async {
  runApp(_R());
}

/// ----------------------------------- Dynamic Part

class _R extends StatelessWidget {
    Widget build(BuildContext context) {
      return MaterialApp(
        home: Material(
          child: _WidgetHost(
            widgetName: 'MyHomePage',
            constructorName: '',
            params: 
                [_Param(fieldName: 'title', type: _ParamType.stringT, defaultValueBuilder: () => _ParamType.stringT.defaultValue, nullable: false)],
            builder: (context, params) => widgetPreviewWrapper(MyHomePage(
            title: params['title']
            ),),
          ),
        ),
      );
    }
}

enum _ParamType<T> {
  intT<int>(defaultValue: 0),
  doubleT<double>(defaultValue: 0.0),
  stringT<String>(defaultValue: ''),
  boolT<bool>(defaultValue: false),
  
  // TODO Code gen needs to generate type and default value
  //enumT<dynamic>(defaultValue: null, differentValues: []),
  
  // TODO later
  compositeObjectT<Map<String, dynamic>>(defaultValue: {}),
  widgetT<WidgetBuilder?>(defaultValue: null),
  unknownT<dynamic>(defaultValue: null);

  const _ParamType({
    required this.defaultValue,
    this.differentValues = const [],
  });

  final T defaultValue;
    // Only for enums
  final List<T> differentValues;
}


/// -----------------------------------

typedef _ParamWidgetBuilder = Widget Function(BuildContext context, Map<String, dynamic> params);


class _Param {
  final String fieldName;
  final _ParamType type;
  final dynamic Function() defaultValueBuilder;
  final bool nullable;

  _Param({required this.fieldName, required this.type, required this.defaultValueBuilder, required this.nullable});
}

class _WidgetHost extends StatefulWidget {
  const _WidgetHost({
    super.key,
    required this.builder,
    required this.params,
    required this.widgetName,
    required this.constructorName,
  });

  final String widgetName;
  final String constructorName;
  final _ParamWidgetBuilder builder;
  final List<_Param> params;

  @override
  State<_WidgetHost> createState() => _WidgetHostState();
}

class _WidgetHostState extends State<_WidgetHost> {
  late final Map<String, dynamic> _params = {
    for (final param in widget.params) param.fieldName: param.defaultValueBuilder(),
  };

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _PaperDotCustomPainter(),
      child: Container(
        padding: const EdgeInsets.all(32),
        child: Row(
          children: [
            Expanded(child: Center(child: widget.builder(context, _params))),
            Flexible(
              child: Align(
                alignment: Alignment.centerRight,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 300),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListView(
                      padding: const EdgeInsets.all(16),
                      children: [
                        Text(widget.widgetName + widget.constructorName,
                            style: TextStyle(
                              fontSize: 22,
                            )),
                        Divider(),
                        for (final param in widget.params)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Builder(builder: (context) {
                              final value = _params[param.fieldName];
                              void onChanged(value) {
                                setState(() {
                                  _params[param.fieldName] = value;
                                });
                              }

                              return _ParamChanger(
                                  name: param.fieldName,
                                  child: switch (param.type) {
                                  
                                    //_ParamType.enumT =>
                                      //_EnumChanger(value: value, onChanged: onChanged),
                                  
                                  
                                  
                                  
                                    _ParamType.intT =>
                                      _IntChanger(value: value, onChanged: onChanged),
                                    _ParamType.doubleT =>
                                      _DoubleChanger(value: value, onChanged: onChanged),
                                    _ParamType.stringT =>
                                      _StringChanger(value: value, onChanged: onChanged),
                                    _ParamType.boolT =>
                                      _BoolChanger(value: value, onChanged: onChanged),
                                    _ParamType.compositeObjectT =>
                                      _CompositeObjectChanger(value: value, onChanged: onChanged),
                                    _ParamType.widgetT =>
                                      _WidgetChanger(value: value, onChanged: onChanged),
                                    _ParamType.unknownT =>
                                      const Text('Unknown type. This will soon be supported.'),
                                  });
                            }),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ParamChanger extends StatelessWidget {
  const _ParamChanger({super.key, required this.name, required this.child});

  final String name;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final capitalizedName = name[0].toUpperCase() + name.substring(1);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          capitalizedName,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        child,
      ],
    );
  }
}

class _BoolChanger extends StatelessWidget {
  const _BoolChanger({super.key, required this.value, required this.onChanged});

  final bool value;
  final ValueChanged<bool?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value,
      onChanged: onChanged,
      visualDensity: VisualDensity.compact,
    );
  }
}

class _StringChanger extends StatelessWidget {
  const _StringChanger({super.key, required this.value, required this.onChanged});

  final String value;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return _MyTextField(
      initialValue: value,
      onChanged: onChanged,
    );
  }
}

class _IntChanger extends StatelessWidget {
  const _IntChanger({super.key, required this.value, required this.onChanged});

  final int value;
  final ValueChanged<int?> onChanged;

  @override
  Widget build(BuildContext context) {
    return _MyTextField(
      initialValue: value.toString(),
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      onChanged: (value) {
        int? parsed = int.tryParse(value);
        if (parsed != null) {
          onChanged(int.tryParse(value) ?? 0);
        }
      },
    );
  }
}

class _DoubleChanger extends StatelessWidget {
  const _DoubleChanger({super.key, required this.value, required this.onChanged});

  final double value;
  final ValueChanged<double?> onChanged;

  static final TextInputFormatter dartDoubleOnly =
      FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'));
  @override
  Widget build(BuildContext context) {
    return _MyTextField(
      initialValue: value.toString(),
      inputFormatters: [
        dartDoubleOnly,
      ],
      onChanged: (value) {
        double? parsed = double.tryParse(value);
        if (parsed != null) {
          onChanged(double.tryParse(value) ?? 0);
        }
      },
    );
  }
}



// TODO for later
class _CompositeObjectChanger extends StatelessWidget {
  const _CompositeObjectChanger({super.key, required this.value, required this.onChanged});

  final Map<String, dynamic> value;
  final ValueChanged<Map<String, dynamic>?> onChanged;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _WidgetTemplate {
  _WidgetTemplate({required this.name, required this.builder});

  final String name;
  final WidgetBuilder builder;
}

class _WidgetChanger extends StatelessWidget {
  const _WidgetChanger({super.key, required this.value, required this.onChanged});

  final _WidgetTemplate? value;
  final ValueChanged<_WidgetTemplate?> onChanged;

  static final _templates = <_WidgetTemplate>[
    _WidgetTemplate(name: 'Placeholder', builder: (context) => const Placeholder()),
    _WidgetTemplate(name: 'SizedBox (empty)', builder: (context) => const SizedBox()),
    _WidgetTemplate(
        name: 'Text small',
        builder: (context) => const Text('Small text', style: TextStyle(fontSize: 12))),
    _WidgetTemplate(
        name: 'Text medium',
        builder: (context) => const Text('Medium text', style: TextStyle(fontSize: 14))),
    _WidgetTemplate(
        name: 'Text large',
        builder: (context) => const Text('Large text', style: TextStyle(fontSize: 24))),
  ];

  /*
  static Widget byName(String name, BuildContext context) {
    final template = _templates.firstWhere((element) => element.name == name);
    return template.builder(context);
  }*/

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 54,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(4),
          ),
          alignment: Alignment.center,
          child: FittedBox(
            child: value != null?  value!.builder(context) :
                const Text(
                  'Click to select widget',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w200,
                  ),
                ),
          ),
        ),
        // This is a hack to design the dropdown fully custom while keeping the original dropdown functionality
        Opacity(
          opacity: 0.0,
          alwaysIncludeSemantics: true,
          child: DropdownButtonHideUnderline(
            child: Container(
              width: double.infinity,
              height: 54,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(4),
              ),
              child: DropdownButton<_WidgetTemplate>(
                value: value,
                onChanged: onChanged,
                isDense: true,
                borderRadius: BorderRadius.circular(4),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
                items: [
                  for (final template in _templates)
                    DropdownMenuItem(
                      value: template,
                      child: Text(template.name),
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _EnumChanger extends StatelessWidget {
  const _EnumChanger({
    super.key,
    required this.value,
    required this.onChanged,
    required this.values,
  });

  final dynamic value;
  final List<dynamic> values;
  final ValueChanged<dynamic> onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(4),
        ),
        child: DropdownButton(
          value: value,
          onChanged: onChanged,
          isDense: true,
          borderRadius: BorderRadius.circular(4),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
          items: [
            for (final value in values)
              DropdownMenuItem(
                value: value,
                child: Text('$value'),
              )
          ],
        ),
      ),
    );
  }
}

class _MyTextField extends StatefulWidget {
  const _MyTextField({
    super.key,
    this.inputFormatters,
    required this.onChanged,
    this.initialValue = '',
  });

  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String> onChanged;
  final String initialValue;

  @override
  State<_MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<_MyTextField> {
  
  final controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    controller.text = widget.initialValue;
  }
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: 32,
      child: IntrinsicWidth(
        child: ConstrainedBox(
          constraints: const BoxConstraints(minWidth: 80),
          child: TextField(
            controller: controller,
            decoration: const InputDecoration(
              isDense: true,
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            ),
            maxLines: null,
            style: const TextStyle(
              fontSize: 14,
            ),
            inputFormatters: widget.inputFormatters,
            onChanged: widget.onChanged,
          ),
        ),
      ),
    );
  }
}

class _PaperDotCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const spaceBetween = 10.0;
    const dotRadius = 1.0;
    final dotPaint = Paint()..color = Colors.grey[200]!;

    for (var i = 0.0; i < size.width; i += spaceBetween) {
      for (var j = 0.0; j < size.height; j += spaceBetween) {
        canvas.drawCircle(Offset(i, j), dotRadius, dotPaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
        