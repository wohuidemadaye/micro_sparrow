class FollowVo {
	String actionType;
	String targetType;
	num targetId;

	FollowVo({this.actionType, this.targetType, this.targetId});

	FollowVo.fromJson(Map<String, dynamic> json) {
		actionType = json['action_type'];
		targetType = json['target_type'];
		targetId = json['target_id'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['action_type'] = this.actionType;
		data['target_type'] = this.targetType;
		data['target_id'] = this.targetId;
		return data;
	}
}
