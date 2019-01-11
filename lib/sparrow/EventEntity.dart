class EventEntity {
	List<Data> data = [];
	Meta meta;

	EventEntity({this.data, this.meta});

	EventEntity.fromJson(Map<String, dynamic> json) {
		if (json['data'] != null) {
			data = new List<Data>();
			json['data'].forEach((v) { data.add(new Data.fromJson(v)); });
		}
		meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
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
	num userId;
	String eventType;
	String subjectType;
	num subjectId;
	String secondSubjectType;
	num secondSubjectId;
	String thirdSubjectType;
	num thirdSubjectId;
	num actorId;
	num bookId;
	String params;
	String createdAt;
	String updatedAt;
	Subject subject;
	SecondSubject secondSubject;
	ThirdSubject thirdSubject;
	Actor actor;
	Book book;
	String sSerializer;

	Data({this.id, this.spaceId, this.userId, this.eventType, this.subjectType, this.subjectId, this.secondSubjectType, this.secondSubjectId, this.thirdSubjectType, this.thirdSubjectId, this.actorId, this.bookId, this.params, this.createdAt, this.updatedAt, this.subject, this.secondSubject, this.thirdSubject, this.actor, this.book, this.sSerializer});

	Data.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		spaceId = json['space_id'];
		userId = json['user_id'];
		eventType = json['event_type'];
		subjectType = json['subject_type'];
		subjectId = json['subject_id'];
		secondSubjectType = json['second_subject_type'];
		secondSubjectId = json['second_subject_id'];
		thirdSubjectType = json['third_subject_type'];
		thirdSubjectId = json['third_subject_id'];
		actorId = json['actor_id'];
		bookId = json['book_id'];
		params = json['params'];
		createdAt = json['created_at'];
		updatedAt = json['updated_at'];
		subject = json['subject'] != null ? new Subject.fromJson(json['subject']) : null;
		secondSubject = json['second_subject'] != null ? new SecondSubject.fromJson(json['second_subject']) : null;
		thirdSubject = json['third_subject'] != null ? new ThirdSubject.fromJson(json['third_subject']) : null;
		actor = json['actor'] != null ? new Actor.fromJson(json['actor']) : null;
		book = json['book'] != null ? new Book.fromJson(json['book']) : null;
		sSerializer = json['_serializer'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['space_id'] = this.spaceId;
		data['user_id'] = this.userId;
		data['event_type'] = this.eventType;
		data['subject_type'] = this.subjectType;
		data['subject_id'] = this.subjectId;
		data['second_subject_type'] = this.secondSubjectType;
		data['second_subject_id'] = this.secondSubjectId;
		data['third_subject_type'] = this.thirdSubjectType;
		data['third_subject_id'] = this.thirdSubjectId;
		data['actor_id'] = this.actorId;
		data['book_id'] = this.bookId;
		data['params'] = this.params;
		data['created_at'] = this.createdAt;
		data['updated_at'] = this.updatedAt;
		if (this.subject != null) {
      data['subject'] = this.subject.toJson();
    }
		if (this.secondSubject != null) {
      data['second_subject'] = this.secondSubject.toJson();
    }
		if (this.thirdSubject != null) {
      data['third_subject'] = this.thirdSubject.toJson();
    }
		if (this.actor != null) {
      data['actor'] = this.actor.toJson();
    }
		if (this.book != null) {
      data['book'] = this.book.toJson();
    }
		data['_serializer'] = this.sSerializer;
		return data;
	}
}

class Subject {
	num id;
	num spaceId;
	String type;
	String title;
	String titleDraft;
	String tag;
	String slug;
	num userId;
	num bookId;
	num lastEditorId;
	String cover;
	String description;
	String customDescription;
	String format;
	num status;
	num readStatus;
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
	User user;
	String lastEditor;
	String sSerializer;

	Subject({this.id, this.spaceId, this.type, this.title, this.titleDraft, this.tag, this.slug, this.userId, this.bookId, this.lastEditorId, this.cover, this.description, this.customDescription, this.format, this.status, this.readStatus, this.public, this.draftVersion, this.commentsCount, this.likesCount, this.contentUpdatedAt, this.createdAt, this.updatedAt, this.publishedAt, this.firstPublishedAt, this.wordCount, this.user, this.lastEditor, this.sSerializer});

	Subject.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		spaceId = json['space_id'];
		type = json['type'];
		title = json['title'];
		titleDraft = json['title_draft'];
		tag = json['tag'];
		slug = json['slug'];
		userId = json['user_id'];
		bookId = json['book_id'];
		lastEditorId = json['last_editor_id'];
		cover = json['cover'];
		description = json['description'];
		customDescription = json['custom_description'];
		format = json['format'];
		status = json['status'];
		readStatus = json['read_status'];
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
		user = json['user'] != null ? new User.fromJson(json['user']) : null;
		lastEditor = json['last_editor'];
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
		data['last_editor_id'] = this.lastEditorId;
		data['cover'] = this.cover;
		data['description'] = this.description;
		data['custom_description'] = this.customDescription;
		data['format'] = this.format;
		data['status'] = this.status;
		data['read_status'] = this.readStatus;
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
		if (this.user != null) {
      data['user'] = this.user.toJson();
    }
		data['last_editor'] = this.lastEditor;
		data['_serializer'] = this.sSerializer;
		return data;
	}
}

