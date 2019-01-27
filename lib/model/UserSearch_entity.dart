class UsersearchEntity {
	Data data;

	UsersearchEntity({this.data});

	UsersearchEntity.fromJson(Map<String, dynamic> json) {
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
	String type;
	List<Hits> hits;
	num totalhits;
	num numhits;

	Data({this.type, this.hits, this.totalhits, this.numhits});

	Data.fromJson(Map<String, dynamic> json) {
		type = json['type'];
		if (json['hits'] != null) {
			hits = new List<Hits>();
			json['hits'].forEach((v) { hits.add(new Hits.fromJson(v)); });
		}
		totalhits = json['totalHits'];
		numhits = json['numHits'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['type'] = this.type;
		if (this.hits != null) {
      data['hits'] = this.hits.map((v) => v.toJson()).toList();
    }
		data['totalHits'] = this.totalhits;
		data['numHits'] = this.numhits;
		return data;
	}
}

class Hits {
	String id;
	String type;
	String abstract;
	String bookName;
	String groupName;
	String name;
	String login;
	String description;
	String avatarUrl;
	String url;
	Record rRecord;

	Hits({this.id, this.type, this.abstract, this.bookName, this.groupName, this.name, this.login, this.description, this.avatarUrl, this.url, this.rRecord});

	Hits.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		type = json['type'];
		abstract = json['abstract'];
		bookName = json['book_name'];
		groupName = json['group_name'];
		name = json['name'];
		login = json['login'];
		description = json['description'];
		avatarUrl = json['avatar_url'];
		url = json['url'];
		rRecord = json['_record'] != null ? new Record.fromJson(json['_record']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['type'] = this.type;
		data['abstract'] = this.abstract;
		data['book_name'] = this.bookName;
		data['group_name'] = this.groupName;
		data['name'] = this.name;
		data['login'] = this.login;
		data['description'] = this.description;
		data['avatar_url'] = this.avatarUrl;
		data['url'] = this.url;
		if (this.rRecord != null) {
      data['_record'] = this.rRecord.toJson();
    }
		return data;
	}
}

class Record {
	String workId;
	String avatarUrl;
	String smallAvatarUrl;
	String mediumAvatarUrl;
	String largeAvatarUrl;
	bool isactive;
	bool isdeactived;
	bool isextcontact;
	num id;
	num spaceId;
	String type;
	String login;
	String name;
	String description;
	String avatar;
	String ownerId;
	num topicsCount;
	num publicTopicsCount;
	num membersCount;
	num booksCount;
	num publicBooksCount;
	num followersCount;
	num followingCount;
	num accountId;
	num role;
	num status;
	num public;
	bool wantsEmail;
	bool wantsMarketingEmail;
	num topicUpdatedAtMs;
	String deletedSlug;
	String language;
	String createdAt;
	String updatedAt;
	String deletedAt;

	Record({this.workId, this.avatarUrl, this.smallAvatarUrl, this.mediumAvatarUrl, this.largeAvatarUrl, this.isactive, this.isdeactived, this.isextcontact, this.id, this.spaceId, this.type, this.login, this.name, this.description, this.avatar, this.ownerId, this.topicsCount, this.publicTopicsCount, this.membersCount, this.booksCount, this.publicBooksCount, this.followersCount, this.followingCount, this.accountId, this.role, this.status, this.public, this.wantsEmail, this.wantsMarketingEmail, this.topicUpdatedAtMs, this.deletedSlug, this.language, this.createdAt, this.updatedAt, this.deletedAt});

	Record.fromJson(Map<String, dynamic> json) {
		workId = json['work_id'];
		avatarUrl = json['avatar_url'];
		smallAvatarUrl = json['small_avatar_url'];
		mediumAvatarUrl = json['medium_avatar_url'];
		largeAvatarUrl = json['large_avatar_url'];
		isactive = json['isActive'];
		isdeactived = json['isDeactived'];
		isextcontact = json['isExtcontact'];
		id = json['id'];
		spaceId = json['space_id'];
		type = json['type'];
		login = json['login'];
		name = json['name'];
		description = json['description'];
		avatar = json['avatar'];
		ownerId = json['owner_id'];
		topicsCount = json['topics_count'];
		publicTopicsCount = json['public_topics_count'];
		membersCount = json['members_count'];
		booksCount = json['books_count'];
		publicBooksCount = json['public_books_count'];
		followersCount = json['followers_count'];
		followingCount = json['following_count'];
		accountId = json['account_id'];
		role = json['role'];
		status = json['status'];
		public = json['public'];
		wantsEmail = json['wants_email'];
		wantsMarketingEmail = json['wants_marketing_email'];
		topicUpdatedAtMs = json['topic_updated_at_ms'];
		deletedSlug = json['deleted_slug'];
		language = json['language'];
		createdAt = json['created_at'];
		updatedAt = json['updated_at'];
		deletedAt = json['deleted_at'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['work_id'] = this.workId;
		data['avatar_url'] = this.avatarUrl;
		data['small_avatar_url'] = this.smallAvatarUrl;
		data['medium_avatar_url'] = this.mediumAvatarUrl;
		data['large_avatar_url'] = this.largeAvatarUrl;
		data['isActive'] = this.isactive;
		data['isDeactived'] = this.isdeactived;
		data['isExtcontact'] = this.isextcontact;
		data['id'] = this.id;
		data['space_id'] = this.spaceId;
		data['type'] = this.type;
		data['login'] = this.login;
		data['name'] = this.name;
		data['description'] = this.description;
		data['avatar'] = this.avatar;
		data['owner_id'] = this.ownerId;
		data['topics_count'] = this.topicsCount;
		data['public_topics_count'] = this.publicTopicsCount;
		data['members_count'] = this.membersCount;
		data['books_count'] = this.booksCount;
		data['public_books_count'] = this.publicBooksCount;
		data['followers_count'] = this.followersCount;
		data['following_count'] = this.followingCount;
		data['account_id'] = this.accountId;
		data['role'] = this.role;
		data['status'] = this.status;
		data['public'] = this.public;
		data['wants_email'] = this.wantsEmail;
		data['wants_marketing_email'] = this.wantsMarketingEmail;
		data['topic_updated_at_ms'] = this.topicUpdatedAtMs;
		data['deleted_slug'] = this.deletedSlug;
		data['language'] = this.language;
		data['created_at'] = this.createdAt;
		data['updated_at'] = this.updatedAt;
		data['deleted_at'] = this.deletedAt;
		return data;
	}
}
