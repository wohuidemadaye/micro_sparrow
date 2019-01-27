class DocdetailserializerEntity {
	Data data;

	DocdetailserializerEntity({this.data});

	DocdetailserializerEntity.fromJson(Map<String, dynamic> json) {
		data = json['data'] != null ? new Data.fromJson(json['data']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.data != null) {
      data['data'] = this.data.toJson();
    }
		return data;
	}

	setData(String title,String content,int id){
		this.data = new Data(title: title,body: content,id: id);
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
	String bodyHtml;
	num public;
	num status;
	String contentUpdatedAt;
	String createdAt;
	String updatedAt;
	String publishedAt;
	num wordCount;
	String description;
	String sSerializer;

	Data({this.id, this.slug, this.title, this.bookId, this.userId, this.format, this.body, this.bodyDraft, this.bodyHtml, this.public, this.status, this.contentUpdatedAt, this.createdAt, this.updatedAt, this.publishedAt, this.wordCount, this.description, this.sSerializer});

	Data.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		slug = json['slug'];
		title = json['title'];
		bookId = json['book_id'];
		userId = json['user_id'];
		format = json['format'];
		body = json['body'];
		bodyDraft = json['body_draft'];
		bodyHtml = json['body_html'];
		public = json['public'];
		status = json['status'];
		contentUpdatedAt = json['content_updated_at'];
		createdAt = json['created_at'];
		updatedAt = json['updated_at'];
		publishedAt = json['published_at'];
		wordCount = json['word_count'];
		description = json['description'];
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
		data['body_html'] = this.bodyHtml;
		data['public'] = this.public;
		data['status'] = this.status;
		data['content_updated_at'] = this.contentUpdatedAt;
		data['created_at'] = this.createdAt;
		data['updated_at'] = this.updatedAt;
		data['published_at'] = this.publishedAt;
		data['word_count'] = this.wordCount;
		data['description'] = this.description;
		data['_serializer'] = this.sSerializer;
		return data;
	}
}
