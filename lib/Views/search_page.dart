// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:volkshandwerker/Models/Branches.dart';
import 'package:volkshandwerker/Views/company_detail_page.dart';

import '../Services/NetworkManager.dart';

/* class SearchPageArguments {
  final String search;
  final String? category;

  SearchPageArguments({required this.search, this.category});
} */

class SearchPage extends StatefulWidget {
  final String search;
  final String? category;
  final int categoryId;

  const SearchPage(
      {super.key, required this.search, this.category, required this.categoryId});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String? apiResponse;
  List<BranchModel> _branches = [];
  bool _isLoading = true;

  Future<void> _fetchBranches() async {
    print("${widget.search} ${widget.categoryId}");

    NetworkManager networkManager =
        NetworkManager('https://api.volkshandwerker.de/api');

    List<BranchModel> branches =
        await networkManager.fetchBranches(widget.search, widget.categoryId);

    setState(() {
      _branches = branches;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchBranches();
  }

  @override
  Widget build(BuildContext context) {
    // ... (diğer kodlar)
    return Scaffold(
      appBar: AppBar(
        title: const Text('Handwerker'),
        backgroundColor: const Color.fromRGBO(245, 183, 89, 1),
      ),
      body: Center(
        child: _isLoading
            ? const CircularProgressIndicator(
                color: Color.fromRGBO(245, 183, 89, 1),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: _branches.isEmpty
                        ? const Center(
                            child: Text(
                                "Es konnten keine Suchergebnisse gefunden werden."),
                          )
                        : ListView.builder(
                            itemCount: _branches.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: _buildBranch(_branches[index]),
                              );
                            },
                          ),
                  ),
                  const SizedBox(height: 20),
                  /* apiResponse != null
                ? Text(
                    'API Cevabı:\n$apiResponse',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  )
                : CircularProgressIndicator(), */
                ],
              ),
      ),
    );
  }

  // Create the Widget for the row
  Widget _buildBranch(BranchModel branch) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          children: [
            Image.network(
              branch.company?.logo?.url ?? branch.images?[0].url ?? '',
              /* fit: BoxFit.fitWidth, */
              height: 200,
              width: double.infinity,
            ),
            const SizedBox(height: 16),
            Text(
              branch.name ?? '',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '${branch.postalCode} ${branch.city}, ${branch.street} ${branch.houseNumber}',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CompanyDetailPage(
                        url: 'https://volkshandwerker.de/branch/${branch.id}'),
                  ),
                );
              },
              child: const Text(
                'PROFIL AUFRUFEN',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(255, 165, 0, 1),
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
