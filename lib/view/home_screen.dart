import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_provider/data/response/status.dart';
import 'package:mvvm_provider/model/movie_model.dart';
import 'package:mvvm_provider/utilities/routes/routes_name.dart';
import 'package:mvvm_provider/utilities/utils.dart';
import 'package:mvvm_provider/view_model/home_view_model.dart';
import 'package:mvvm_provider/view_model/user_view_moddel.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}



class _HomeScreenState extends State<HomeScreen> {

  HomeViewViewModel homeViewViewModel = HomeViewViewModel();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeViewViewModel.fetchMoviesList();
  }

  @override
  Widget build(BuildContext context) {
    final userPreference = Provider.of<UserViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          InkWell(
            onTap: (){
              userPreference.remove2Session().then((value) {

                Navigator.pushNamed(context, RoutesName.loginScreen);

              });

            },
            child: Center(child: Text("LogOut",)),
          ),
          SizedBox(width: 20,)
        ],
      ),

      body: ChangeNotifierProvider<HomeViewViewModel>(
        create: (BuildContext context) => homeViewViewModel,
        child: Consumer<HomeViewViewModel>(
          builder: (context, value, child) {
            switch(value.movieList.status){
              case Status.LOADING:
                return  Center(child: const CircularProgressIndicator(color: Colors.black,));

                case Status.ERROR:
                return  Center(child: Text(value.movieList.message.toString()));

                case Status.COMPLETE:
                return  ListView.builder(
                    itemCount: value.movieList.data!.movies!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          leading: Image.network(value.movieList.data!.movies![index].posterUrl.toString(),
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(Icons.error,color: Colors.redAccent,);
                          },
                            height: 40,
                            width: 40,
                            fit: BoxFit.cover,

                          ),

                          title: Text(value.movieList.data!.movies![index].title.toString()),
                          subtitle: Text(value.movieList.data!.movies![index].year.toString()),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("4.5"),
                             // Text(Utils.averageRating(value.movieList.data!.movies![index].rating!).toStringAsFixed(1)),
                              Icon(Icons.star, color: Colors.yellow,)

                            ],
                          ),
                        )

                      );

                    });

            }

            return Container();

          }),
        )
    );
  }
}
