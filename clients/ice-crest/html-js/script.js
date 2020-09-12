var c = document.getElementById("myCanvas");
var ctx = c.getContext("2d");
ctx.moveTo(0.5, 0.5);
ctx.lineTo(200.5, 100.5);
ctx.stroke();

ctx.beginPath()
ctx.moveTo(30, 30)
ctx.lineTo(60, 60)
ctx.lineTo(40, 60)
ctx.closePath()
ctx.fill()
