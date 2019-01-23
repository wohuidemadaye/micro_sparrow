class TokenEntity {
	Data data;

	TokenEntity({this.data});

	TokenEntity.fromJson(Map<String, dynamic> json) {
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
	String type;
	num userId;
	String description;
	String createdAt;
	String updatedAt;
	num spaceId;
	String scope;
	String token;
	String application;
	String sSerializer;

	Data({this.id, this.type, this.userId, this.description, this.createdAt, this.updatedAt, this.spaceId, this.scope, this.token, this.application, this.sSerializer});

	Data.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		type = json['type'];
		userId = json['user_id'];
		description = json['description'];
		createdAt = json['created_at'];
		updatedAt = json['updated_at'];
		spaceId = json['space_id'];
		scope = json['scope'];
		token = json['token'];
		application = json['application'];
		sSerializer = json['_serializer'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['type'] = this.type;
		data['user_id'] = this.userId;
		data['description'] = this.description;
		data['created_at'] = this.createdAt;
		data['updated_at'] = this.updatedAt;
		data['space_id'] = this.spaceId;
		data['scope'] = this.scope;
		data['token'] = this.token;
		data['application'] = this.application;
		data['_serializer'] = this.sSerializer;
		return data;
	}
}
