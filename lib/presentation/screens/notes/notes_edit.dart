import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:odc/business_logic/notes/notes_cubit.dart';
import 'package:odc/constants/app_colors/appColors.dart';
import 'package:odc/presentation/widgets/default_text.dart';
import 'package:sizer/sizer.dart';

//This Screen use for edit a note
class EditNotesScreen extends StatelessWidget {
  String title;
  int id;
  String description;

  late TextEditingController editTitle;
  late TextEditingController editDescription;

  EditNotesScreen({
    required this.description,
    required this.id,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        NotesCubit notesCubit = NotesCubit.get(context);
        return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.transparent,
              elevation: 0,
              centerTitle: true,
              title: DefaultText(
                text: "Edit",
                fontSize: 28.sp,
                color: AppColors.black,
              ),
              leading: IconButton(
                onPressed: () {
                  return Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios_rounded,
                    color: AppColors.primaryColor, size: 30.sp),
              ),
            ),
            body: Form(
              key: notesCubit.keyEditNote,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: [
                  //Title
                  SizedBox(
                    height: 2.h,
                  ),
                  Padding(
                    padding: EdgeInsets.all(18.sp),
                    child: TextFormField(
                      controller: editTitle =
                          TextEditingController(text: title),
                      maxLines: 1,
                      decoration: InputDecoration(
                        labelText: 'Title',
                        hintText: 'Enter Title',
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                          borderSide:
                              const BorderSide(color: AppColors.primaryColor),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                          borderSide:
                              const BorderSide(color: AppColors.primaryColor),
                        ),
                      ),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Please Enter Your Title';
                        } else if (val.length > 50) {
                          return "Title must be less than 50 characters";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),

                  //Description
                  Padding(
                    padding: EdgeInsets.all(18.sp),
                    child: TextFormField(
                      maxLines: 5,
                      decoration: InputDecoration(
                        labelText: 'Description',
                        hintText: 'Enter Description',
                        alignLabelWithHint: true,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                          borderSide:
                              const BorderSide(color: AppColors.primaryColor),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                          borderSide:
                              const BorderSide(color: AppColors.primaryColor),
                        ),
                      ),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Please Enter Your Description';
                        }else return "";
                      },
                      controller: editDescription =
                          TextEditingController(text: description),
                    ),
                  ),

                  //Button Edit
                  Container(
                    width: 25.w,
                    height: 5.h,
                    margin: EdgeInsets.only(top: 15.sp),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.sp)),
                          elevation: 1.sp,
                        ),
                        onPressed: () {
                          if (notesCubit.keyEditNote.currentState!.validate()) {
                            notesCubit.update(
                              context,
                              id,
                              editTitle.text == "" ? title : editTitle.text,
                              editDescription.text == ""
                                  ? description
                                  : editDescription.text,
                              DateFormat("hh:mm a      dd/MM/yyyy")
                                  .format(DateTime.now()),
                            );
                          }
                        },
                        child: DefaultText(
                          text: 'Edit',
                          fontSize: 15.sp,
                          color: AppColors.white,
                        )),
                  ),
                ],
              ),
            ));
      },
    );
  }
}
