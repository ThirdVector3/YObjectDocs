import "objProps" as objProps

impl group {
	fn alpha(self, opacity: float, duration: float) {
		AddTrigger({
			objProps.OBJ_ID: TriggerProperty(1007),
			objProps.TARGET: TriggerProperty(self),
			objProps.OPACITY: TriggerProperty(opacity),
			objProps.DURATION: TriggerProperty(duration),
		})
	}
	fn move(self, x: int, y: int, duration: float, easing: Easing = Easing.None) {
		AddTrigger({
			objProps.OBJ_ID: TriggerProperty(901),
			objProps.TARGET: TriggerProperty(self),
			objProps.MOVE_X: TriggerProperty(x * 3),
			objProps.MOVE_Y: TriggerProperty(y * 3),
			objProps.DURATION: TriggerProperty(duration),
			objProps.EASING: TriggerProperty((easing)int),
		})
	}
	fn toggle(self, on: bool) {
		AddTrigger({
			objProps.OBJ_ID: TriggerProperty(1049),
			objProps.TARGET: TriggerProperty(self),
			objProps.ACTIVATE_GROUP: TriggerProperty(on),
		})
	}
	fn stop(self) {
		AddTrigger({
			objProps.OBJ_ID: TriggerProperty(1616),
			objProps.TARGET: TriggerProperty(self),
		})
	}
	fn spawn(self, delay: float = 0) {
		AddTrigger({
			objProps.OBJ_ID: TriggerProperty(1268),
			objProps.TARGET: TriggerProperty(self),
			objProps.SPAWN_DURATION: TriggerProperty(delay),
		})
	}
	fn rotate(self, center: group, degrees: float, duration: float, easing: Easing = Easing.None) {
		AddTrigger({
			objProps.OBJ_ID: TriggerProperty(1346),
			objProps.TARGET: TriggerProperty(self),
			objProps.ROTATE_DEGREES: TriggerProperty(degrees),
			objProps.DURATION: TriggerProperty(duration),
			objProps.EASING: TriggerProperty((easing)int),
			objProps.CENTER: TriggerProperty(center),
		})
	}
	fn pulse(self, red: int, green: int, blue: int, fadeIn: float = 0, hold: float = 0, fadeOut: float = 0) {
		AddTrigger({
			objProps.OBJ_ID: TriggerProperty(1006),
			objProps.TARGET: TriggerProperty(self),
			objProps.TARGET_TYPE: TriggerProperty(1),
			objProps.TRIGGER_RED: TriggerProperty(red),
			objProps.TRIGGER_GREEN: TriggerProperty(green),
			objProps.TRIGGER_BLUE: TriggerProperty(blue),
			objProps.FADE_IN: TriggerProperty(fadeIn),
			objProps.HOLD: TriggerProperty(hold),
			objProps.FADE_OUT: TriggerProperty(fadeOut),
		})
	}
}