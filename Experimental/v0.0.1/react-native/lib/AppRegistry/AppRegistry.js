'use strict';

var Demo = require('./demo/demo.js');

var AppRegistry = {
	registerComponent: function(){
		Demo.sayHi();
	},
};

module.exports = AppRegistry;