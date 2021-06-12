class Story {
  String storyTitle;
  String storyContent;

  Story({required this.storyTitle, required this.storyContent});
  //manual
  factory Story.fromJson(Map<String, dynamic> item) {
    return Story(
        storyTitle: item['storyTitle'], storyContent: item['storyContent']);
  }
}
