import "objProps" as objProps


impl color {
	fn pulse(self, red: int, green: int, blue: int, fadeIn: float = 0, hold: float = 0, fadeOut: float = 0) {
		AddTrigger({
			objProps.OBJ_ID: TriggerProperty(1006),
			objProps.TARGET: TriggerProperty(self),
			objProps.TARGET_TYPE: TriggerProperty(0),
			objProps.TRIGGER_RED: TriggerProperty(red),
			objProps.TRIGGER_GREEN: TriggerProperty(green),
			objProps.TRIGGER_BLUE: TriggerProperty(blue),
			objProps.FADE_IN: TriggerProperty(fadeIn),
			objProps.HOLD: TriggerProperty(hold),
			objProps.FADE_OUT: TriggerProperty(fadeOut),
		})
	}
}