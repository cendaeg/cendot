"use strict";
var canvas = document.querySelector('canvas');
var ctx = canvas.getContext('2d');
var color = '#444444';
canvas.width = window.innerWidth;
canvas.height = window.innerHeight;
canvas.style.display = 'block';
ctx.fillStyle = color;
ctx.lineWidth = .2;
ctx.strokeStyle = color;

class Dots {
  constructor() {
    this.nb = 450;
    this.distance = 50;
    this.d_radius = 50;
    this.array = [];
  }
  create() {
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    var dot;
    for (var i = 0; i < this.nb; i++) {
      this.array.push(new Dot());
      dot = this.array[i];
      dot.create();
    }
    dot.line();
    dot.animate();
  }
}

class Dot {
  constructor() {
    this.x = Math.random() * canvas.width;
    this.y = Math.random() * canvas.height;
    this.vx = -.5 + Math.random();
    this.vy = -.5 + Math.random();
    this.radius = Math.random();
  }
  create() {
    ctx.beginPath();
    ctx.arc(this.x, this.y, this.radius, 0, Math.PI * 2, false);
    ctx.fill();
  }
  animate() {
    for (var i = 0; i < dots.nb; i++) {
      var dot = dots.array[i];
      if (dot.y < 0 || dot.y > canvas.height) {
        dot.vx = dot.vx;
        dot.vy = -dot.vy;
      } else if (dot.x < 0 || dot.x > canvas.width) {
        dot.vx = -dot.vx;
        dot.vy = dot.vy;
      }
      dot.x += dot.vx;
      dot.y += dot.vy;
    }
  };
  line() {
    for (var i = 0; i < dots.nb; i++) {
      for (var j = 0; j < dots.nb; j++) {
        var i_dot = dots.array[i];
        var j_dot = dots.array[j];
        if ((i_dot.x - j_dot.x) < dots.distance && (i_dot.y - j_dot.y) < dots.distance && (i_dot.x - j_dot.x) > -dots.distance && (i_dot.y - j_dot.y) > -dots.distance) {
          ctx.beginPath();
          ctx.moveTo(i_dot.x, i_dot.y);
          ctx.lineTo(j_dot.x, j_dot.y);
          ctx.stroke();
          ctx.closePath();
        }
      }
    }
  }
};

var dots = new Dots();

(function animate() {
 dots.create();
 window.requestAnimationFrame(animate);
 })();
