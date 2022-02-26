class ring {
  final String profileuser;
  final String img;
  final String content;
  final String userpost;
  final List<Comments> comments;

  ring({
    required this.profileuser,
    required this.img,
    required this.content,
    required this.userpost,
    required this.comments,
  });
}

class Comments{
  final String user;
  final String comment;
  Comments({
    required this.user,
    required this.comment,
  });
}
