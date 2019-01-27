class CreatedocEntity {
	num public;
	String title;
	String body;
	String slug;

	CreatedocEntity({this.public, this.title, this.body, this.slug});

	CreatedocEntity.fromJson(Map<String, dynamic> json) {
		public = json['public'];
		title = json['title'];
		body = json['body'];
		slug = json['slug'];
	}

	String toJson() {
		return '{"title":"$title",' + '"public":' + this.public.toString()  + ',"body":"$body"}';
	}
}