class User {
	num id;
	String type;
	String login;
	String description;
	String name;
	String avatar;
	String avatarUrl;
	num followersCount;
	String createdAt;
	String updatedAt;
	String sSerializer;

	User({this.id, this.type, this.login, this.description, this.name, this.avatar, this.avatarUrl, this.followersCount, this.createdAt, this.updatedAt, this.sSerializer});

	User.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		type = json['type'];
		login = json['login'];
		description = json['description'];
		name = json['name'];
		avatar = json['avatar'];
		avatarUrl = json['avatar_url'];
		followersCount = json['followers_count'];
		createdAt = json['created_at'];
		updatedAt = json['updated_at'];
		sSerializer = json['_serializer'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['type'] = this.type;
		data['login'] = this.login;
		data['description'] = this.description;
		data['name'] = this.name;
		data['avatar'] = this.avatar;
		data['avatar_url'] = this.avatarUrl;
		data['followers_count'] = this.followersCount;
		data['created_at'] = this.createdAt;
		data['updated_at'] = this.updatedAt;
		data['_serializer'] = this.sSerializer;
		return data;
	}
}

class SecondSubject {
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
	User user;
	String sSerializer;

	SecondSubject({this.id, this.type, this.slug, this.name, this.userId, this.description, this.itemsCount, this.likesCount, this.watchesCount, this.creatorId, this.public, this.createdAt, this.updatedAt, this.contentUpdatedAt, this.user, this.sSerializer});

	SecondSubject.fromJson(Map<String, dynamic> json) {
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
		if (this.user != null) {
      data['user'] = this.user.toJson();
    }
		data['_serializer'] = this.sSerializer;
		return data;
	}
}

class ThirdSubject {
	num id;
	String type;
	String login;
	String description;
	String name;
	String avatar;
	String avatarUrl;
	num followersCount;
	String createdAt;
	String updatedAt;
	String sSerializer;

	ThirdSubject({this.id, this.type, this.login, this.description, this.name, this.avatar, this.avatarUrl, this.followersCount, this.createdAt, this.updatedAt, this.sSerializer});

	ThirdSubject.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		type = json['type'];
		login = json['login'];
		description = json['description'];
		name = json['name'];
		avatar = json['avatar'];
		avatarUrl = json['avatar_url'];
		followersCount = json['followers_count'];
		createdAt = json['created_at'];
		updatedAt = json['updated_at'];
		sSerializer = json['_serializer'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['type'] = this.type;
		data['login'] = this.login;
		data['description'] = this.description;
		data['name'] = this.name;
		data['avatar'] = this.avatar;
		data['avatar_url'] = this.avatarUrl;
		data['followers_count'] = this.followersCount;
		data['created_at'] = this.createdAt;
		data['updated_at'] = this.updatedAt;
		data['_serializer'] = this.sSerializer;
		return data;
	}
}

class Actor {
	num id;
	String type;
	String login;
	String description;
	String name;
	String avatar;
	String avatarUrl;
	num followersCount;
	String createdAt;
	String updatedAt;
	String sSerializer;

	Actor({this.id, this.type, this.login, this.description, this.name, this.avatar, this.avatarUrl, this.followersCount, this.createdAt, this.updatedAt, this.sSerializer});

	Actor.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		type = json['type'];
		login = json['login'];
		description = json['description'];
		name = json['name'];
		avatar = json['avatar'];
		avatarUrl = json['avatar_url'];
		followersCount = json['followers_count'];
		createdAt = json['created_at'];
		updatedAt = json['updated_at'];
		sSerializer = json['_serializer'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['type'] = this.type;
		data['login'] = this.login;
		data['description'] = this.description;
		data['name'] = this.name;
		data['avatar'] = this.avatar;
		data['avatar_url'] = this.avatarUrl;
		data['followers_count'] = this.followersCount;
		data['created_at'] = this.createdAt;
		data['updated_at'] = this.updatedAt;
		data['_serializer'] = this.sSerializer;
		return data;
	}
}

class Book {
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
	User user;
	String sSerializer;

	Book({this.id, this.type, this.slug, this.name, this.userId, this.description, this.itemsCount, this.likesCount, this.watchesCount, this.creatorId, this.public, this.createdAt, this.updatedAt, this.contentUpdatedAt, this.user, this.sSerializer});

	Book.fromJson(Map<String, dynamic> json) {
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
		if (this.user != null) {
      data['user'] = this.user.toJson();
    }
		data['_serializer'] = this.sSerializer;
		return data;
	}
}

class Meta {
	num offset;

	Meta({this.offset});

	Meta.fromJson(Map<String, dynamic> json) {
		offset = json['offset'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['offset'] = this.offset;
		return data;
	}
}
