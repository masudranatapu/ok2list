!function(e){"function"==typeof define&&define.amd?define(["jquery"],e):e("undefined"!=typeof module&&module.exports?require("jquery"):jQuery)}(function(e){function t(t){function o(){function t(e){var t,o=e.offset().top,i=e.attr(u),r=m+l+d>=o;r=r&&(!f.viewport||o+e.height()+(f.thresholdBefore||d)>=m),r&&void 0===e.data("loading")&&(e.data("loading",1),h+=1,t=new Image,t.onload=function(){var t="img"===e[0].nodeName.toLowerCase();t?e.attr("src",i):e.css("backgroundImage","url("+i+")"),t&&"fadeIn"===f.effect&&e.css("opacity",0).animate({opacity:1}),e.removeAttr(u),n()},t.onerror=function(){e.removeAttr(u)},t.src=i)}function n(){h--,0>=h&&setTimeout(o,400)}for(var r=e(f.selector),a=0,s=r.length,m=c.scrollTop(),l=c.height(),h=0;s>a;a++)t(r.eq(a));0===s&&i()}function n(){c.on(s,a)}function i(){c.off(s,a)}var r,a,c=e(window),f=e.extend({selector:"img[data-src]",src:"data-src",effect:"none",threshold:0,thresholdBefore:0,timeout:0,viewport:!1},t),u=f.src,d=f.threshold,s="scroll resize";this.init=function(){i(),n(),a()},a=0===f.timeout?o:function(){clearTimeout(r),r=setTimeout(o,f.timeout)}}e.imgLazy=function(o){var n=new t(o);e.imgLazy=n.init,n.init()}});