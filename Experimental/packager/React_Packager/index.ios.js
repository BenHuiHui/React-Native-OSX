//Basic functions
global.add = function(){ return 27; }

global.addTwoNums = function(a, b){
	return a+b;
}

//Call objective-c methods
global.sayHiInObjc = function(){
	SayHi.sayHi();
}

global.addYellowSubView = function(a){
	SayHi.addYellowSubView(a);
}