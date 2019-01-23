class ThirddataEntity {
	List<Data> data;

	ThirddataEntity({this.data});

	ThirddataEntity.fromJson(Map<String, dynamic> json) {
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
	String targetType;
	num targetId;
	String title;
	String description;
	String cover;
	String week;
	String createdAt;
	String updatedAt;
	Target target;
	String sSerializer;

	Data({this.id, this.spaceId, this.targetType, this.targetId, this.title, this.description, this.cover, this.week, this.createdAt, this.updatedAt, this.target, this.sSerializer});

	Data.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		spaceId = json['space_id'];
		targetType = json['target_type'];
		targetId = json['target_id'];
		title = json['title'];
		description = json['description'];
		cover = json['cover'];
		week = json['week'];
		createdAt = json['created_at'];
		updatedAt = json['updated_at'];
		target = json['target'] != null ? new Target.fromJson(json['target']) : null;
		sSerializer = json['_serializer'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['space_id'] = this.spaceId;
		data['target_type'] = this.targetType;
		data['target_id'] = this.targetId;
		data['title'] = this.title;
		data['description'] = this.description;
		data['cover'] = this.cover;
		data['week'] = this.week;
		data['created_at'] = this.createdAt;
		data['updated_at'] = this.updatedAt;
		if (this.target != null) {
      data['target'] = this.target.toJson();
    }
		data['_serializer'] = this.sSerializer;
		return data;
	}
}

class Target {
	num id;
	String title;
	String slug;
	num userId;
	num bookId;
	num likesCount;
	String createdAt;
	String updatedAt;
	Book book;
	User user;
	String lastEditor;
	dynamic share;
	String sSerializer;

	Target({this.id, this.title, this.slug, this.userId, this.bookId, this.likesCount, this.createdAt, this.updatedAt, this.book, this.user, this.lastEditor, this.share, this.sSerializer});

	Target.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		title = json['title'];
		slug = json['slug'];
		userId = json['user_id'];
		bookId = json['book_id'];
		likesCount = json['likes_count'];
		createdAt = json['created_at'];
		updatedAt = json['updated_at'];
		book = json['book'] != null ? new Book.fromJson(json['book']) : null;
		user = json['user'] != null ? new User.fromJson(json['user']) : null;
		lastEditor = json['last_editor'];
		share = json['share'];
		sSerializer = json['_serializer'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['title'] = this.title;
		data['slug'] = this.slug;
		data['user_id'] = this.userId;
		data['book_id'] = this.bookId;
		data['likes_count'] = this.likesCount;
		data['created_at'] = this.createdAt;
		data['updated_at'] = this.updatedAt;
		if (this.book != null) {
      data['book'] = this.book.toJson();
    }
		if (this.user != null) {
      data['user'] = this.user.toJson();
    }
		data['last_editor'] = this.lastEditor;
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
