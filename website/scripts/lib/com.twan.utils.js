/**
$Rev:: 1028      $
$Author:: twan   $
$Date: 2013-10-07 02:24:03 +0200 (Mon, 07 Oct 2013) $
**/

//==== Object ==================================================================

//---- Object.create -----------------------------------------------------------
/*
** Creates a new object with a prototype link to obj.
** This allows for delegation.// Function with local helper-function.
**
*/
if(typeof Object.create !== 'function'){
	Object.create =function(obj){
		var f =function(){
			f.prototype =obj;
			return new f();
		};
	};
};

//---- Function.prototype.override ---------------------------------------------
Function.prototype.override =function(name, func){
		this.prototype[name] =func;
		return this;
};

//---- Function.prototype.method -----------------------------------------------
Function.prototype.method =function(name, func){
	if(!this.prototype[name]){
		this.override(name, func);
		return this;
	};
	return null;
};

//---- Object.superior ---------------------------------------------------------
// Retrieval of super method from prototype chain
Object.method('superior', function(name){
	var that =this,
		method =that[name];
	return function(){
		return method.apply(that, arguments);
	};
});



//---- Array.forall ------------------------------------------------------------
Array.method('forall', function(func, defaultretval){
	for(var i=0; i<this.length; i++){
		var r =func(i);
		if(r!=null){
			return r;
		}
	};
	return defaulretval;
});





var com = { twan : { utils : {

	// Helaas moet je bij de 'overrides' voor addEventHandler en removeEventHandler
	// expliciet het object meegeven wil 't ook werken voor IE c.s..
	// Omdat in IE de built-in browser objecten niet van Object willen overerven.
	addEventHandler: function (obj, type, fn, capture) {
        if (typeof obj.addEventListener != undefined) {
            obj.addEventListener(type, fn, capture);
        } else if (typeof obj.attachEvent != undefined) {
            obj.attachEvent("on" + type, fn);
        }
    },

    removeEventHandler: function(obj, type, fn) {
        if (typeof obj.addEventListener != undefined) {
            this.removeEventListener(type, fn, false);
        } else if (typeof obj.attachEvent != undefined) {
            obj.detachEvent("on" + type, obj[type + fn]);
            obj[type + fn] = null;
            obj["e" + type + fn] = null;
        }
    },
        
    BrowserInfo : function(){ 
		var that ={
			ua :'', 
			mobile : false,
			rebrowsers : {
				'safari' : new RegExp('^.*Safari.*'),
				'firefox' : new RegExp('^.*Firefox.*'),
				'msie' : new RegExp('^.*MSIE.*')
				},
			reMobile : new RegExp('^.*Mobile.*')
		};
		
		that.identify =function(){
			// Not fool-proof.
			var ua =navigator.userAgent,
				res =this.rebrowsers;
			for(var p in res){
				if(res.hasOwnProperty(p) && p && res[p].test(ua)){
					that.ua=p;
					break;
				}
			};
			that.mobile =((that.ua=='safari') && that.reMobile.test(ua));
		};
		
		that.showWarningIn =function(elem_id){
			var we =document.getElementById(elem_id);
			we.innerHTML="Safari or Firefox only.";
			we.className+=(!((that.ua=='safari') || (that.ua=='firefox')))?' warning':'';
			return that;
		};
		
		that.identify();
	
		return that;
		}
}}};
com.twan.utils.browserinfo =com.twan.utils.BrowserInfo();


//==== CanvasRenderingContext2D ================================================
/*
To draw a line from 20,150 to 170,10 with dashes that are 30px long followed 
by a gap of 10px, you would use:

	myContext.dashedLine(20,150,170,10,[30,10]);

To draw alternating dashes and dots, use (for example):

	myContext.lineCap   = 'round';
	myContext.lineWidth = 4; // Lines 4px wide, dots of diameter 4
	myContext.dashedLine(20,150,170,10,[30,10,0,10]);

The "very short" dash length of 0 combined with the rounded lineCap results in 
dots along your line.

Via: http://stackoverflow.com/questions/4576724/dotted-stroke-in-canvas .

*/

// WARNNING: Vertical lines fail.  Review link below before use.

var CP = window.CanvasRenderingContext2D && CanvasRenderingContext2D.prototype;
if (CP && CP.lineTo){
  CP.dashedLine = function(x,y,x2,y2,dashArray){
    if (!dashArray) dashArray=[10,5];
    if (dashLength==0) dashLength = 0.001; // Hack for Safari
    var dashCount = dashArray.length;
    this.moveTo(x, y);
    var dx = (x2-x), dy = (y2-y);
    var slope = dy/dx;
    var distRemaining = Math.sqrt( dx*dx + dy*dy );
    var dashIndex=0, draw=true;
    while (distRemaining>=0.1){
      var dashLength = dashArray[dashIndex++%dashCount];
      if (dashLength > distRemaining) dashLength = distRemaining;
      var xStep = Math.sqrt( dashLength*dashLength / (1 + slope*slope) );
      x += xStep
      y += slope*xStep;
      this[draw ? 'lineTo' : 'moveTo'](x,y);
      distRemaining -= dashLength;
      draw = !draw;
    }
  }
}


// eof(com.twan.utils.js).