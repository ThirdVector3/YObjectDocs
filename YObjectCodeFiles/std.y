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


enum ObjectPropertyValueType {
	Int
	Bool
	Float
	IntArray
}

struct ObjectPropertyValue {
	type: ObjectPropertyValueType
	intNumber: int
	boolean: bool
	floatNumber: float
	intArray: [int]
}

fn ObjectProperty(value: int) -> ObjectPropertyValue {
	ret = ObjectPropertyValue
	ret.type = ObjectPropertyValueType.Int
	ret.intNumber = value
	return ret
}
fn ObjectProperty(value: bool) -> ObjectPropertyValue {
	ret = ObjectPropertyValue
	ret.type = ObjectPropertyValueType.Bool
	ret.boolean = value
	return ret
}
fn ObjectProperty(value: float) -> ObjectPropertyValue {
	ret = ObjectPropertyValue
	ret.type = ObjectPropertyValueType.Float
	ret.floatNumber = value
	return ret
}
fn ObjectProperty(value: [int]) -> ObjectPropertyValue {
	ret = ObjectPropertyValue
	ret.type = ObjectPropertyValueType.IntArray
	ret.intArray = value
	return ret
}


fn AddObject(props: {int: ObjectPropertyValue}) {
	ret = ""
	defaultProps = {
		objProps.GROUPS: ObjectProperty([9999]),
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
			== ObjectPropertyValueType.Int {
				defaultProps[i].intNumber + ","
			}
			== ObjectPropertyValueType.Bool {
				(defaultProps[i].boolean)int + ","
			}
			== ObjectPropertyValueType.Float {
				defaultProps[i].floatNumber + ","
			}
			== ObjectPropertyValueType.IntArray {
				tmp = ""
				for elem in defaultProps[i].intArray {
					tmp += elem + "."
				}
				tmp + ","
			}
		}
	}
	ret += ";"
	//$print(ret + "\n")
	$addObjectString(ret)
}

/* to add object:
AddObject({
	objProps.OBJ_ID: ObjectProperty(1),
	objProps.X: ObjectProperty(30),
	objProps.Y: ObjectProperty(30),
)}
*/

PLAY_UPDATE_FUNCTIONS = []
fn onEnginePlayUpdate(func: fn ()) {
	PLAY_UPDATE_FUNCTIONS += [func]
}

IMGUI_UPDATE_FUNCTIONS = []
fn onImGuiUpdate(func: fn ()) {
	IMGUI_UPDATE_FUNCTIONS += [func]
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

fn onEvent(events: [int], func: fn (), extraId2: int = 0) {
	tmpGroup = $currentGroup(0)
	newGroup = ?g // strange name because of bug
	AddTrigger({
		objProps.OBJ_ID: TriggerProperty(3604),
		objProps.TARGET: TriggerProperty(newGroup),
		objProps.EVENTS: TriggerProperty(events),
		objProps.EXTRA_ID_2: TriggerProperty(extraId2),
	})
	$currentGroup(0,newGroup)
	func()
	$currentGroup(0,tmpGroup)
}

fn whileLoop(expression: fn () -> bool, func: fn (), delay: float = 0.005) {
	tmpGroup = $currentGroup(0)
	newGroup = ?g
	newGroup.spawn()
	$currentGroup(0,newGroup)
	if expression() {
		func()
		newGroup.spawn(delay)
	}
	$currentGroup(0,tmpGroup)
}
fn whileLoop(expression: fn () -> item, func: fn (), delay: float = 0.005) {
	tmpGroup = $currentGroup(0)
	newGroup = ?g
	newGroup.spawn()
	$currentGroup(0,newGroup)
	if expression() {
		func()
		newGroup.spawn(delay)
	}
	$currentGroup(0,tmpGroup)
}
fn whileLoop(expression: fn () -> timer, func: fn (), delay: float = 0.005) {
	tmpGroup = $currentGroup(0)
	newGroup = ?g
	newGroup.spawn()
	$currentGroup(0,newGroup)
	if expression() {
		func()
		newGroup.spawn(delay)
	}
	$currentGroup(0,tmpGroup)
}

fn itemToConst(it: item, values: [int], func: fn(value: int)) {
	for i in values {
		if it == i {
			func(i)
		}
	}
}

fn setFunctionGroup(gr: group, func: fn()) {
	tmpGroup = $currentGroup(0)
	$currentGroup(0,gr)
	func()
	$currentGroup(0,tmpGroup)
}


impl string {
	fn split(self, separator: string = "") -> [string] {
		result = []
		tmp = ""
		if separator == "" {
			for i in self {
				result += [i + ""]
			}
			return result
		}
		i = 0
		separatorLength = separator.length
		selfLength = self.length
		while i < selfLength {
			if $substr(self, i, separatorLength) == separator {
				result += [tmp + ""]
				tmp = ""
				i += separator.length - 1
			}
			else {
				tmp += self[i]
			}
			i += 1
		}
		if tmp.length > 0 {
			result += [tmp + ""]
		}
		return result
	}
}
impl int {
	fn parse(self, str: string) -> int {
		result = 0
		sign = 1
		index = 0
		strLength = str.length
		
		if str[index] + " " == "- "  {
			sign = -1
			index += 1
		}
		
		while index < strLength {
			c = str[index]
			digit = 0
			
			if c == "0" { digit = 0 }
			if c == "1" { digit = 1 }
			if c == "2" { digit = 2 }
			if c == "3" { digit = 3 }
			if c == "4" { digit = 4 }
			if c == "5" { digit = 5 }
			if c == "6" { digit = 6 }
			if c == "7" { digit = 7 }
			if c == "8" { digit = 8 }
			if c == "9" { digit = 9 }
			
			result = result * 10 + digit
			
			index += 1
		}
		
		result *= sign
		
		self = result
		return self
	}
}
impl float {
	fn parse(self, str: string) -> float {
		result = 0.0
		fraction = 0.0
		divisor = 10.0
		sign = 1
		decimalPointFound = false
		index = 0
		strLength = str.length
		
		if str[index] + " " == "- "  {
			sign = -1
			index += 1
		}
		
		while index < strLength {
			c = str[index]
			digit = 0
			
			if c == "0" { digit = 0 }
			if c == "1" { digit = 1 }
			if c == "2" { digit = 2 }
			if c == "3" { digit = 3 }
			if c == "4" { digit = 4 }
			if c == "5" { digit = 5 }
			if c == "6" { digit = 6 }
			if c == "7" { digit = 7 }
			if c == "8" { digit = 8 }
			if c == "9" { digit = 9 }
			if c == "." { digit = 10 }
			
			if digit < 10 {
				if decimalPointFound {
					fraction += digit / divisor
					divisor *= 10
				}
				else {
					result = result * 10 + digit
				}
			}
			else {
				if decimalPointFound { break }
				decimalPointFound = true
			}
			
			index += 1
		}
		
		result += fraction
		result *= sign
		
		self = result
		return self
	}
}