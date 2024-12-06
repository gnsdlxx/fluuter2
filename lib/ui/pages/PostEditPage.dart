import 'package:flutter/material.dart';

class PostEditPage extends StatelessWidget {
  final String profileImagePath;
  final String name;
  final String gender;
  final int age;
  final String personality;
  final bool vaccinated;

  PostEditPage({
    Key? key,
    required this.profileImagePath,
    required this.name,
    required this.gender,
    required this.age,
    required this.personality,
    required this.vaccinated,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController(text: name);
    final genderController = TextEditingController(text: gender);
    final ageController = TextEditingController(text: age.toString());
    final personalityController = TextEditingController(text: personality);
    bool isVaccinated = vaccinated;

    return Scaffold(
      appBar: AppBar(
        title: const Text('게시글 수정'),
        backgroundColor: Colors.green,
        actions: [
          TextButton(
            onPressed: () {
              // 저장 버튼 클릭 시 처리
              String updatedName = nameController.text;
              String updatedGender = genderController.text;
              int updatedAge = int.tryParse(ageController.text) ?? age;
              String updatedPersonality = personalityController.text;

              // 수정한 데이터 확인
              print("수정된 이름: $updatedName");
              print("수정된 성별: $updatedGender");
              print("수정된 나이: $updatedAge");
              print("수정된 성격: $updatedPersonality");
              print("예방접종 여부: $isVaccinated");

              // 이전 페이지로 돌아가기
              Navigator.pop(context, {
                'name': updatedName,
                'gender': updatedGender,
                'age': updatedAge,
                'personality': updatedPersonality,
                'vaccinated': isVaccinated,
              });

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('수정 사항이 저장되었습니다.')),
              );
            },
            child: const Text(
              '저장',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(profileImagePath),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              '이름',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: '이름을 입력하세요',
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              '성별',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: genderController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: '성별을 입력하세요',
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              '나이',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: '나이를 입력하세요',
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              '성격',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: personalityController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: '성격을 입력하세요',
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text(
                  '예방접종 여부',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 8),
                Switch(
                  value: isVaccinated,
                  onChanged: (value) {
                    isVaccinated = value;
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
