import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class CustomImageFormField extends StatefulWidget {
  const CustomImageFormField({
    Key? key,
    required this.validator,
    required this.onChanged,
  }) : super(key: key);
  final String? Function(File?) validator;
  final Function(File) onChanged;

  @override
  State<CustomImageFormField> createState() => _CustomImageFormFieldState();
}

class _CustomImageFormFieldState extends State<CustomImageFormField> {
  late File? _pickedFile;

  @override
  Widget build(BuildContext context) {
    return FormField<File>(
        validator: widget.validator,
        builder: (formFieldState) {
          return Column(
            children: [
              GestureDetector(
                onTap: () async {
                  FilePickerResult? file = await FilePicker.platform
                      .pickFiles(type: FileType.image, allowMultiple: false);
                  if (file != null) {
                    _pickedFile = File(file.files.first.path!);
                    widget.onChanged.call(_pickedFile!);
                  }
                },
                child: Container(
                  margin: const EdgeInsets.all(8),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xff707070).withOpacity(0.1),
                  ),
                  child: Column(
                    children: const [
                      Icon(Icons.upload_file),
                      Text('Upload Image')
                    ],
                  ),
                ),
              ),
              if (formFieldState.hasError)
                Padding(
                  padding: const EdgeInsets.only(left: 8, top: 10),
                  child: Text(
                    formFieldState.errorText!,
                    style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 13,
                        color: Colors.red[700],
                        height: 0.5),
                  ),
                )
            ],
          );
        });
  }
}
