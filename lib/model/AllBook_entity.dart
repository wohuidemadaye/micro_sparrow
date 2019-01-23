class AllbookEntity {
	List<Data> data;

	AllbookEntity({this.data});

	AllbookEntity.fromJson(Map<String, dynamic> json) {
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
	User user;
	String sSerializer;

	Data({this.id, this.type, this.slug, this.name, this.userId, this.description, this.itemsCount, this.likesCount, this.watchesCount, this.creatorId, this.public, this.createdAt, this.updatedAt, this.contentUpdatedAt, this.pinnedAt, this.archivedAt, this.user, this.sSerializer});

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
