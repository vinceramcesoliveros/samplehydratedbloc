import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/user_bloc.dart';
import 'models/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build();
  runApp(BlocProvider(create: (context) => UserBloc(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Form Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
          return Center(
            child: Column(
              children: [
                Text("Tap Save Icon",
                    style: Theme.of(context).textTheme.headline6),
                if (state is UserCompleteState)
                  Text(state.user.toString(),
                      style: TextStyle(color: Colors.green))
                else if (state is UserIncompleteState)
                  Text(
                    state.user.toString(),
                    style: TextStyle(color: Colors.red),
                  )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          );
        }),
        floatingActionButton: FloatingActionButton(
          onPressed: onSaveUser,
          tooltip: 'Save',
          child: Icon(Icons.save),
        ),
      ),
    );
  }

  void onSaveUser() {
    const address = const Address(
      streetName: "Alabama",
      city: "New York City",
      zipCode: 2490,
    );
    const user = const User(
      name: "John Wick",
      address: address,
    );
    // ignore: close_sinks
    final bloc = context.bloc<UserBloc>();
    bloc.add(SaveUserEvent(user: user));
  }
}
