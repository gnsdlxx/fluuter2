import 'package:flutter/material.dart';
import 'package:exam1/ui/pages/MyprofileSetting_page.dart'; // ProfileEdit import
import 'package:exam1/ui/pages/login_page.dart';
import 'package:exam1/ui/pages/PostEditPage.dart'; //여기 import 할 때 파일 이름이랑 경로 확인 잘 해야 함


class Profile extends StatelessWidget {
  final String? token;

  const Profile({Key? key, this.token}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('마이페이지', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);// 페이지 이동 로직 제거, 왜? 일단 넣어 둠
          },
        ),
        actions: [ //여기도 로그아웃 기능 구현
          TextButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
                (route) => false, // 이전 라우트를 모두 제거
              );
            },
            child: const Text(
              '로그아웃',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage:
                      AssetImage('assets/profile_image.png'), // 프로필 이미지 경로
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '나성이 반려인 WELCOME!',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    GestureDetector(
                      onTap: () {
                        // "MY 계정관리"를 눌렀을 때 ProfileEdit 페이지로 이동
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileEdit()),
                        );
                      },
                      child: Text(
                        '나성이   MY 계정관리',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'WE PET',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            const SizedBox(height: 10),
             Container(    // ---------------------------------------일단 게시글 1
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/logo.png'), // 펫 이미지 경로
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            '레오',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            onPressed: () {
                              // PostEditPage로 프로필 정보 전달
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PostEditPage(
                                    profileImagePath: 'assets/images/logo.png',  // 이미지 경로
                                    name: '레오',  // 이름
                                    gender: '여아',  // 성별
                                    age: 4,  // 나이
                                    personality: '온순한데 물 수도 있어요 아응',  // 성격
                                    vaccinated: false,  // 예방접종 여부
                                  ),
                                ),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("게시글 수정으로 이동")),
                              );
                            },
                            icon: const Icon(Icons.edit, size: 16),
                          ),
                        ],
                      ),
                      const Text('성별   여아'),
                      const Text('나이   4'),
                      const Text('성격   온순한데 물 수도 있어요 아응'),
                      const Text('예방접종 여부   X'),
                    ],
                  ),
                ],
              ),
            ),

             Container( //----------------------------------------------게시글2
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/logo.png'), // 펫 이미지 경로
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            '메테오',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            onPressed: () {
                              // PostEditPage로 프로필 정보 전달
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PostEditPage(
                                    profileImagePath: 'assets/images/logo.png',  // 이미지 경로
                                    name: '메테오',  // 이름
                                    gender: '남아',  // 성별
                                    age: 5,  // 나이
                                    personality: '난폭',  // 성격
                                    vaccinated: true,  // 예방접종 여부
                                  ),
                                ),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("게시글 수정으로 이동")),
                              );
                            },
                            icon: const Icon(Icons.edit, size: 16),
                          ),
                        ],
                      ),
                      const Text('성별   남아'),
                      const Text('나이   5'),
                      const Text('성격   난폭'),
                      const Text('예방접종 여부   O'),
                    ],
                  ),
                ],
              ),
            ),

             Container(  //---------------------------------------------게시글3
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/logo.png'), // 펫 이미지 경로
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            '오레오',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            onPressed: () {
                              // PostEditPage로 프로필 정보 전달
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PostEditPage(
                                    profileImagePath: 'assets/images/logo.png',  // 이미지 경로
                                    name: '오레오',  // 이름
                                    gender: '남아',  // 성별
                                    age: 6,  // 나이
                                    personality: '오레오 맛있음',  // 성격
                                    vaccinated: false,  // 예방접종 여부
                                  ),
                                ),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("게시글 수정으로 이동")),
                              );
                            },
                            icon: const Icon(Icons.edit, size: 16),
                          ),
                        ],
                      ),
                      const Text('성별   남아'),
                      const Text('나이   6'),
                      const Text('성격   오레오 맛있음'),
                      const Text('예방접종 여부   X'),
                    ],
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
