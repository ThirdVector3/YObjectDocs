import "objProps" as objProps

impl block {
	fn onCollision(self, other: block, func: fn (), activateGroup = true) {
		tmpGroup = $currentGroup(0)
		newGroup = ?g
		AddTrigger({
			objProps.OBJ_ID: TriggerProperty(1815),
			objProps.TARGET: TriggerProperty(newGroup),
			objProps.BLOCK_A: TriggerProperty(self),
			objProps.BLOCK_B: TriggerProperty(other),
			objProps.ACTIVATE_GROUP: TriggerProperty(activateGroup),
			objProps.ACTIVATE_ON_EXIT: TriggerProperty(false),
		})
		$currentGroup(0,newGroup)
		func()
		$currentGroup(0,tmpGroup)
	}
	fn onCollisionExit(self, other: block, func: fn (), activateGroup = true) {
		tmpGroup = $currentGroup(0)
		newGroup = ?g
		AddTrigger({
			objProps.OBJ_ID: TriggerProperty(1815),
			objProps.TARGET: TriggerProperty(newGroup),
			objProps.BLOCK_A: TriggerProperty(self),
			objProps.BLOCK_B: TriggerProperty(other),
			objProps.ACTIVATE_GROUP: TriggerProperty(activateGroup),
			objProps.ACTIVATE_ON_EXIT: TriggerProperty(true),
		})
		$currentGroup(0,newGroup)
		func()
		$currentGroup(0,tmpGroup)
	}
}