class GroupEntity {
	List<Data> data;

	GroupEntity({this.data});

	GroupEntity.fromJson(Map<String, dynamic> json) {
		if (json['data'] != null) {
			data = new List<Data>();
			json['data'].forEach((v) { data.add(new Data.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class Data {
	num id;
	String type;
	String slug;
	String name;
	num userId;
	String description;
	num itemsCount;
	num likesCount;
	num watchesCount;
	num creatorId;
	num public;
	String createdAt;
	String updatedAt;
	String contentUpdatedAt;
	String pinnedAt;
	String archivedAt;
	List<Summary> summary;
	User user;
	String sSerializer;

	Data({this.id, this.type, this.slug, this.name, this.userId, this.description, this.itemsCount, this.likesCount, this.watchesCount, this.creatorId, this.public, this.createdAt, this.updatedAt, this.contentUpdatedAt, this.pinnedAt, this.archivedAt, this.summary, this.user, this.sSerializer});

	Data.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		type = json['type'];
		slug = json['slug'];
		name = json['name'];
		userId = json['user_id'];
		description = json['description'];
		itemsCount = json['items_count'];
		likesCount = json['likes_count'];
		watchesCount = json['watches_count'];
		creatorId = json['creator_id'];
		public = json['public'];
		createdAt = json['created_at'];
		updatedAt = json['updated_at'];
		contentUpdatedAt = json['content_updated_at'];
		pinnedAt = json['pinned_at'];
		archivedAt = json['archived_at'];
		if (json['summary'] != null) {
			summary = new List<Summary>();
			json['summary'].forEach((v) { summary.add(new Summary.fromJson(v)); });
		}
		user = json['user'] != null ? new User.fromJson(json['user']) : null;
		sSerializer = json['_serializer'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['type'] = this.type;
		data['slug'] = this.slug;
		data['name'] = this.name;
		data['user_id'] = this.userId;
		data['description'] = this.description;
		data['items_count'] = this.itemsCount;
		data['likes_count'] = this.likesCount;
		data['watches_count'] = this.watchesCount;
		data['creator_id'] = this.creatorId;
		data['public'] = this.public;
		data['created_at'] = this.createdAt;
		data['updated_at'] = this.updatedAt;
		data['content_updated_at'] = this.contentUpdatedAt;
		data['pinned_at'] = this.pinnedAt;
		data['archived_at'] = this.archivedAt;
		if (this.summary != null) {
      data['summary'] = this.summary.map((v) => v.toJson()).toList();
    }
		if (this.user != null) {
      data['user'] = this.user.toJson();
    }
		data['_serializer'] = this.sSerializer;
		return data;
	}
}

class Summary {
	String contentUpdatedAt;
	String body;
	String bodyAsl;
	String bodyDraft;
	String bodyDraftAsl;
	bool issuspect;
	num id;
	num spaceId;
	String type;
	String slug;
	num bookId;
	num userId;
	String title;
	String tag;
	String cover;
	String description;
	String customDescription;
	String titleDraft;
	String format;
	num status;
	num readStatus;
	num public;
	num commentsCount;
	num likesCount;
	num lastEditorId;
	num draftVersion;
	String deletedSlug;
	num wordCount;
	String createdAt;
	String updatedAt;
	String publishedAt;
	String firstPublishedAt;
	String deletedAt;

	Summary({this.contentUpdatedAt, this.body, this.bodyAsl, this.bodyDraft, this.bodyDraftAsl, this.issuspect, this.id, this.spaceId, this.type, this.slug, this.bookId, this.userId, this.title, this.tag, this.cover, this.description, this.customDescription, this.titleDraft, this.format, this.status, this.readStatus, this.public, this.commentsCount, this.likesCount, this.lastEditorId, this.draftVersion, this.deletedSlug, this.wordCount, this.createdAt, this.updatedAt, this.publishedAt, this.firstPublishedAt, this.deletedAt});

	Summary.fromJson(Map<String, dynamic> json) {
		contentUpdatedAt = json['content_updated_at'];
		body = json['body'];
		bodyAsl = json['body_asl'];
		bodyDraft = json['body_draft'];
		bodyDraftAsl = json['body_draft_asl'];
		issuspect = json['isSuspect'];
		id = json['id'];
		spaceId = json['space_id'];
		type = json['type'];
		slug = json['slug'];
		bookId = json['book_id'];
		userId = json['user_id'];
		title = json['title'];
		tag = json['tag'];
		cover = json['cover'];
		description = json['description'];
		customDescription = json['custom_description'];
		titleDraft = json['title_draft'];
		format = json['format'];
		status = json['status'];
		readStatus = json['read_status'];
		public = json['public'];
		commentsCount = json['comments_count'];
		likesCount = json['likes_count'];
		lastEditorId = json['last_editor_id'];
		draftVersion = json['draft_version'];
		deletedSlug = json['deleted_slug'];
		wordCount = json['word_count'];
		createdAt = json['created_at'];
		updatedAt = json['updated_at'];
		publishedAt = json['published_at'];
		firstPublishedAt = json['first_published_at'];
		deletedAt = json['deleted_at'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['content_updated_at'] = this.contentUpdatedAt;
		data['body'] = this.body;
		data['body_asl'] = this.bodyAsl;
		data['body_draft'] = this.bodyDraft;
		data['body_draft_asl'] = this.bodyDraftAsl;
		data['isSuspect'] = this.issuspect;
		data['id'] = this.id;
		data['space_id'] = this.spaceId;
		data['type'] = this.type;
		data['slug'] = this.slug;
		data['book_id'] = this.bookId;
		data['user_id'] = this.userId;
		data['title'] = this.title;
		data['tag'] = this.tag;
		data['cover'] = this.cover;
		data['description'] = this.description;
		data['custom_description'] = this.customDescription;
		data['title_draft'] = this.titleDraft;
		data['format'] = this.format;
		data['status'] = this.status;
		data['read_status'] = this.readStatus;
		data['public'] = this.public;
		data['comments_count'] = this.commentsCount;
		data['likes_count'] = this.likesCount;
		data['last_editor_id'] = this.lastEditorId;
		data['draft_version'] = this.draftVersion;
		data['deleted_slug'] = this.deletedSlug;
		data['word_count'] = this.wordCount;
		data['created_at'] = this.createdAt;
		data['updated_at'] = this.updatedAt;
		data['published_at'] = this.publishedAt;
		data['first_published_at'] = this.firstPublishedAt;
		data['deleted_at'] = this.deletedAt;
		return data;
	}
}

class User {
	num id;
	String type;
	String login;
	String name;
	String description;
	String avatarUrl;
	num ownerId;
	num booksCount;
	num publicBooksCount;
	num topicsCount;
	num publicTopicsCount;
	num membersCount;
	num public;
	String createdAt;
	String updatedAt;
	String sSerializer;

	User({this.id, this.type, this.login, this.name, this.description, this.avatarUrl, this.ownerId, this.booksCount, this.publicBooksCount, this.topicsCount, this.publicTopicsCount, this.membersCount, this.public, this.createdAt, this.updatedAt, this.sSerializer});

	User.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		type = json['type'];
		login = json['login'];
		name = json['name'];
		description = json['description'];
		avatarUrl = json['avatar_url'];
		ownerId = json['owner_id'];
		booksCount = json['books_count'];
		publicBooksCount = json['public_books_count'];
		topicsCount = json['topics_count'];
		publicTopicsCount = json['public_topics_count'];
		membersCount = json['members_count'];
		public = json['public'];
		createdAt = json['created_at'];
		updatedAt = json['updated_at'];
		sSerializer = json['_serializer'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['type'] = this.type;
		data['login'] = this.login;
		data['name'] = this.name;
		data['description'] = this.description;
		data['avatar_url'] = this.avatarUrl;
		data['owner_id'] = this.ownerId;
		data['books_count'] = this.booksCount;
		data['public_books_count'] = this.publicBooksCount;
		data['topics_count'] = this.topicsCount;
		data['public_topics_count'] = this.publicTopicsCount;
		data['members_count'] = this.membersCount;
		data['public'] = this.public;
		data['created_at'] = this.createdAt;
		data['updated_at'] = this.updatedAt;
		data['_serializer'] = this.sSerializer;
		return data;
	}
}
