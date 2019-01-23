class AlldocEntity {
	List<Data> data;

	AlldocEntity({this.data});

	AlldocEntity.fromJson(Map<String, dynamic> json) {
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
	Book book;
	String user;
	LastEditor lastEditor;
	dynamic share;
	String sSerializer;

	Data({this.id, this.spaceId, this.type, this.title, this.titleDraft, this.tag, this.slug, this.userId, this.bookId, this.lastEditorId, this.cover, this.description, this.customDescription, this.format, this.status, this.readStatus, this.public, this.draftVersion, this.commentsCount, this.likesCount, this.contentUpdatedAt, this.createdAt, this.updatedAt, this.publishedAt, this.firstPublishedAt, this.wordCount, this.book, this.user, this.lastEditor, this.share, this.sSerializer});

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
		book = json['book'] != null ? new Book.fromJson(json['book']) : null;
		user = json['user'];
		lastEditor = json['last_editor'] != null ? new LastEditor.fromJson(json['last_editor']) : null;
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
		if (this.book != null) {
      data['book'] = this.book.toJson();
    }
		data['user'] = this.user;
		if (this.lastEditor != null) {
      data['last_editor'] = this.lastEditor.toJson();
    }
		data['share'] = this.share;
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
	num public;
	String createdAt;
	String updatedAt;
	String contentUpdatedAt;
	User user;
	String sSerializer;

	Book({this.id, this.type, this.slug, this.name, this.userId, this.description, this.public, this.createdAt, this.updatedAt, this.contentUpdatedAt, this.user, this.sSerializer});

	Book.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		type = json['type'];
		slug = json['slug'];
		name = json['name'];
		userId = json['user_id'];
		description = json['description'];
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

class User {
	num id;
	String type;
	String login;
	String name;
	String description;
	String avatarUrl;
	num public;
	String createdAt;
	String updatedAt;
	String sSerializer;

	User({this.id, this.type, this.login, this.name, this.description, this.avatarUrl, this.public, this.createdAt, this.updatedAt, this.sSerializer});

	User.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		type = json['type'];
		login = json['login'];
		name = json['name'];
		description = json['description'];
		avatarUrl = json['avatar_url'];
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
		data['public'] = this.public;
		data['created_at'] = this.createdAt;
		data['updated_at'] = this.updatedAt;
		data['_serializer'] = this.sSerializer;
		return data;
	}
}

class LastEditor {
	num id;
	String type;
	String login;
	String name;
	String description;
	String avatar;
	String avatarUrl;
	String largeAvatarUrl;
	String mediumAvatarUrl;
	String smallAvatarUrl;
	num followersCount;
	num followingCount;
	String createdAt;
	String updatedAt;
	String profile;
	String sSerializer;

	LastEditor({this.id, this.type, this.login, this.name, this.description, this.avatar, this.avatarUrl, this.largeAvatarUrl, this.mediumAvatarUrl, this.smallAvatarUrl, this.followersCount, this.followingCount, this.createdAt, this.updatedAt, this.profile, this.sSerializer});

	LastEditor.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		type = json['type'];
		login = json['login'];
		name = json['name'];
		description = json['description'];
		avatar = json['avatar'];
		avatarUrl = json['avatar_url'];
		largeAvatarUrl = json['large_avatar_url'];
		mediumAvatarUrl = json['medium_avatar_url'];
		smallAvatarUrl = json['small_avatar_url'];
		followersCount = json['followers_count'];
		followingCount = json['following_count'];
		createdAt = json['created_at'];
		updatedAt = json['updated_at'];
		profile = json['profile'];
		sSerializer = json['_serializer'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['type'] = this.type;
		data['login'] = this.login;
		data['name'] = this.name;
		data['description'] = this.description;
		data['avatar'] = this.avatar;
		data['avatar_url'] = this.avatarUrl;
		data['large_avatar_url'] = this.largeAvatarUrl;
		data['medium_avatar_url'] = this.mediumAvatarUrl;
		data['small_avatar_url'] = this.smallAvatarUrl;
		data['followers_count'] = this.followersCount;
		data['following_count'] = this.followingCount;
		data['created_at'] = this.createdAt;
		data['updated_at'] = this.updatedAt;
		data['profile'] = this.profile;
		data['_serializer'] = this.sSerializer;
		return data;
	}
}
