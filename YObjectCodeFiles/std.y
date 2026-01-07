import "objProps" as objProps

// easing
const BACK_IN = 17
const BACK_IN_OUT = 16
const BACK_OUT = 18
const BOUNCE_IN = 8
const BOUNCE_IN_OUT = 7
const BOUNCE_OUT = 9
const EASE_IN = 2
const EASE_IN_OUT = 1
const EASE_OUT = 3
const ELASTIC_IN = 5
const ELASTIC_IN_OUT = 4
const ELASTIC_OUT = 6
const EXPONENTIAL_IN = 11
const EXPONENTIAL_IN_OUT = 10
const EXPONENTIAL_OUT = 12
const SINE_IN = 14
const SINE_IN_OUT = 13
const SINE_OUT = 15


struct TriggerPropertyValue {
	type: string
	intNumber: int
	boolean: bool
	floatNumber: float
	intArray: [int]
}

fn TriggerProperty(value: int) -> TriggerPropertyValue {
	ret = TriggerPropertyValue
	ret.type = "int"
	ret.intNumber = value
	return ret
}
fn TriggerProperty(value: bool) -> TriggerPropertyValue {
	ret = TriggerPropertyValue
	ret.type = "bool"
	ret.boolean = value
	return ret
}
fn TriggerProperty(value: float) -> TriggerPropertyValue {
	ret = TriggerPropertyValue
	ret.type = "float"
	ret.floatNumber = value
	return ret
}
fn TriggerProperty(value: [int]) -> TriggerPropertyValue {
	ret = TriggerPropertyValue
	ret.type = "intArray"
	ret.intArray = value
	return ret
}


fn AddTrigger(props: {int: TriggerPropertyValue}) {
	ret = ""
	defaultProps = {
		objProps.OBJ_ID: TriggerProperty(1268),
		objProps.X: TriggerProperty($currentXPos($currentXPos()+1)),
		objProps.Y: TriggerProperty(29000),
		objProps.ACTIVE_TRIGGER: TriggerProperty(true),
		objProps.GROUPS: TriggerProperty([9999, ($currentGroup(0))int]),
		objProps.SPAWN_TRIGGERED: TriggerProperty(true),
		objProps.MULTI_TRIGGER: TriggerProperty(true),
	}
	for i in props {
		if !(defaultProps[i]) {
			defaultProps += {i: props[i]}
		}
		else {
			defaultProps[i] = props[i]
		}
	}
	
	for i in defaultProps {
		ret += (i)string + ","
		if defaultProps[i].type == "int" {
			ret += defaultProps[i].intNumber + ","
		}
		if defaultProps[i].type == "bool" {
			ret += (defaultProps[i].boolean)int + ","
		}
		if defaultProps[i].type == "float" {
			ret += defaultProps[i].floatNumber + ","
		}
		if defaultProps[i].type == "intArray" {
			for elem in defaultProps[i].intArray {
				ret += elem + "."
			}
			ret += ","
		}
	}
	ret += ";"
	//$print(ret + "\n")
	$addObjectString(ret)
}

// to add trigger:
/*
AddTrigger({
	objProps.OBJ_ID: TriggerProperty(1007),
	objProps.TARGET: TriggerProperty(2),
	objProps.OPACITY: TriggerProperty(0),
	objProps.DURATION: TriggerProperty(2),
})
*/

impl group {
	fn alpha(self, opacity: float, duration: float) {
		AddTrigger({
			objProps.OBJ_ID: TriggerProperty(1007),
			objProps.TARGET: TriggerProperty(self),
			objProps.OPACITY: TriggerProperty(opacity),
			objProps.DURATION: TriggerProperty(duration),
		})
	}
	fn move(self, x: int, y: int, duration: float, easing: int = 0) {
		AddTrigger({
			objProps.OBJ_ID: TriggerProperty(901),
			objProps.TARGET: TriggerProperty(self),
			objProps.MOVE_X: TriggerProperty(x * 3),
			objProps.MOVE_Y: TriggerProperty(y * 3),
			objProps.DURATION: TriggerProperty(duration),
			objProps.EASING: TriggerProperty(easing),
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
	fn rotate(self, center: group, degrees: float, duration: float, easing: int = 0) {
		AddTrigger({
			objProps.OBJ_ID: TriggerProperty(1346),
			objProps.TARGET: TriggerProperty(self),
			objProps.ROTATE_DEGREES: TriggerProperty(degrees),
			objProps.DURATION: TriggerProperty(duration),
			objProps.EASING: TriggerProperty(easing),
			objProps.CENTER: TriggerProperty(center),
		})
	}
}

fn wait(seconds: float) {
	newGroup = ?g
	AddTrigger({
		objProps.OBJ_ID: TriggerProperty(1268),
		objProps.TARGET: TriggerProperty(newGroup),
		objProps.SPAWN_DURATION: TriggerProperty(seconds),
	})
	$currentGroup(0,newGroup)
}