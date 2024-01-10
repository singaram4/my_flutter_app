import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpScreen extends StatefulWidget {
  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  final String googleFormLink =
      'https://docs.google.com/forms/d/e/1FAIpQLSfowFg78eMPP8d6vP5HQWwPO2LX5-JYP8A7UBW3w0QE9aArHQ/viewform?usp=sf_link';

  Future<void> _launchGoogleForm() async {
    if (await canLaunch(googleFormLink)) {
      await launch(googleFormLink);
    } else {
      throw 'Could not launch $googleFormLink';
    }
  }

  final List<Map<String, String>> frequentlyAskedQuestions = [
    {
      'question': 'What are common menstrual cycle irregularities?',
      'answer': 'Common menstrual cycle irregularities include missed periods, heavy or light bleeding, irregular cycle lengths, and severe menstrual cramps.',
    },
    {
      'question': 'How do I track my menstrual cycle?',
      'answer': 'You can track your menstrual cycle by noting the start and end dates of your period, changes in cervical mucus, using period tracking apps, or maintaining a menstrual calendar.',
    },
    {
      'question': 'What is the average duration of a menstrual cycle?',
      'answer': 'The average menstrual cycle is around 28 days, but it can vary from 21 to 35 days in adults. However, cycles can differ for each individual.',
    },
    {
      'question': 'What causes menstrual cramps and how to manage them?',
      'answer': 'Menstrual cramps are caused by uterine contractions. You can manage them by using over-the-counter pain relievers, applying heat, exercising, and practicing relaxation techniques.',
    },
    {
      'question': 'What are the signs and symptoms of an infection or UTI?',
      'answer': 'Symptoms of a UTI can include a strong urge to urinate, burning sensation while urinating, cloudy or bloody urine, and pelvic pain. Other infections may have symptoms like abnormal discharge, itching, or odor.',
    },
    {
      'question': 'How often should I get a gynecological check-up?',
      'answer': 'It\'s recommended to have an annual gynecological check-up for a general health assessment, Pap smear, and discussion about any concerns or changes in your health.',
    },
    {
      'question': 'What are the different types of contraceptives available?',
      'answer': 'Contraceptive options include birth control pills, intrauterine devices (IUDs), condoms, contraceptive patches, injections, vaginal rings, and implants.',
    },
    {
      'question': 'How can I manage PMS symptoms?',
      'answer': 'Managing PMS (premenstrual syndrome) involves lifestyle changes like regular exercise, healthy diet, stress reduction techniques, and sometimes medications prescribed by a healthcare provider.',
    },
    {
      'question': 'What is endometriosis, and what are its symptoms?',
      'answer': 'Endometriosis is a condition where tissue similar to the lining of the uterus grows outside the uterus. Symptoms include pelvic pain, heavy periods, painful intercourse, and fertility issues.',
    },
    {
      'question': 'What is the best way to maintain feminine hygiene?',
      'answer': 'Maintain feminine hygiene by washing the genital area with mild soap and water, wearing breathable underwear, changing pads or tampons regularly, and avoiding harsh chemicals.',
    },
    {
      'question': 'What exercises are beneficial for pelvic floor health?',
      'answer': 'Exercises like Kegels, bridges, squats, and pelvic tilts can help strengthen the pelvic floor muscles, improving bladder control and supporting reproductive organs.',
    },
    // Include your list of FAQs here
  ];

  List<Map<String, String>> filteredQuestions = [];

  @override
  void initState() {
    super.initState();
    filteredQuestions = frequentlyAskedQuestions;
  }

  void filterQuestions(String query) {
    List<Map<String, String>> searchList = [];
    searchList.addAll(frequentlyAskedQuestions);

    if (query.isNotEmpty) {
      List<Map<String, String>> filteredSearchList = [];
      searchList.forEach((question) {
        if (question['question']!.toLowerCase().contains(query.toLowerCase()) ||
            question['answer']!.toLowerCase().contains(query.toLowerCase())) {
          filteredSearchList.add(question);
        }
      });
      setState(() {
        filteredQuestions = filteredSearchList;
      });
    } else {
      setState(() {
        filteredQuestions = frequentlyAskedQuestions;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help Center'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for a question...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onChanged: (value) {
                filterQuestions(value);
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredQuestions.length,
              itemBuilder: (context, index) {
                final question = filteredQuestions[index]['question'];
                final answer = filteredQuestions[index]['answer'];

                return ListTile(
                  title: Text(question ?? ''),
                  subtitle: Text(answer ?? ''),
                  // Add onTap action for the question if needed
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _launchGoogleForm();
            },
            child: Text('Email Us'),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
