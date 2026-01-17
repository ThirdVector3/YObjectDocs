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

const BG = 1000c
const GROUND = 1001c

enum Easing {
	None = 0
	BackIn = 17
	BackInOut = 16
	BackOut = 18
	BounceIn = 8
	BounceInOut = 7
	BounceOut = 9
	EaseIn = 2
	EaseInOut = 1
	EaseOut = 3
	ElasticIn = 5
	ElasticInOut = 4
	ElasticOut = 6
	ExponentialIn = 11
	ExponentialInOut = 10
	ExponentialOut = 12
	SineIn = 14
	SineInOut = 13
	SineOut = 15
}

enum Events {
	JumpPush = 69
	JumpRelease = 70
	LeftPush = 71
	LeftRelease = 72
	RightPush = 73
	RightRelease = 74
}

enum TriggerPropertyValueType {
	Int
	Bool
	Float
	IntArray
}

struct TriggerPropertyValue {
	type: TriggerPropertyValueType
	intNumber: int
	boolean: bool
	floatNumber: float
	intArray: [int]
}

fn TriggerProperty(value: int) -> TriggerPropertyValue {
	ret = TriggerPropertyValue
	ret.type = TriggerPropertyValueType.Int
	ret.intNumber = value
	return ret
}
fn TriggerProperty(value: bool) -> TriggerPropertyValue {
	ret = TriggerPropertyValue
	ret.type = TriggerPropertyValueType.Bool
	ret.boolean = value
	return ret
}
fn TriggerProperty(value: float) -> TriggerPropertyValue {
	ret = TriggerPropertyValue
	ret.type = TriggerPropertyValueType.Float
	ret.floatNumber = value
	return ret
}
fn TriggerProperty(value: [int]) -> TriggerPropertyValue {
	ret = TriggerPropertyValue
	ret.type = TriggerPropertyValueType.IntArray
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
		
		ret += match defaultProps[i].type {
			== TriggerPropertyValueType.Int {
				defaultProps[i].intNumber + ","
			}
			== TriggerPropertyValueType.Bool {
				(defaultProps[i].boolean)int + ","
			}
			== TriggerPropertyValueType.Float {
				defaultProps[i].floatNumber + ","
			}
			== TriggerPropertyValueType.IntArray {
				tmp = ""
				for elem in defaultProps[i].intArray {
					tmp += elem + "."
				}
				tmp + ","
			}
		}
		
		
		/*
		if defaultProps[i].type == TriggerPropertyValueType.Int {
			ret += defaultProps[i].intNumber + ","
		}
		if defaultProps[i].type == TriggerPropertyValueType.Bool {
			ret += (defaultProps[i].boolean)int + ","
		}
		if defaultProps[i].type == TriggerPropertyValueType.Float {
			ret += defaultProps[i].floatNumber + ","
		}
		if defaultProps[i].type == TriggerPropertyValueType.IntArray {
			for elem in defaultProps[i].intArray {
				ret += elem + "."
			}
			ret += ","
		}
		*/
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

UPDATE_FUNCTIONS = []
fn onEngineUpdate(func: fn ()) {
	UPDATE_FUNCTIONS += [func]
}


fn wait(seconds: float) {
	newGroup____ = ?g
	AddTrigger({
		objProps.OBJ_ID: TriggerProperty(1268),
		objProps.TARGET: TriggerProperty(newGroup____),
		objProps.SPAWN_DURATION: TriggerProperty(seconds),
	})
	$currentGroup(0,newGroup____)
}

fn onEvent(events: [int], func: fn (), extraId2: int = 0) {
	tmpGroup____ = $currentGroup(0)
	newGroup____ = ?g // strange name because of bug
	AddTrigger({
		objProps.OBJ_ID: TriggerProperty(3604),
		objProps.TARGET: TriggerProperty(newGroup____),
		objProps.EVENTS: TriggerProperty(events),
		objProps.EXTRA_ID_2: TriggerProperty(extraId2),
	})
	$currentGroup(0,newGroup____)
	func()
	$currentGroup(0,tmpGroup____)
}

fn whileLoop(expression: fn () -> bool, function: fn (), delay: float = 0.005) {
	tmpGroup____ = $currentGroup(0)
	newGroup____ = ?g
	newGroup____.spawn()
	$currentGroup(0,newGroup____)
	if expression() {
		function()
		newGroup____.spawn(delay)
	}
	$currentGroup(0,tmpGroup____)
}
fn whileLoop(expression: fn () -> item, func: fn (), delay: float = 0.005) {
	tmpGroup____ = $currentGroup(0)
	newGroup____ = ?g
	newGroup____.spawn()
	$currentGroup(0,newGroup____)
	if expression() {
		func()
		newGroup____.spawn(delay)
	}
	$currentGroup(0,tmpGroup____)
}
fn whileLoop(expression: fn () -> timer, func: fn (), delay: float = 0.005) {
	tmpGroup____ = $currentGroup(0)
	newGroup____ = ?g
	newGroup____.spawn()
	$currentGroup(0,newGroup____)
	if expression() {
		func()
		newGroup____.spawn(delay)
	}
	$currentGroup(0,tmpGroup____)
}