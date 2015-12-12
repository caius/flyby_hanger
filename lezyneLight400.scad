module lezyneLight400(width, height, length) {

  rectHeight = height / 2;
  rectLength = width / 2;
  circleRadius = rectHeight / 2;

  translate([0, 0, height]) {
    rotate([0, 90, 0]) {
      linear_extrude(height = length) {
        translate([0, circleRadius, 0]) {
          minkowski() {
            square([rectHeight, rectLength]);
            translate([circleRadius, 0, 0]) circle(circleRadius);
          }
        }
      }
    }
  }

}
