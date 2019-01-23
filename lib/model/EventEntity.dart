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
	String createdAt;
	String updatedAt;
	Subject subject;
	Actor actor;
	Book book;
	SecondSubject secondSubject;

	Data({this.id,  this.secondSubject , this.createdAt, this.updatedAt, this.subject, this.actor, this.book, });

	Data.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		createdAt = json['created_at'];
		updatedAt = json['updated_at'];
		subject = json['subject'] != null ? new Subject.fromJson(json['subject']) : null;
		actor = json['actor'] != null ? new Actor.fromJson(json['actor']) : null;
		book = json['book'] != null ? new Book.fromJson(json['book']) : null;
		secondSubject = json['second_subject'] != null ? new SecondSubject.fromJson(json['second_subject']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['created_at'] = this.createdAt;
		data['updated_at'] = this.updatedAt;
		if (this.subject != null) {
      data['subject'] = this.subject.toJson();
    }
		if (this.actor != null) {
      data['actor'] = this.actor.toJson();
    }
		if (this.book != null) {
      data['book'] = this.book.toJson();
    }
		if (this.secondSubject != null) {
			data['second_subject'] = this.secondSubject.toJson();
		}
		return data;
	}
}

class Subject {
	num id;
	String title;
	String slug;
	num userId;
	num bookId;
	String description;
	num status;
	num public;
	String createdAt;
	String updatedAt;
	String publishedAt;
	num wordCount;
	User user;

	Subject({this.id,  this.title,  this.slug, this.userId, this.bookId,  this.description,  this.status,  this.public,  this.createdAt, this.updatedAt, this.publishedAt,  this.wordCount, this.user, });

	Subject.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		title = json['title'];
		slug = json['slug'];
		userId = json['user_id'];
		bookId = json['book_id'];
		description = json['description'];
		status = json['status'];
		public = json['public'];
		createdAt = json['created_at'];
		updatedAt = json['updated_at'];
		publishedAt = json['published_at'];
		wordCount = json['word_count'];
		user = json['user'] != null ? new User.fromJson(json['user']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['title'] = this.title;
		data['slug'] = this.slug;
		data['user_id'] = this.userId;
		data['book_id'] = this.bookId;
		data['description'] = this.description;
		data['status'] = this.status;
		data['public'] = this.public;
		data['created_at'] = this.createdAt;
		data['updated_at'] = this.updatedAt;
		data['published_at'] = this.publishedAt;
		data['word_count'] = this.wordCount;
		if (this.user != null) {
      data['user'] = this.user.toJson();
    }
		return data;
	}
}

class User {
	num id;
	String type;
	String login;
	String description;
	String name;
	String avatarUrl;
	num followersCount;
	String createdAt;
	String updatedAt;

	User({this.id, this.type, this.login, this.description, this.name, this.avatarUrl, this.followersCount, this.createdAt, this.updatedAt});

	User.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		type = json['type'];
		login = json['login'];
		description = json['description'];
		name = json['name'];
		avatarUrl = json['avatar_url'];
		followersCount = json['followers_count'];
		createdAt = json['created_at'];
		updatedAt = json['updated_at'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['type'] = this.type;
		data['login'] = this.login;
		data['description'] = this.description;
		data['name'] = this.name;
		data['avatar_url'] = this.avatarUrl;
		data['followers_count'] = this.followersCount;
		data['created_at'] = this.createdAt;
		data['updated_at'] = this.updatedAt;
		return data;
	}
}

class SecondSubject {
	num id;
	String type;
	String slug;

	SecondSubject({this.id, this.type, this.slug});

	SecondSubject.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		type = json['type'];
		slug = json['slug'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['type'] = this.type;
		data['slug'] = this.slug;
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
	User user;

	Book({this.id, this.type, this.slug, this.name, this.userId, this.description,this.user});

	Book.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		type = json['type'];
		slug = json['slug'];
		name = json['name'];
		userId = json['user_id'];
		description = json['description'];
		user = json['user'] != null ? new User.fromJson(json['user']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['type'] = this.type;
		data['slug'] = this.slug;
		data['name'] = this.name;
		data['user_id'] = this.userId;
		data['description'] = this.description;
		if (this.user != null) {
      data['user'] = this.user.toJson();
    }
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
