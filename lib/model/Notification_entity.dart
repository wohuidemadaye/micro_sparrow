class NotificationEntity {
	Data data;

	NotificationEntity({this.data});

	NotificationEntity.fromJson(Map<String, dynamic> json) {
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
	num normalcount;
	String listType;
	List<Notifications> notifications;

	Data({this.normalcount, this.listType, this.notifications});

	Data.fromJson(Map<String, dynamic> json) {
		normalcount = json['normalCount'];
		listType = json['list_type'];
		if (json['notifications'] != null) {
			notifications = new List<Notifications>();
			json['notifications'].forEach((v) { notifications.add(new Notifications.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['normalCount'] = this.normalcount;
		data['list_type'] = this.listType;
		if (this.notifications != null) {
      data['notifications'] = this.notifications.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class Notifications {
	String params;
	num id;
	num spaceId;
	String notifyType;
	num userId;
	num actorId;
	String subjectType;
	num subjectId;
	String secondSubjectType;
	num secondSubjectId;
	String createdAt;
	String updatedAt;
	Actor actor;
	SecondSubject secondSubject;

	Notifications({this.params, this.id, this.spaceId, this.notifyType, this.userId, this.actorId, this.subjectType, this.subjectId, this.secondSubjectType, this.secondSubjectId, this.createdAt, this.updatedAt, this.actor, this.secondSubject});

	Notifications.fromJson(Map<String, dynamic> json) {
		params = json['params'];
		id = json['id'];
		spaceId = json['space_id'];
		notifyType = json['notify_type'];
		userId = json['user_id'];
		actorId = json['actor_id'];
		subjectType = json['subject_type'];
		subjectId = json['subject_id'];
		secondSubjectType = json['second_subject_type'];
		secondSubjectId = json['second_subject_id'];
		createdAt = json['created_at'];
		updatedAt = json['updated_at'];
		actor = json['actor'] != null ? new Actor.fromJson(json['actor']) : null;
		secondSubject = json['second_subject'] != null ? new SecondSubject.fromJson(json['second_subject']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['params'] = this.params;
		data['id'] = this.id;
		data['space_id'] = this.spaceId;
		data['notify_type'] = this.notifyType;
		data['user_id'] = this.userId;
		data['actor_id'] = this.actorId;
		data['subject_type'] = this.subjectType;
		data['subject_id'] = this.subjectId;
		data['second_subject_type'] = this.secondSubjectType;
		data['second_subject_id'] = this.secondSubjectId;
		data['created_at'] = this.createdAt;
		data['updated_at'] = this.updatedAt;
		if (this.actor != null) {
      data['actor'] = this.actor.toJson();
    }
		if (this.secondSubject != null) {
      data['second_subject'] = this.secondSubject.toJson();
    }
		return data;
	}
}

class Actor {
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
	num ownerId;
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

	Actor({this.workId, this.avatarUrl, this.smallAvatarUrl, this.mediumAvatarUrl, this.largeAvatarUrl, this.isactive, this.isdeactived, this.isextcontact, this.id, this.spaceId, this.type, this.login, this.name, this.description, this.avatar, this.ownerId, this.topicsCount, this.publicTopicsCount, this.membersCount, this.booksCount, this.publicBooksCount, this.followersCount, this.followingCount, this.accountId, this.role, this.status, this.public, this.wantsEmail, this.wantsMarketingEmail, this.topicUpdatedAtMs, this.deletedSlug, this.language, this.createdAt, this.updatedAt, this.deletedAt});

	Actor.fromJson(Map<String, dynamic> json) {
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


class User {
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
	String topicsCount;
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

	User({this.workId, this.avatarUrl, this.smallAvatarUrl, this.mediumAvatarUrl, this.largeAvatarUrl, this.isactive, this.isdeactived, this.isextcontact, this.id, this.spaceId, this.type, this.login, this.name, this.description, this.avatar, this.ownerId, this.topicsCount, this.publicTopicsCount, this.membersCount, this.booksCount, this.publicBooksCount, this.followersCount, this.followingCount, this.accountId, this.role, this.status, this.public, this.wantsEmail, this.wantsMarketingEmail, this.topicUpdatedAtMs, this.deletedSlug, this.language, this.createdAt, this.updatedAt, this.deletedAt});

	User.fromJson(Map<String, dynamic> json) {
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
class SecondSubject {
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
	num ownerId;
	num topicsCount;
	num publicTopicsCount;
	num membersCount;
	num booksCount;
	num publicBooksCount;
	num followersCount;
	num followingCount;
	String accountId;
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

	SecondSubject({this.workId, this.avatarUrl, this.smallAvatarUrl, this.mediumAvatarUrl, this.largeAvatarUrl, this.isactive, this.isdeactived, this.isextcontact, this.id, this.spaceId, this.type, this.login, this.name, this.description, this.avatar, this.ownerId, this.topicsCount, this.publicTopicsCount, this.membersCount, this.booksCount, this.publicBooksCount, this.followersCount, this.followingCount, this.accountId, this.role, this.status, this.public, this.wantsEmail, this.wantsMarketingEmail, this.topicUpdatedAtMs, this.deletedSlug, this.language, this.createdAt, this.updatedAt, this.deletedAt});

	SecondSubject.fromJson(Map<String, dynamic> json) {
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
