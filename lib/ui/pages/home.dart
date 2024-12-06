import 'package:flutter/material.dart';
import 'package:exam1/ui/pages/Myprofile_page.dart';

class HomePage extends StatefulWidget {
  final String token;

  const HomePage({Key? key, required this.token}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  // 샘플 게시글 데이터
  final List<Map<String, dynamic>> posts = [
    {
      "title": "BEST 게시글 1",
      "content": "BEST 게시글 내용입니다.",
      "author": "작성자1",
      "likes": 200,
      "createdAt": DateTime.now().subtract(const Duration(hours: 1)),
    },
    {
      "title": "게시글 제목 2",
      "content": "게시글 내용 2입니다.",
      "author": "익명",
      "likes": 120,
      "createdAt": DateTime.now().subtract(const Duration(hours: 3)),
    },
    {
      "title": "게시글 제목 3",
      "content": "게시글 내용 3입니다.",
      "author": "작성자2",
      "likes": 95,
      "createdAt": DateTime.now().subtract(const Duration(days: 1)),
    },
  ];

  @override
  Widget build(BuildContext context) {
    // 좋아요 순으로 게시글 정렬
    posts.sort((a, b) => b['likes'].compareTo(a['likes']));

    return Scaffold(
      appBar: _buildAppBar(),
      body: ListView(
        children: [
          _buildSearchBar(),
          const SizedBox(height: 16),
          _buildBestPostSection(),
          const SizedBox(height: 16),
          _buildGeneralPostSection(),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  // AppBar 위젯
  AppBar _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false, // 뒤로 가기 버튼 제거
      title: Image.asset(
        'assets/images/logo.png', // 로고 이미지
        height: 40,
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications),
          onPressed: () {
            // 알림 버튼 동작 추가
          },
        ),
      ],
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
    );
  }

  // 검색 바 위젯
  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: '검색',
          prefixIcon: const Icon(Icons.search),
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  // BEST 게시글 섹션 위젯
  Widget _buildBestPostSection() {
    final bestPost = posts.first; // 좋아요 수가 가장 많은 게시글

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "BEST 게시글",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PostDetailPage(post: bestPost),
                ),
              );
            },
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  bestPost['title'],
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 일반 게시글 섹션 위젯
  Widget _buildGeneralPostSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "일반 게시글",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: posts.length - 1, // BEST 게시글 제외
            itemBuilder: (context, index) {
              final post = posts[index + 1];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PostDetailPage(post: post),
                    ),
                  );
                },
                child: Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          post['title'],
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("작성자: ${post['author']}"),
                            Text(
                              "${post['createdAt'].difference(DateTime.now()).inMinutes.abs()}분 전",
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  // BottomNavigationBar 위젯
  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      currentIndex: selectedIndex,
      onTap: (index) {
        setState(() {
          selectedIndex = index;
          if (index == 4) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Profile(token: widget.token),
              ),
            );
          }
        });
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: '검색'),
        BottomNavigationBarItem(icon: Icon(Icons.location_on), label: '내주변'),
        BottomNavigationBarItem(icon: Icon(Icons.group), label: '커뮤니티'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'MY'),
      ],
    );
  }
}

// 게시글 상세 페이지 위젯
class PostDetailPage extends StatelessWidget {
  final Map<String, dynamic> post;

  const PostDetailPage({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post['title']),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post['content'],
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Icon(Icons.thumb_up, size: 16, color: Colors.grey),
                const SizedBox(width: 4),
                Text("${post['likes']} 좋아요"),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              "작성자: ${post['author']}",
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
