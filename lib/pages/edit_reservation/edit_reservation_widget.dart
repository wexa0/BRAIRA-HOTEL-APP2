import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_reservation_model.dart';
export 'edit_reservation_model.dart';

class EditReservationWidget extends StatefulWidget {
  const EditReservationWidget({
    super.key,
    required this.resRef1,
    required this.booking,
    required this.bookingList,
  });

  final DocumentReference? resRef1;
  final BookingRecord? booking;
  final List<BookingRecord>? bookingList;

  @override
  State<EditReservationWidget> createState() => _EditReservationWidgetState();
}

class _EditReservationWidgetState extends State<EditReservationWidget> {
  late EditReservationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditReservationModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: 300.0,
        height: 300.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: AlignmentDirectional(-1.0, -1.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Edit Reservation',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          fontSize: 20.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 30.0,
              thickness: 1.0,
              color: FlutterFlowTheme.of(context).accent4,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  '  Edit Room Type   ',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        letterSpacing: 0.0,
                      ),
                ),
                FlutterFlowDropDown<String>(
                  controller: _model.dropDownValueController ??=
                      FormFieldController<String>(null),
                  options: [
                    'Single Room',
                    'Double Room',
                    'Twin Room',
                    'Suite Room'
                  ],
                  onChanged: (val) =>
                      setState(() => _model.dropDownValue = val),
                  width: 87.0,
                  height: 36.0,
                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        fontSize: 14.0,
                        letterSpacing: 0.0,
                      ),
                  hintText: 'select',
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 13.0,
                  ),
                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                  elevation: 2.0,
                  borderColor: FlutterFlowTheme.of(context).alternate,
                  borderWidth: 2.0,
                  borderRadius: 8.0,
                  margin: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  hidesUnderline: true,
                  isOverButton: true,
                  isSearchable: false,
                  isMultiSelect: false,
                ),
              ],
            ),
            Divider(
              height: 25.0,
              thickness: 1.0,
              color: FlutterFlowTheme.of(context).accent4,
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      '  Edit Duration',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ],
                ),
                Divider(
                  height: 10.0,
                  thickness: 1.0,
                  color: FlutterFlowTheme.of(context).accent4,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 84.0, 0.0),
                                child: Text(
                                  'Check In',
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, -0.1),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    final _datePickedDate =
                                        await showDatePicker(
                                      context: context,
                                      initialDate: getCurrentTimestamp,
                                      firstDate: getCurrentTimestamp,
                                      lastDate: DateTime(2050),
                                      builder: (context, child) {
                                        return wrapInMaterialDatePickerTheme(
                                          context,
                                          child!,
                                          headerBackgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          headerForegroundColor:
                                              FlutterFlowTheme.of(context).info,
                                          headerTextStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineLarge
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    fontSize: 32.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                          pickerBackgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          pickerForegroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          selectedDateTimeBackgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          selectedDateTimeForegroundColor:
                                              FlutterFlowTheme.of(context).info,
                                          actionButtonForegroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          iconSize: 24.0,
                                        );
                                      },
                                    );

                                    if (_datePickedDate != null) {
                                      safeSetState(() {
                                        _model.datePicked = DateTime(
                                          _datePickedDate.year,
                                          _datePickedDate.month,
                                          _datePickedDate.day,
                                        );
                                      });
                                    }
                                    _model.booking =
                                        await queryBookingRecordOnce(
                                      queryBuilder: (bookingRecord) =>
                                          bookingRecord.where(
                                        'Room',
                                        isEqualTo: widget.booking?.room,
                                      ),
                                    );
                                    setState(() {
                                      _model.startTime = _model.datePicked;
                                    });

                                    setState(() {});
                                  },
                                  child: Container(
                                    width: 139.0,
                                    height: 32.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: Color(0xFFE5E7EB),
                                      ),
                                    ),
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(-0.8, -0.1),
                                      child: Text(
                                        valueOrDefault<String>(
                                          dateTimeFormat(
                                              'd/M/y', _model.startTime),
                                          'dd/mm/yyyy',
                                        ),
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Align(
                        alignment: AlignmentDirectional(-0.1, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-0.1, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 77.0, 0.0),
                                    child: Text(
                                      'Duration',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, -0.1),
                                    child: Container(
                                      width: 141.0,
                                      height: 32.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: Color(0xFFE5E7EB),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 8.0, 0.0),
                                        child: TextFormField(
                                          controller: _model.textController,
                                          focusNode: _model.textFieldFocusNode,
                                          autofocus: true,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelSmall
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      letterSpacing: 0.0,
                                                    ),
                                            hintText: 'Duration(days)',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelSmall
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      letterSpacing: 0.0,
                                                    ),
                                            enabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            focusedErrorBorder:
                                                InputBorder.none,
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 33.0, 19.0),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                fontSize: 13.0,
                                                letterSpacing: 0.0,
                                              ),
                                          textAlign: TextAlign.center,
                                          validator: _model
                                              .textControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(
              height: 30.0,
              thickness: 1.0,
              color: FlutterFlowTheme.of(context).accent4,
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FFButtonWidget(
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                    text: 'Cancel',
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: Color(0xFF8D8B8B),
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Readex Pro',
                                color: Colors.white,
                                letterSpacing: 0.0,
                              ),
                      elevation: 3.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  StreamBuilder<List<RoomRecord>>(
                    stream: queryRoomRecord(),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      List<RoomRecord> buttonRoomRecordList = snapshot.data!;
                      return FFButtonWidget(
                        onPressed: () async {
                          await queryBookingRecordOnce(
                            queryBuilder: (bookingRecord) =>
                                bookingRecord.where(
                              'Room',
                              isEqualTo: widget.booking?.room,
                            ),
                          );
                          if (functions.checkConflictForUpdate(
                              _model.datePicked,
                              int.tryParse(_model.textController.text),
                              functions
                                  .getBookingDays(widget.bookingList!.toList())
                                  .toList(),
                              widget.resRef1?.id)!) {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('Conflict Day/s'),
                                  content: Text(functions.printMessage(functions
                                      .checkConflict(
                                          functions
                                              .getBookingDays(
                                                  widget.bookingList!.toList())
                                              .toList(),
                                          int.parse(_model.textController.text),
                                          _model.datePicked!)!
                                      .toList())!),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: Text('Ok'),
                                    ),
                                  ],
                                );
                              },
                            );
                            return;
                          }

                          await widget.booking!.reference
                              .update(createBookingRecordData(
                            checkInDate: _model.datePicked,
                            room: functions.getRoomID(_model.dropDownValue,
                                buttonRoomRecordList.toList()),
                            duration: int.tryParse(_model.textController.text),
                          ));

                          await widget.booking!.reference
                              .update(createBookingRecordData(
                            checkOutDate: functions.checkInDate(
                                _model.datePicked,
                                int.tryParse(_model.textController.text)),
                          ));
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text('Edit Successful'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: Text('Ok'),
                                  ),
                                ],
                              );
                            },
                          );

                          context.pushNamed('MyReservations');
                        },
                        text: 'Edit',
                        options: FFButtonOptions(
                          width: 100.0,
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Color(0xFF702EA7),
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 3.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
