module nuthole(m=7) {
  circle(m/2, $fn=6);
}

render() {
  difference() {
    circle(r=16.5);

    translate([0, 7, 0]) {
      nuthole(m=7);
    }


  }
}
