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


impl group {
    fn alpha(self, opacity: float, duration: float) {
        $addObjectString("1,1007,2," + $currentXPos() +  ",3,29000,57,9999." + $currentGroup(0) + ",62,1,87,1,36,1,51," + (self)int +",10," + duration + ",35," + opacity +";")
        $currentXPos($currentXPos()+1)
    }
    fn move(self, x: int, y: int, duration: float, easing: int = 0) {
        $addObjectString("1,901,2," + $currentXPos() +  ",3,29000,57,9999." + $currentGroup(0) + ",62,1,87,1,36,1,51," + (self)int +",28," + (x*3) + ",29," + (y*3) + ",10," + duration + ",30,"+easing+",85,2;")
        $currentXPos($currentXPos()+1)
    }
    fn toggle(self, on: bool) {
        $addObjectString("1,1049,2," + $currentXPos() +  ",3,29000,57,9999." + $currentGroup(0) + ",62,1,87,1,36,1,51," + (self)int +",56,"+(on)int+";")
        $currentXPos($currentXPos()+1)
    }
    fn stop(self) {
        $addObjectString("1,1616,2," + $currentXPos() +  ",3,29000,57,9999." + $currentGroup(0) + ",62,1,87,1,36,1,51," + (self)int +";")
        $currentXPos($currentXPos()+1)
    }
    fn spawn(self, delay: float) {
        $addObjectString("1,1268,2," + $currentXPos() +  ",3,29000,57,9999." + $currentGroup(0) + ",62,1,87,1,36,1,51," + (self)int +",63,"+delay+";")
        $currentXPos($currentXPos()+1)
    }
    fn rotate(self, center: group, degrees: float, duration: float, easing: int = 0) {
        $addObjectString("1,1346,2," + $currentXPos() +  ",3,29000,57,9999." + $currentGroup(0) + ",62,1,87,1,36,1,51," + (self)int +",71," + (center)int +",10," + duration + ",30,"+easing+",85,2,68,"+degrees+";")
        $currentXPos($currentXPos()+1)
    }
}

fn wait(seconds: float) {
    newGroup = ?g
    $addObjectString("1,1268,2," + $currentXPos() +  ",3,29000,57,9999." + $currentGroup(0) + ",62,1,87,1,36,1,51,"+newGroup+",63,"+seconds+";")
    $currentGroup(0,newGroup)
}