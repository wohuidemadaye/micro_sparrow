class FollowUserResponse {
	Data data;

	FollowUserResponse({this.data});

	FollowUserResponse.fromJson(Map<String, dynamic> json) {
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
	num id;
	num userId;
	String actionType;
	String actionName;
	String targetType;
	num targetId;
	String actionOption;
	String title;
	dynamic targetBookId;
	dynamic targetGroupId;
	String createdAt;
	String updatedAt;
	String targetGroup;
	String targetBook;
	String sUrl;
	String sSerializer;

	Data({this.id, this.userId, this.actionType, this.actionName, this.targetType, this.targetId, this.actionOption, this.title, this.targetBookId, this.targetGroupId, this.createdAt, this.updatedAt, this.targetGroup, this.targetBook, this.sUrl, this.sSerializer});

	Data.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		userId = json['user_id'];
		actionType = json['action_type'];
		actionName = json['action_name'];
		targetType = json['target_type'];
		targetId = json['target_id'];
		actionOption = json['action_option'];
		title = json['title'];
		targetBookId = json['target_book_id'];
		targetGroupId = json['target_group_id'];
		createdAt = json['created_at'];
		updatedAt = json['updated_at'];
		targetGroup = json['target_group'];
		targetBook = json['target_book'];
		sUrl = json['_url'];
		sSerializer = json['_serializer'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['user_id'] = this.userId;
		data['action_type'] = this.actionType;
		data['action_name'] = this.actionName;
		data['target_type'] = this.targetType;
		data['target_id'] = this.targetId;
		data['action_option'] = this.actionOption;
		data['title'] = this.title;
		data['target_book_id'] = this.targetBookId;
		data['target_group_id'] = this.targetGroupId;
		data['created_at'] = this.createdAt;
		data['updated_at'] = this.updatedAt;
		data['target_group'] = this.targetGroup;
		data['target_book'] = this.targetBook;
		data['_url'] = this.sUrl;
		data['_serializer'] = this.sSerializer;
		return data;
	}
}
