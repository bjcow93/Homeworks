document.addEventListener("DOMContentLoaded", function(){
  const canvas = document.getElementById("mycanvas");
  canvas.height = 500;
  canvas.width = 500;
  const ctx = canvas.getContext("2d");
  ctx.fillStyle = "red";
  ctx.fillRect(200, 200, 200, 200);
  ctx.beginPath();
  ctx.arc(300, 300, 100, 100, 0, 2*Math.PI, true);
  ctx.strokeStyle = "blue";
  ctx.lineWidth = 3;
  ctx.stroke();
  ctx.fillStyle = "green";
  ctx.fill();
});
