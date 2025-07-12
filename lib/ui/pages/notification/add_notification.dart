import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uaizu_app/domain/entity/notification.dart' as app_notification;
import 'package:uaizu_app/generated/l10n/app_localizations.dart';
import 'package:uaizu_app/state/notifications.dart';
import 'package:uaizu_app/ui/res/fonts.dart';

class AddNotificationPage extends ConsumerStatefulWidget {
  const AddNotificationPage({super.key});

  @override
  ConsumerState<AddNotificationPage> createState() =>
      _AddNotificationPageState();
}

class _AddNotificationPageState extends ConsumerState<AddNotificationPage> {
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  DateTime _selectedDateTime = DateTime.now().add(const Duration(hours: 1));

  @override
  void dispose() {
    _titleController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.primary,
        title: Text(
          l10n.addNotificationTitle,
          style: Fonts.titleM.copyWith(color: colorScheme.onPrimaryFixed),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: colorScheme.onPrimaryFixed),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          TextButton(
            onPressed: _saveNotification,
            child: Text(
              l10n.save,
              style: TextStyle(color: colorScheme.onPrimaryFixed),
            ),
          ),
        ],
      ),
      backgroundColor: colorScheme.surface,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.titleLabel,
                        style: Fonts.labelM.copyWith(
                          color: colorScheme.onSurfaceVariant,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _titleController,
                        decoration: InputDecoration(
                          hintText: l10n.titlePlaceholder,
                          border: const OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return l10n.titleRequired;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      Text(
                        l10n.contentLabel,
                        style: Fonts.labelM.copyWith(
                          color: colorScheme.onSurfaceVariant,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _bodyController,
                        decoration: InputDecoration(
                          hintText: l10n.contentPlaceholder,
                          border: const OutlineInputBorder(),
                        ),
                        maxLines: 3,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return l10n.bodyRequired;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      Text(
                        l10n.notificationTimeLabel,
                        style: Fonts.labelM.copyWith(
                          color: colorScheme.onSurfaceVariant,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Card(
                        elevation: 1,
                        child: ListTile(
                          leading: Icon(
                            Icons.schedule,
                            color: colorScheme.primary,
                          ),
                          title: Text(
                            _formatDateTime(_selectedDateTime),
                            style: Fonts.bodyM
                                .copyWith(color: colorScheme.onSurface),
                          ),
                          trailing: Icon(
                            Icons.edit,
                            color: colorScheme.onSurfaceVariant,
                          ),
                          onTap: _selectDateTime,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectDateTime() async {
    final result = await showBoardDateTimePicker(
      context: context,
      pickerType: DateTimePickerType.datetime,
      initialDate: _selectedDateTime,
      minimumDate: DateTime.now(),
      maximumDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (result != null) {
      setState(() {
        _selectedDateTime = result;
      });
    }
  }

  Future<void> _saveNotification() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final notification = app_notification.Notification(
      title: _titleController.text.trim(),
      body: _bodyController.text.trim(),
      payload: 'notification_id:${DateTime.now().millisecondsSinceEpoch}',
      scheduledDate: _selectedDateTime,
      sourceHash: DateTime.now().millisecondsSinceEpoch,
    );

    try {
      await ref.read(notificationManagerProvider.notifier).add(notification);
      if (mounted) {
        final l10n = AppLocalizations.of(context)!;
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.notificationAdded)),
        );
      }
    } on Exception catch (e) {
      if (mounted) {
        final l10n = AppLocalizations.of(context)!;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.errorOccurred2(e.toString()))),
        );
      }
    }
  }

  String _formatDateTime(DateTime dateTime) {
    return '${dateTime.year}/${dateTime.month.toString().padLeft(2, '0')}/${dateTime.day.toString().padLeft(2, '0')} ${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }
}
