class BookResponseEntity {
	Data data;

	BookResponseEntity({this.data});

	BookResponseEntity.fromJson(Map<String, dynamic> json) {
		data = json['data'] != null ? new Data.fromJson(json['data']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.data != null) {
      data['data'] = this.data.toJson();
    }
		return data;
	}
}

class Data {
	num id;
	String slug;
	String title;
	num bookId;
	num userId;
	String format;
	String body;
	String bodyDraft;
	num public;
	num status;
	num likesCount;
	num commentsCount;
	String contentUpdatedAt;
	String deletedAt;
	String createdAt;
	String updatedAt;
	String publishedAt;
	String firstPublishedAt;
	double wordCount;
	String cover;
	String description;
	String customDescription;
	String creator;
	String book;
	String sSerializer;

	Data({this.id, this.slug, this.title, this.bookId, this.userId, this.format, this.body, this.bodyDraft, this.public, this.status, this.likesCount, this.commentsCount, this.contentUpdatedAt, this.deletedAt, this.createdAt, this.updatedAt, this.publishedAt, this.firstPublishedAt, this.wordCount, this.cover, this.description, this.customDescription, this.creator, this.book, this.sSerializer});

	Data.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		slug = json['slug'];
		title = json['title'];
		bookId = json['book_id'];
		userId = json['user_id'];
		format = json['format'];
		body = json['body'];
		bodyDraft = json['body_draft'];
		public = json['public'];
		status = json['status'];
		likesCount = json['likes_count'];
		commentsCount = json['comments_count'];
		contentUpdatedAt = json['content_updated_at'];
		deletedAt = json['deleted_at'];
		createdAt = json['created_at'];
		updatedAt = json['updated_at'];
		publishedAt = json['published_at'];
		firstPublishedAt = json['first_published_at'];
		wordCount = json['word_count'];
		cover = json['cover'];
		description = json['description'];
		customDescription = json['custom_description'];
		creator = json['creator'];
		book = json['book'];
		sSerializer = json['_serializer'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['slug'] = this.slug;
		data['title'] = this.title;
		data['book_id'] = this.bookId;
		data['user_id'] = this.userId;
		data['format'] = this.format;
		data['body'] = this.body;
		data['body_draft'] = this.bodyDraft;
		data['public'] = this.public;
		data['status'] = this.status;
		data['likes_count'] = this.likesCount;
		data['comments_count'] = this.commentsCount;
		data['content_updated_at'] = this.contentUpdatedAt;
		data['deleted_at'] = this.deletedAt;
		data['created_at'] = this.createdAt;
		data['updated_at'] = this.updatedAt;
		data['published_at'] = this.publishedAt;
		data['first_published_at'] = this.firstPublishedAt;
		data['word_count'] = this.wordCount;
		data['cover'] = this.cover;
		data['description'] = this.description;
		data['custom_description'] = this.customDescription;
		data['creator'] = this.creator;
		data['book'] = this.book;
		data['_serializer'] = this.sSerializer;
		return data;
	}
}
