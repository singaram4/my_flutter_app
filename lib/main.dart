import 'package:flutter/material.dart';
import 'package:app1/HelpScreen.dart';




void main() {
    runApp(MyApp());
  }

  class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        home: HomeScreen(),
      );
    }
  }

  // ... Your imports and other code ...

  // ... Your imports and other code ...

  class HomeScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              const Text(
                'Feminine Health',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  // Implement your search functionality here
                },
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButton('Obulama Eats', SubCategoryScreen('Obulama Eats', obulamaEatsCategories), Colors.teal),
                  CustomButton('Hedhi Help', SubCategoryScreen('HedhiHelp', hedhiHelpCategories), Colors.orange),
                  CustomButton('Senga Guide', SubCategoryScreen('SengaSafe', sengaSafeCategories), Colors.red),
                  CustomButton('Omuwala Power', SubCategoryScreen('Omuwala Power', omuwalaPowerCategories), Colors.purple),
                  CustomButton('Omwana Thrive', SubCategoryScreen('OmwanaThrive', omwanaThriveCategories), Colors.green),
                ],
              ),
              const SizedBox(height: 16),
              Image.asset(
                'assets/Womenhealth.jpeg',
                height: 450,
                width: 400,
                fit: BoxFit.contain,
              ),
              /*const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Stack(
                          children: [
                            Container(
                              color: Colors.white,
                              child: Image.asset(
                                'assets/scu.jpg',
                                height: 75,
                                width: 75,
                              ),
                            ),
                            Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                              bottom: 0,
                              child: Container(
                                color: Colors.white,
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Frugal Innovation Club',
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      'Santa Clara University',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 16),
                        Image.asset(
                          'assets/ross.jpg',
                          height: 75,
                          width: 75,
                        ),
                      ],
                    ),
                  ),
                ],
              ),*/
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HelpScreen()), // Navigate to HelpScreen
                  );
                },
                child: const Text('Need Help?'),
              ),

            ],
          ),
        ),
      );
    }
  }

  // ... Your other classes and data ...


  // ... Your other classes and data ...


  class CustomButton extends StatelessWidget {
    final String buttonText;
    final Widget destination;
    final Color color;

    const CustomButton(this.buttonText, this.destination, this.color, {super.key});

    @override
    Widget build(BuildContext context) {
      return Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Adjust the border radius as needed
        ),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => destination),
            );
          },
          style: ElevatedButton.styleFrom(
            primary: color,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // Adjust the border radius as needed
            ),
          ),
          child: Text(
            buttonText,
            style: const TextStyle(
              fontSize: 16, // Adjust the font size as needed
              fontWeight: FontWeight.bold,
              color: Colors.white, // Text color
            ),
          ),
        ),
      );
    }
  }
  class ObulamaEatsScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return SubCategoryScreen('Obulama Eats', obulamaEatsCategories);
    }
  }

 class SubCategoryScreen extends StatelessWidget {
  final String title;
  final Map<String, List<String>> categoryImageMap;

  SubCategoryScreen(this.title, this.categoryImageMap);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: categoryImageMap.keys.map((category) {
            return buildCategoryButton(context, category, categoryImageMap[category]!);
          }).toList()
            ..addAll([
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => VocabularyListScreen()),
                  );
                },
                child: const Text('Vocabulary List'),
              ),
            ]),
        ),
      ),
    );
  }

  Widget buildCategoryButton(BuildContext context, String category, List<String> images) {
    return Card(
      elevation: 4,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ImageSliderScreen(category, images),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.teal,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        ),
        child: Text(
          category,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}



  class ImageSliderScreen extends StatelessWidget {
    final String title;
    final List<String> imagePaths;

    ImageSliderScreen(this.title, this.imagePaths);

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ImageSlider(imagePaths),
      );
    }
  }

  class ImageSlider extends StatefulWidget {
    final List<String> imagePaths;

    ImageSlider(this.imagePaths);

    @override
    _ImageSliderState createState() => _ImageSliderState();
  }

  class _ImageSliderState extends State<ImageSlider> {
    final PageController _pageController = PageController(initialPage: 0);

    @override
    Widget build(BuildContext context) {
      return PageView.builder(
        controller: _pageController,
        itemCount: widget.imagePaths.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SingleImageView(widget.imagePaths[index]),
                ),
              );
            },
            child: Image.asset(
              widget.imagePaths[index],
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          );
        },
      );
    }
  }

  class SingleImageView extends StatelessWidget {
    final String imagePath;

    SingleImageView(this.imagePath);

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Center(
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain,
            ),
          ),
        ),
      );
    }
  }

  // Sample data for categories and images
  Map<String, List<String>> obulamaEatsCategories = {
    'Teens': [
      'assets/Slide 3 - Teens.png',
      'assets/Slide 4 - Teens.png',
      'assets/Slide 5 - Teens.png',
    ],
    'Adults': [
      'assets/Slide 6 - Adults.png',
      'assets/Slide 7 - Adults.png',
      'assets/Slide 8 - Adults.png',
      'assets/Slide 9 - Adults.png',
      'assets/Slide 10 - Adults.png',
      'assets/Slide 11 - Adults.png',
      'assets/Slide 12 - Adults.png',
      'assets/Slide 13 - Adults.png',
    ],
    'Pregnancy': [
      'assets/Slide 14 - Pregnancy.png',
      'assets/Slide 15 - Pregnancy.png',
      'assets/Slide 16 - Pregnancy.png',
      'assets/Slide 17 - Pregnancy.png',
      'assets/Slide 18 - Pregnancy.png',
      'assets/Slide 19 - Pregnancy.png',
      'assets/Slide 20 - Pregnancy.png',
      'assets/Slide 21 - Pregnancy.png',
    ],
    'Infants': [
      'assets/Slide 22 - Infants.png',
      'assets/Slide 23 - Infants.png',
      'assets/Slide 24 - Infants.png',
      'assets/Slide 25 - Infants.png',
      'assets/Slide 26 - Infants.png',
      'assets/Slide 27 - Infants.png',
      'assets/Slide 28 - Infants.png',
      'assets/Slide 27 - Infants.png',
      'assets/Slide 28 - Infants.png',
    ],
    'Children': [
      'assets/Slide 29 - Children.png',
      'assets/Slide 30 - Children.png',
      'assets/Slide 31 - Children.png',
      'assets/Slide 32 - Children.png',
      'assets/Slide 33 - Children.png',
    ],
    'Food Guides': [
      'assets/Slide 34 - Food Guides.png',
      'assets/Slide 35 - Food Guides_b.png',
      'assets/Slide 36 - Food Guides_b.png',
      'assets/Slide 37 - Food Guides_b.png',
      'assets/Slide 38 - Food Guides_b.png',
    ],
  };

  class VocabularyListScreen extends StatefulWidget {
    @override
    _VocabularyListScreenState createState() => _VocabularyListScreenState();
  }

  class _VocabularyListScreenState extends State<VocabularyListScreen> {
    List<Map<String, String>> vocabularyList = [
      {
        'word': 'Adolescent',
        'section': 'MCAH',
        'definition': 'A young person in the process of developing from a child into an adult.',
      },
      {
        'word': 'Amaranth',
        'section': 'Nutrition',
        'definition': 'Amaranth grain is high in protein and lysine, an amino acid found in low quantities in other grains.',
      },
      {
        'word': 'Antenatal',
        'section': 'MCAH',
        'definition': 'Before birth; prenatal; generally healthcare during pregnancy',
      },
      {
        'word': 'Anxiety',
        'section': 'General',
        'definition': 'Anxiety is a feeling of fear, dread, and uneasiness.',
      },
      {
        'word': 'Caffeine',
        'section': 'Nutrition',
        'definition': 'Caffeine is a drug that stimulates (increases the activity of) your brain and nervous system.',
      },
      {
        'word': 'Cassava',
        'section': 'Nutrition',
        'definition': 'Cassava is a root vegetable that has a good source of dietary fibre, vitamin C, thiamin, folic acid, manganese, and potassium.',
      },
      {
        'word': 'Cervical Cancer',
        'section': 'Disease',
        'definition': 'Cervical cancer develops in the cervix and is most often caused from infection from the HPV virus.',
      },
      {
        'word': 'Cervix',
        'section': 'SRHR',
        'definition': 'The cervix is a small canal that connects a woman\'s uterus to the vagina.',
      },
      {
        'word': 'Chapati',
        'section': 'Nutrition',
        'definition': 'Chapati is a traditional unleavened Indian flatbread.',
      },
      {
        'word': 'Condom',
        'section': 'SRHR',
        'definition': 'A condom is a sheath-shaped barrier device used during sexual intercourse to reduce the probability of pregnancy or a sexually transmitted infection.',
      },
      {
        'word': 'Contraception',
        'section': 'SRHR',
        'definition': 'Any method, medicine, or device used to prevent pregnancy or sexually transmitted disease.',
      },
      {
        'word': 'Cramps (menstrual)',
        'section': 'MHM',
        'definition': 'Menstrual cramps (dysmenorrhea) are throbbing or cramping pains in the lower abdomen.',
      },
      {
        'word': 'Fallopian Tube',
        'section': 'MHM',
        'definition': 'One of a pair of tubes in a female\'s abdominal cavity along which eggs travel from the ovaries to the uterus.',
      },
      {
        'word': 'Fertilization',
        'section': 'MHM',
        'definition': 'The process of combining the male sperm with the female egg, or ovum.',
      },
      {
        'word': 'Flourish',
        'section': 'Nutrition',
        'definition': 'Grow or develop in a healthy or vigorous way.',
      },
      {
        'word': 'Hedhi',
        'section': 'MHM',
        'definition': 'Swahili - term for menstruation',
      },
    ];

    List<Map<String, String>> filteredList = [];

    @override
    void initState() {
      super.initState();
      filteredList = vocabularyList;
    }

    void filterList(String query) {
      List<Map<String, String>> searchList = [];
      searchList.addAll(vocabularyList);

      if (query.isNotEmpty) {
        List<Map<String, String>> filteredSearchList = [];
        searchList.forEach((word) {
          if (word['word']!.toLowerCase().contains(query.toLowerCase()) ||
              word['section']!.toLowerCase().contains(query.toLowerCase()) ||
              word['definition']!.toLowerCase().contains(query.toLowerCase())) {
            filteredSearchList.add(word);
          }
        });
        setState(() {
          filteredList = filteredSearchList;
        });
      } else {
        setState(() {
          filteredList = vocabularyList;
        });
      }
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Vocabulary List'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onChanged: (value) {
                  filterList(value);
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredList.length,
                itemBuilder: (context, index) {
                  final word = filteredList[index]['word'];
                  final section = filteredList[index]['section'];
                  final definition = filteredList[index]['definition'];

                  return ListTile(
                    title: Text(
                      word!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Section: $section'),
                        Text('Definition: $definition'),
                      ],
                    ),
                    onTap: () {
                      // Add action on tile tap if needed
                    },
                  );
                },
              ),
            ),
          ],
        ),
      );
    }
  }


  Map<String, List<String>> hedhiHelpCategories = {
    'Lesson 1': [
    'assets/Lesson1_1.png', 
    'assets/Lesson1_2.png',
    'assets/Lesson1_3.png',
    'assets/Lesson1_4.png',
    'assets/Lesson1_5.png',
    'assets/Lesson1_6.png',
    'assets/Lesson1_7.png',
    'assets/Lesson1_8.png',
    'assets/Lesson1_9.png',
    'assets/Lesson1_10.png',
  ],
  'Lesson 2': [
    'assets/Lesson2-1.PNG',
    'assets/Lesson2_2.PNG',
    'assets/Lesson2_3.PNG',
    'assets/Lesson2_4.PNG',
    'assets/Lesson2_5.PNG',
    'assets/Lesson2_6.PNG',
    'assets/Lesson2_7.PNG',
    'assets/Lesson2_8.PNG',
    'assets/Lesson2_9.PNG',
    'assets/Lesson2_10.PNG',
    'assets/Lesson2_11.PNG',
    'assets/Lesson2_12.PNG',
  ],
  'Lesson 3': [
    'assets/Lesson3_1.png',
    'assets/Lesson3_2.png',
    'assets/Lesson3_3.png',
    'assets/Lesson3_4.png',
    'assets/Lesson3_5.png',
    'assets/Lesson3_6.png',
    'assets/Lesson3_7.png',
    'assets/Lesson3_8.png',
    'assets/Lesson3_9.png',
    'assets/Lesson3_10.png',
    'assets/Lesson3_11.png',
    'assets/Lesson3_12.png',
    'assets/Lesson3_13.png',
    'assets/Lesson3_14.png',
  ],
  'Lesson 4': [
    'assets/Lesson4_1.png',
    'assets/Lesson4_2.png',
    'assets/Lesson4_3.png',
    'assets/Lesson4_4.png',
    'assets/Lesson4_5.png',
  ],
  'Lesson 5': [
    'assets/Lesson5_1.png',
    'assets/Lesson5_2.png',
    'assets/Lesson5_3.png',
    'assets/Lesson5_4.png',
    'assets/Lesson5_5.png',
    'assets/Lesson5_6.png',
  ],
    // Add HedhiHelp categories and images here
  };

  Map<String, List<String>> sengaSafeCategories = {
    'Senga Guide 1': [
    'assets/SengaGuide/SengaModule1_1.jpg', 
    'assets/Senga Module 1_2.png',
    'assets/Senga Module 1_3.png',
    'assets/Senga Module 1_4.png',
    'assets/Senga Module 1_5.png',
    'assets/Senga Module 1_6.png',
    'assets/Senga Module 1_7.png',
    'assets/Senga Module 1_8.png',
    'assets/Senga Module 1_9.png',
    'assets/Senga Module 1_10.png',
    'assets/Senga Module 1_11.png',
    'assets/Senga Module 1_12.png',
    'assets/Senga Module 1_13.png',
  ],
  'Senga Guide 2': [
    'assets/Senga Module 2_1.png',
    'assets/Senga Module 2_2.png',
    'assets/Senga Module 2_3.png',
    'assets/Senga Module 2_4.png',
    'assets/Senga Module 2_5.png',
    'assets/Senga Module 2_6.png',
    'assets/Senga Module 2_7.png',
    'assets/Senga Module 2_8.png',
    'assets/Senga Module 2_9.png',
    'assets/Senga Module 2_10.png',
    'assets/Senga Module 2_11.png',
    'assets/Senga Module 2_12.png',
    'assets/Senga Module 2_13.png',
  ],
    
  };

  Map<String, List<String>> omuwalaPowerCategories = {
    'Module 1': [
    'assets/M1S1.png',
    'assets/M1S2.png',
    'assets/M1S3.png',
    'assets/M1S4.png',
    'assets/M1S5.png',
  ],
  'Module 2': [
    'assets/M2S1.png',
    'assets/M2S2.png',
    'assets/M2S3.png',
    'assets/M2S4.png',
    'assets/M2S5.PNG',
    'assets/M2S6.PNG',
  ],
  'Module 3': [
    'assets/M3S1.png',
    'assets/M3S2.png',
    'assets/M3S3.png',
    'assets/M3S4.png',
    'assets/M3S5.png',
  ],
    // Add Omuwala Power categories and images here
  };

  Map<String, List<String>> omwanaThriveCategories = {
    'Common Sickness Module': [
    'assets/sick_1.png',
    'assets/sick_2.png',
    'assets/sick_3.png',
    'assets/sick_4.png',
    'assets/sick_5.png',
    'assets/sick_6.png',
    'assets/sick_7.png',
  ],
  'Hygiene Module': [
    'assets/hygiene_1.png',
    'assets/hygiene_2.png',
    'assets/Hygiene_3.png',
    'assets/hygiene_4.png',
    'assets/hygiene_5.png',
    'assets/hygiene_6.png',
  ],
  'Lactation Module': [
    'assets/lactation-1.png',
    'assets/lactation-2.png',
    'assets/lactation-3.png',
    'assets/lactation-4.png',
    'assets/lactation-5.png',
    'assets/lactation-6.png',
    'assets/lactation-7.png',
  ],
  'Mama Self Care Module': [
    'assets/care_1.png',
    'assets/care_2.png',
    'assets/care_3.png',
    'assets/care_4.png',
    'assets/care_5.png',
  ],
    // Add OmwanaThrive categories and images here
  };