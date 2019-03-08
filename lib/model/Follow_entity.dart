class FollowEntity {
	List<Data> data;

	FollowEntity({this.data});

	FollowEntity.fromJson(Map<String, dynamic> json) {
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
	String login;
	String name;
	String description;
	String avatar;
	Profile profile;
	String avatarUrl;
	String largeAvatarUrl;
	String mediumAvatarUrl;
	String smallAvatarUrl;
	num followersCount;
	num followingCount;
	num role;
	num status;
	String createdAt;
	String updatedAt;
	String sSerializer;

	Data({this.id, this.type, this.login, this.name, this.description, this.avatar, this.profile, this.avatarUrl, this.largeAvatarUrl, this.mediumAvatarUrl, this.smallAvatarUrl, this.followersCount, this.followingCount, this.role, this.status, this.createdAt, this.updatedAt, this.sSerializer});

	Data.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		type = json['type'];
		login = json['login'];
		name = json['name'];
		description = json['description'];
		avatar = json['avatar'];
		profile = json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
		avatarUrl = json['avatar_url'];
		largeAvatarUrl = json['large_avatar_url'];
		mediumAvatarUrl = json['medium_avatar_url'];
		smallAvatarUrl = json['small_avatar_url'];
		followersCount = json['followers_count'];
		followingCount = json['following_count'];
		role = json['role'];
		status = json['status'];
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
		data['avatar'] = this.avatar;
		if (this.profile != null) {
      data['profile'] = this.profile.toJson();
    }
		data['avatar_url'] = this.avatarUrl;
		data['large_avatar_url'] = this.largeAvatarUrl;
		data['medium_avatar_url'] = this.mediumAvatarUrl;
		data['small_avatar_url'] = this.smallAvatarUrl;
		data['followers_count'] = this.followersCount;
		data['following_count'] = this.followingCount;
		data['role'] = this.role;
		data['status'] = this.status;
		data['created_at'] = this.createdAt;
		data['updated_at'] = this.updatedAt;
		data['_serializer'] = this.sSerializer;
		return data;
	}
}

class Profile {
	num id;
	num userId;
	String location;
	String jobTitle;
	String department;
	String createdAt;
	String updatedAt;
	String sSerializer;

	Profile({this.id, this.userId, this.location, this.jobTitle, this.department, this.createdAt, this.updatedAt, this.sSerializer});

	Profile.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		userId = json['user_id'];
		location = json['location'];
		jobTitle = json['job_title'];
		department = json['department'];
		createdAt = json['created_at'];
		updatedAt = json['updated_at'];
		sSerializer = json['_serializer'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['user_id'] = this.userId;
		data['location'] = this.location;
		data['job_title'] = this.jobTitle;
		data['department'] = this.department;
		data['created_at'] = this.createdAt;
		data['updated_at'] = this.updatedAt;
		data['_serializer'] = this.sSerializer;
		return data;
	}
}
