(function () {
	var TapTimes = 0,
	TapTimeout,
	LongTimeout,
	LastDirect = '';
	var TouchCommon = {

	}

	var Gesture = function (event, element) {
		this.data = {};
		this.eventType = null;
		this.rotateActive = this.pinchActive = false;
	};
	Gesture.prototype = {
	};
	
	var Touch = function (obj) {
		var _this = this;
		if(!(this instanceof Touch)){
			return new Touch(obj);
		};
		_this.obj = obj || window;
		_this.init();
	};
	Touch.prototype = {

	};
	window.JTouch = Touch;
}());
