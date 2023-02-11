import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc/business_logic/notes/notes_cubit.dart';
import 'package:odc/constants/app_colors/appColors.dart';
import 'package:sizer/sizer.dart';
import '../../../constants/constants.dart';
import '../../../data/data_provider/local/sql_helperl.dart';
import '../../widgets/default_app_bar_icon_btn.dart';
import '../../widgets/default_text.dart';
import 'notes_details.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (_, state) {
        NotesCubit notesCubit = NotesCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            leading: DefaultLeadingIconBtn(),
            title: DefaultText(
                text: "Notes", color: AppColors.black, fontSize: 20.sp),
            centerTitle: true,
            backgroundColor: AppColors.white,
            elevation: 3,
          ),
          body: Padding(
            padding: EdgeInsets.all(12.sp),
            child: FutureBuilder(
              future: HelperSql.getAllRowsDB(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasData) {
                  //if there's no data in the list of notes
                  if (snapshot.data.length == 0) {
                    return Center(
                        child: DefaultText(
                      text: "There's No Data To Show",
                      fontSize: titleFont,
                      color: Colors.black,
                    ));
                  }
                  //if there's  data in the list of notes
                  else {
                    return ListView.separated(
                      itemBuilder: (_, int index) {
                        return Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),

                          //list of notes
                          child: ListTile(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (BuildContext context) {
                                return DetailsOfNoteScreen(
                                  title: snapshot.data[index].title,
                                  date: snapshot.data[index].date,
                                  description: snapshot.data[index].description,
                                );
                              }));
                            },

                            //title of note
                            title: DefaultText(
                              text: "${snapshot.data[index].title}",
                              fontSize: titleFont,
                              color: AppColors.black,
                            ),

                            //date of note
                            subtitle: DefaultText(
                              text: "${snapshot.data[index].date}",
                              fontSize: titleFont,
                              color: AppColors.black,
                            ),

                            //btn edit + btn delete
                            trailing: Wrap(
                              children: [
                                //btn edit
                                IconButton(
                                  onPressed: () {
                                    notesCubit.getOneData(
                                        context,
                                        snapshot.data[index].id,
                                        snapshot.data[index].title,
                                        snapshot.data[index].description,
                                        snapshot.data[index].date);
                                  },
                                  icon: const Icon(Icons.edit),
                                  iconSize: deleteSize,
                                  color: AppColors.primaryColor,
                                ),

                                //btn delete
                                IconButton(
                                  onPressed: () {
                                    notesCubit.delete(snapshot.data[index].id);
                                  },
                                  icon: const Icon(Icons.delete),
                                  iconSize: deleteSize,
                                  color: AppColors.primaryColor,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox();
                      },
                      itemCount: snapshot.data.length,
                    );
                  }
                }else
                {
                  return  const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColors.primaryColor,
            onPressed: () {
              Navigator.pushNamed(context, "AddNotesScreen");
              notesCubit.titleController.clear();
              notesCubit.descriptionController.clear();
            },
            child:  Icon(
              Icons.add,
              color: AppColors.white,
            ),
          ),
        );
      },
    );
  }
}
