$(function () {
  document.addEventListener('phx:update', draw);
});

function draw() {
  var canvas = document.getElementById('graph');
  context = canvas.getContext('2d');
  var manager = document.querySelector("#manager");

  canvas.width = manager.offsetWidth - 40;
  canvas.height = manager.offsetHeight / 2;

  height = parseInt(document.getElementById("graph").getAttribute("height"));
  width = parseInt(document.getElementById("graph").getAttribute("width"));

  context.lineWidth = 1;

  // Fill the path
  context.fillStyle = "#000";
  context.fillRect(0, 0, width, height);
  // canvas.style.opacity = '0.2';

  height = parseInt(document.getElementById("graph").getAttribute("height"));
  width = parseInt(document.getElementById("graph").getAttribute("width"));

  // Fill the path
  context.fillStyle = "#000";
  context.fillRect(0, 0, width, height);

  context.strokeStyle = "#5d5d5d";
  context.beginPath();
  context.moveTo(0, height/2);
  context.lineTo(width, height/2);
  context.closePath();
  context.stroke();
  context.fill();
};

