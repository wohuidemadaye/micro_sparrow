class RealbookEntity {
	Data data;
	Meta meta;

	RealbookEntity({this.data, this.meta});

	RealbookEntity.fromJson(Map<String, dynamic> json) {
		data = json['data'] != null ? new Data.fromJson(json['data']) : null;
		meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.data != null) {
      data['data'] = this.data.toJson();
    }
		if (this.meta != null) {
      data['meta'] = this.meta.toJson();
    }
		return data;
	}
}

class Data {
	num id;
	num spaceId;
	String type;
	String title;
	String titleDraft;
	String tag;
	String slug;
	num userId;
	num bookId;
	String cover;
	String description;
	String customDescription;
	String bodyAsl;
	String format;
	num status;
	num public;
	num draftVersion;
	num commentsCount;
	num likesCount;
	String contentUpdatedAt;
	String createdAt;
	String updatedAt;
	String publishedAt;
	String firstPublishedAt;
	num wordCount;
	String content;
	dynamic share;
	String sSerializer;

	Data({this.id, this.spaceId, this.type, this.title, this.titleDraft, this.tag, this.slug, this.userId, this.bookId, this.cover, this.description, this.customDescription, this.bodyAsl, this.format, this.status, this.public, this.draftVersion, this.commentsCount, this.likesCount, this.contentUpdatedAt, this.createdAt, this.updatedAt, this.publishedAt, this.firstPublishedAt, this.wordCount, this.content,  this.share, this.sSerializer});

	Data.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		spaceId = json['space_id'];
		type = json['type'];
		title = json['title'];
		titleDraft = json['title_draft'];
		tag = json['tag'];
		slug = json['slug'];
		userId = json['user_id'];
		bookId = json['book_id'];
		cover = json['cover'];
		description = json['description'];
		customDescription = json['custom_description'];
		bodyAsl = json['body_asl'];
		format = json['format'];
		status = json['status'];
		public = json['public'];
		draftVersion = json['draft_version'];
		commentsCount = json['comments_count'];
		likesCount = json['likes_count'];
		contentUpdatedAt = json['content_updated_at'];
		createdAt = json['created_at'];
		updatedAt = json['updated_at'];
		publishedAt = json['published_at'];
		firstPublishedAt = json['first_published_at'];
		wordCount = json['word_count'];
		content = json['content'];
		share = json['share'];
		sSerializer = json['_serializer'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['space_id'] = this.spaceId;
		data['type'] = this.type;
		data['title'] = this.title;
		data['title_draft'] = this.titleDraft;
		data['tag'] = this.tag;
		data['slug'] = this.slug;
		data['user_id'] = this.userId;
		data['book_id'] = this.bookId;
		data['cover'] = this.cover;
		data['description'] = this.description;
		data['custom_description'] = this.customDescription;
		data['body_asl'] = this.bodyAsl;
		data['format'] = this.format;
		data['status'] = this.status;
		data['public'] = this.public;
		data['draft_version'] = this.draftVersion;
		data['comments_count'] = this.commentsCount;
		data['likes_count'] = this.likesCount;
		data['content_updated_at'] = this.contentUpdatedAt;
		data['created_at'] = this.createdAt;
		data['updated_at'] = this.updatedAt;
		data['published_at'] = this.publishedAt;
		data['first_published_at'] = this.firstPublishedAt;
		data['word_count'] = this.wordCount;
		data['content'] = this.content;
		data['share'] = this.share;
		data['_serializer'] = this.sSerializer;
		return data;
	}
}

class Meta {
	bool marked;
	Abilities abilities;

	Meta({this.marked, this.abilities});

	Meta.fromJson(Map<String, dynamic> json) {
		marked = json['marked'];
		abilities = json['abilities'] != null ? new Abilities.fromJson(json['abilities']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['marked'] = this.marked;
		if (this.abilities != null) {
      data['abilities'] = this.abilities.toJson();
    }
		return data;
	}
}

class Abilities {
	bool read;
	bool update;
	bool destroy;
	bool export;

	Abilities({this.read, this.update, this.destroy, this.export});

	Abilities.fromJson(Map<String, dynamic> json) {
		read = json['read'];
		update = json['update'];
		destroy = json['destroy'];
		export = json['export'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['read'] = this.read;
		data['update'] = this.update;
		data['destroy'] = this.destroy;
		data['export'] = this.export;
		return data;
	}
}
