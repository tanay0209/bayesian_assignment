import 'dart:convert';
import 'package:bayesian_assignment/models/comments_model.dart';
import 'package:bayesian_assignment/utils/snackbar.dart';
import 'package:http/http.dart' as http;
import 'package:bayesian_assignment/models/list_comments_model.dart';
import 'package:bayesian_assignment/utils/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      fetchComments();
    });
  }

  ListCommentsModel listModel = ListCommentsModel();
  CommentsModel postComment = CommentsModel();
  TextEditingController textFieldController = TextEditingController();
  List postedComments = [];

  fetchComments() async {
    var result = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/photos"),
    );
    var fetchedData = jsonDecode(result.body);
    listModel = ListCommentsModel.fromJson({'data': fetchedData});
  }

  postCommentsFunction(String commentTitle) async {
    postComment = CommentsModel(
        title: commentTitle,
        thumbnailUrl:
            "https://t1.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url=http://yahoo.com&size=64",
        url:
            "https://www.yahoo.com/?guccounter=1&guce_referrer=aHR0cHM6Ly93d3cuZ29vZ2xlLmNvbS8&guce_referrer_sig=AQAAAMCVNQCi-R3nTKJjwMvwShGCF9RWPPQa8Rg3CeIGcx5fvc4MMEECsjfETB9L_8v5Zv-H7IOsXQBsExrp5ZRQsl3PQeq7mwE-df1I7wTK1ZPf7v6vT73yzhwTGMqFNGm0Ax11rBovwxISiLlfK-hX5dFUYjrG1vhcpghirJAh-Yf5");
    var response = await http.post(
      Uri.parse(
        "https://jsonplaceholder.typicode.com/posts",
      ),
      body: json.encode(
        postComment.toJson(),
      ),
      headers: {'Content-type': 'application/json'},
    );
    // print(response.body);
    setState(() {
      postedComments.add(
        json.decode(response.body),
      );
    });
  }

  final TextEditingController _searchFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        backgroundColor: const Color.fromRGBO(221, 238, 247, 1),
        bottomNavigationBar: const BottomNavigation(),
        body: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color.fromARGB(255, 224, 234, 246),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black38,
                        offset: Offset(
                          0,
                          1,
                        ),
                        spreadRadius: 2,
                        blurRadius: 2,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            "Add comments",
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 120,
                        child: const Image(
                          image: AssetImage(
                            "assets/creditCard.png",
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade300,
                      filled: true,
                      hintText: "Search",
                      hintStyle: GoogleFonts.roboto(
                        color: Colors.grey,
                        fontWeight: FontWeight.w700,
                      ),
                      prefixIcon: const Padding(
                        padding: EdgeInsets.all(20),
                        child: FaIcon(
                          FontAwesomeIcons.magnifyingGlass,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    controller: _searchFieldController,
                  ),
                ),
                postedComments.isEmpty
                    ? Container(
                        margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: TextFormField(
                          initialValue: "This is the first comment",
                          readOnly: true,
                          decoration: InputDecoration(
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(
                                12,
                              ),
                              child: InkWell(
                                onTap: () {
                                  showDialogBox(context);
                                },
                                child: const FaIcon(
                                  Icons.add,
                                ),
                              ),
                            ),
                            prefixIcon: const Padding(
                              padding: EdgeInsets.all(12.0),
                              child: CircleAvatar(
                                radius: 20,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                        ),
                      )
                    : SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: ListView.builder(
                            itemCount: postedComments.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.all(
                                  10,
                                ),
                                child: TextFormField(
                                  initialValue: postedComments[index]["title"],
                                  readOnly: true,
                                  onTap: () =>
                                      index == postedComments.length - 1
                                          ? showDialogBox(context)
                                          : () {},
                                  decoration: InputDecoration(
                                    suffixIcon: Padding(
                                      padding: const EdgeInsets.all(
                                        12,
                                      ),
                                      child: index == postedComments.length - 1
                                          ? const FaIcon(
                                              Icons.add,
                                            )
                                          : const FaIcon(
                                              Icons.check,
                                            ),
                                    ),
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.all(
                                        12.0,
                                      ),
                                      child: CircleAvatar(
                                        radius: 20,
                                        backgroundImage: NetworkImage(
                                          postedComments[index]["thumbnailUrl"],
                                        ),
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }

  showDialogBox(BuildContext context) async {
    TextEditingController textFieldController = TextEditingController();
    {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Type Below'),
              content: Material(
                elevation: 2,
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  controller: textFieldController,
                  decoration: const InputDecoration(
                    hintText: "Comment",
                    filled: true,
                    fillColor: Color.fromARGB(255, 233, 229, 229),
                  ),
                ),
              ),
              actions: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.resolveWith((states) {
                      return Colors.indigo.shade800;
                    }),
                    shape: MaterialStateProperty.resolveWith<
                        RoundedRectangleBorder>((states) {
                      return RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      );
                    }),
                  ),
                  onPressed: () {
                    postCommentsFunction(textFieldController.text);
                    showSnackBar(context, "New comment was added!");
                    Navigator.of(context).pop();
                  },
                  child: const Text("Add"),
                )
              ],
            );
          });
    }
  }
}
