import 'package:flutter/material.dart';
import 'package:hw10/ring.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'เกมถูกบอกต่อด้วย',
      theme: ThemeData(
        primarySwatch: Colors.brown,


        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      home: elder(),
    );
  }
}

class elder extends StatelessWidget {
  elder({Key? key}) : super(key: key);

  final List<ring> ringList = [
    ring(profileuser: 'assets/เกมถูก01.jpg', img: 'assets/Rating.jpg',
        userpost: 'เกมถูกบอกด้วย v.2',
        comments: [
          Comments(user: 'Thomson', comment: "อีกสองคะแนนจะได้ที่หนึ่งร่วมกับรุ่นพี่ Zelda เเล้ว"),
          Comments(user: 'Washiravit', comment: 'แม่เจ้าโว้ยยยยย คะแนนเหรอเนี่ย กะจะรอตอนลดราคา สงสัย รอไม่ไหวแล้ว เหมือน RE8 ซื้อตอนราคาเต็ม ยังคุ้มเลย')],
        content: "ในตอนนี้คะแนนรอบสื่อของ Elden Ring ก็ออกมาแล้วนะครัช ดังที่เห็นในภาพเลย เรียกได้ว่าคะแนนท่วมท้นสุดๆ\n"),
    ring(profileuser: 'assets/เกมถูก01.jpg', img: 'assets/War01.jpg',
        userpost: 'เกมถูกบอกด้วย v.2',
        comments: [
          Comments(user: 'Dolpraphob', comment: "เกมดี ๆ ที่สะท้อนความจริงที่โหดร้ายของสงครามได้ชัดเจนที่สุด ไม่ว่าใครจะชนะ ผู้พ่ายแพ้คือประชาชน"),
          Comments(user: 'ธนกร', comment: 'ช่วยทุกทางครับตอนนี้ มีตรงไหนบริจาคได้น่าเชื่อถือก็บริจาคสิบยี่สิบบาท อาหารมื้อนึงให้เด็กคนนึงก็ยังดี')],
        content: "ผู้สร้าง This War of Mine ประกาศ ยกผลกำไรจากการขายเกม ส่งไปช่วยเหลือยูเครนที่กำลังถูกรัสเซียโจมตีอยู่ในตอนนี้ \n"),
    ring(profileuser: 'assets/เกมถูก01.jpg', img: 'assets/elder02.jpg',
        userpost: 'เกมถูกบอกด้วย v.2',
        comments: [
          Comments(user: 'Sutipong', comment: "Performance ตอนนี้แบบว่า...ขนาดสเปคคอมพิวเตอร์ตัวเองผ่านขั้นแนะนำแล้วเฟรมยังกระตุกสงสัยคงต้องรออัพเดท"),
          Comments(user: 'Sathit', comment: 'i5 gen8 + 1070ti น่าจะไหวไหมครับ')],
        content: "Elden Ring ทำยอดผู้เล่นพร้อมกันบน Steam ได้แล้ว 764,835 คน หลังเปิดให้เล่นเพียง 6 ชั่วโมงเท่านั้น \n"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade50,
      appBar: AppBar(title: Text('เกมถูกบอกต่อด้วย',style: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,fontSize: 25.0,))),
      body: ListView.builder(
          itemCount: ringList.length,
          itemBuilder: (context, index) => MyCard(r : ringList[index])),
    );
  }
}

class MyCard extends StatefulWidget {
  final ring r;
  const MyCard({Key? key, required this.r}) : super(key: key);
  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  final controller = TextEditingController();
  var like = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      margin: EdgeInsets.all(12.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 23,
                  backgroundImage: AssetImage('${widget.r.profileuser}'),
                ),
                SizedBox(width: 5.0,),
                Expanded(child: Text('${widget.r.userpost}')),
                IconButton(onPressed: () {}, icon: Icon(Icons.more_vert),)
              ],
            ),
          ),
          Image.asset('${widget.r.img}',fit: BoxFit.cover,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(child: Text('${widget.r.content}'))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0,left: 16.0,right: 16.0),
            child: Column(
              children: [
                for(int i=0;i<widget.r.comments.length;i++)
                  Row(
                    children: [
                      SizedBox(height: 23.0,),
                      Text('${widget.r.comments[i].user}',style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple,fontSize: 15.0,),),
                      SizedBox(width: 5.0,),
                      Text('${widget.r.comments[i].comment}')
                    ],
                  )
              ],
            ),
          ),
          Row(
            children: [
              IconButton(onPressed: (){
                setState(() {
                  like = !like;
                });
              }, icon: like? Icon(Icons.favorite,color: Colors.red,): Icon(Icons.favorite_border),),
              Expanded(
                child: TextField(
                  onSubmitted: (value){
                    setState(() {
                      widget.r.comments.add(Comments(user: 'User', comment: value));
                      controller.clear();
                    });
                  },
                  controller: controller,
                  decoration: const InputDecoration(
                    hintText: 'Add a comment',
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

