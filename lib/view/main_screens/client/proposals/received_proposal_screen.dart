
import 'package:flutter/material.dart';
import 'package:nexustech/view/main_screens/client/dashboard/client_dashboad.dart';
import 'package:nexustech/view/main_screens/profile/client_profile_screen.dart';
import 'package:nexustech/widgets/client_navbar.dart';
import 'package:nexustech/view/main_screens/client/projects/my_projects_screen.dart';

class ProposalsScreen extends StatefulWidget {
  const ProposalsScreen({super.key});

  @override
  State<ProposalsScreen> createState() => _ProposalsScreenState();
}

class _ProposalsScreenState extends State<ProposalsScreen> {
  String projectStatus = "Open";

  final List<Map<String, dynamic>> proposals = [
    {
      "initials": "HR",
      "name": "Hamza Raza",
      "github": "github.com/hamza-r",
      "price": "\$450",
      "description":
          "I have built two Flutter stock apps for local shops using Firebase. I can ship a working...",
      "avatarColor": const Color(0xFFE9E8FF),
      "status": "Pending",
    },
    {
      "initials": "SM",
      "name": "Sana Malik",
      "github": "github.com/sana-codes",
      "price": "\$520",
      "description":
          "Final-year CS student with a Firestore inventory project in my portfolio. I will add low-stock...",
      "avatarColor": const Color(0xFFFFEFCB),
      "status": "Pending",
    },
    {
      "initials": "OT",
      "name": "Omar Tariq",
      "github": "github.com/omar-t",
      "price": "\$400",
      "description":
          "Happy to start this week. Clean MVVM structure, a short demo each Friday, and a...",
      "avatarColor": const Color(0xFFDDF4E7),
      "status": "Pending",
    },
  ];

  int get pendingCount {
    return proposals.where((proposal) => proposal["status"] == "Pending").length;
  }

  void rejectProposal(int index) {
    setState(() {
      proposals[index]["status"] = "Rejected";
    });
  }

  void acceptProposal(int index) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text("Accept Proposal"),
          content: const Text(
            "Are you sure you want to accept this proposal? All other proposals will be rejected.",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  proposals[index]["status"] = "Accepted";

                  for (int i = 0; i < proposals.length; i++) {
                    if (i != index && proposals[i]["status"] == "Pending") {
                      proposals[i]["status"] = "Rejected";
                    }
                  }

                  projectStatus = "In Progress";
                });

                Navigator.pop(dialogContext);
              },
              child: const Text("Accept"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F6F2),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back_ios),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "Proposals",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 5),

                Row(
                  children: [
                    const Icon(
                      Icons.work_outline,
                      size: 12,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "Inventory tracker for my bakery, $pendingCount pending",
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),

                if (projectStatus == "In Progress") ...[
                  const SizedBox(height: 8),
                  const Text(
                    "Project Status: In Progress",
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],

                const SizedBox(height: 12),

                for (int i = 0; i < proposals.length; i++) ...[
                  proposalCard(
                    index: i,
                    initials: proposals[i]["initials"],
                    name: proposals[i]["name"],
                    github: proposals[i]["github"],
                    price: proposals[i]["price"],
                    description: proposals[i]["description"],
                    avatarColor: proposals[i]["avatarColor"],
                    status: proposals[i]["status"],
                  ),
                  if (i != proposals.length - 1)
                    const SizedBox(height: 12),
                ],
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: ClientNavbar(
        selectedIndex: 2,
        onItemTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const ClientHomeScreen(),
              ),
            );
          } else if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const Project_Screen(),
              ),
            );
          } else if (index == 3) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const ClientProfileScreen(),
              ),
            );
          }
        },
      ),
    );
  }

  Widget proposalCard({
    required int index,
    required String initials,
    required String name,
    required String github,
    required String price,
    required String description,
    required Color avatarColor,
    required String status,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE5E3DC)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 19,
                backgroundColor: avatarColor,
                child: Text(
                  initials,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF333333),
                  ),
                ),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 3),

                    Row(
                      children: [
                        const Icon(
                          Icons.code,
                          size: 12,
                          color: Color(0xFF4141C9),
                        ),
                        const SizedBox(width: 3),
                        Text(
                          github,
                          style: const TextStyle(
                            fontSize: 10,
                            color: Color(0xFF4141C9),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    price,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const Text(
                    "expected",
                    style: TextStyle(fontSize: 9, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 12),

          Text(
            description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 11,
              height: 1.4,
              color: Color(0xFF333333),
            ),
          ),

          const SizedBox(height: 12),

          if (status != "Pending") ...[
            Text(
              status,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: status == "Accepted" ? Colors.green : Colors.red,
              ),
            ),
            const SizedBox(height: 8),
          ],

          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 38,
                  child: OutlinedButton(
                    onPressed: status == "Pending"
                        ? () => rejectProposal(index)
                        : null,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.black,
                      side: const BorderSide(color: Color(0xFFC9C7BD)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Reject",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: SizedBox(
                  height: 38,
                  child: ElevatedButton(
                    onPressed: status == "Pending"
                        ? () => acceptProposal(index)
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3835CC),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Accept",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
