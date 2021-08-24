function makeCar(a, b) {
  return {
    speed: 0,
    accelRate: a,
    brakeRate: b,
    accelerate() {
      this.speed += this.accelRate;
    },
    brake() {
      this.speed -= this.brakeRate;
      if (this.speed < 0) this.speed = 0;
    },
  };
}

let sedan = makeCar(8, 6);
sedan.accelerate();
console.log(sedan.speed);
sedan.brake();
console.log(sedan.speed);
sedan.brake();
console.log(sedan.speed);


let coupe = makeCar(12);
coupe.accelerate();
console.log(coupe.speed);
12

let hatchback = makeCar(9);