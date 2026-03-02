import "objProps" as objProps
const PI = 3.141592
fn abs(x: item) -> timer {
	ret = x + 0.0
	AddTrigger({
		objProps.OBJ_ID: TriggerProperty(3619),
		objProps.BLOCK_A: TriggerProperty(x),
		objProps.TARGET: TriggerProperty(ret),
		476: TriggerProperty(1),
		478: TriggerProperty(2),
		479: TriggerProperty(1),
		481: TriggerProperty(1),
		482: TriggerProperty(3),
		578: TriggerProperty(1),
	})
	return ret
}
fn abs(x: timer) -> timer {
	ret = x + 0
	AddTrigger({
		objProps.OBJ_ID: TriggerProperty(3619),
		objProps.BLOCK_A: TriggerProperty(x),
		objProps.TARGET: TriggerProperty(ret),
		476: TriggerProperty(2),
		478: TriggerProperty(2),
		479: TriggerProperty(1),
		481: TriggerProperty(1),
		482: TriggerProperty(3),
		578: TriggerProperty(1),
	})
	return ret
}
fn round(x: timer) -> timer {
	ret = x + 0
	AddTrigger({
		objProps.OBJ_ID: TriggerProperty(3619),
		objProps.BLOCK_A: TriggerProperty(x),
		objProps.TARGET: TriggerProperty(ret),
		476: TriggerProperty(2),
		478: TriggerProperty(2),
		479: TriggerProperty(1),
		481: TriggerProperty(1),
		482: TriggerProperty(3),
		485: TriggerProperty(1),
	})
	return ret
}
fn floor(x: timer) -> timer {
	ret = x + 0
	AddTrigger({
		objProps.OBJ_ID: TriggerProperty(3619),
		objProps.BLOCK_A: TriggerProperty(x),
		objProps.TARGET: TriggerProperty(ret),
		476: TriggerProperty(2),
		478: TriggerProperty(2),
		479: TriggerProperty(1),
		481: TriggerProperty(1),
		482: TriggerProperty(3),
		485: TriggerProperty(2),
	})
	return ret
}
fn ceil(x: timer) -> timer {
	ret = x + 0
	AddTrigger({
		objProps.OBJ_ID: TriggerProperty(3619),
		objProps.BLOCK_A: TriggerProperty(x),
		objProps.TARGET: TriggerProperty(ret),
		476: TriggerProperty(2),
		478: TriggerProperty(2),
		479: TriggerProperty(1),
		481: TriggerProperty(1),
		482: TriggerProperty(3),
		485: TriggerProperty(3),
	})
	return ret
}
fn mod(a: timer, b: timer) -> timer {
	return a - (floor(a/b) * b)
}
fn mod(a: timer, b: float) -> timer {
	return a - (floor(a/b) * b)
}
fn degreesToRadians(x: timer) -> timer {
	return PI/180 * x
}
fn sin(x: timer) -> timer {
	xOverPi = (mod(x+PI, 2*PI)-PI)/PI
	u = xOverPi * (1 - abs(xOverPi))
	return u * (3.1 + 3.6 * abs(u))
}
fn cos(x: timer) -> timer {
	return sin(x + PI/2)
}
fn sqrt(x: timer) -> timer {
	ret = x + 0
	ret = 1.04
	for i in 0..8 {
		ret = (ret + x / ret) / 2
	}
	return ret
}