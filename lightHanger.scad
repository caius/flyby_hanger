// Improve resolution of shapes
$fn=100;

include <undersideAdapter.scad>

module peg(r = 3, length = 5) {
  // o-ring pegs
  rotate([0, 90, 0]) {
    linear_extrude(height = length) {
      hull() {
        translate([0, (r * 2), 0]) circle(r = r);
        circle(r = r);
      }
    }
  }
}

union() {
  undersideAdapter(height = 10);

  translate([0, 0, 10]) {
    difference() {
      linear_extrude(height = 10, center = false) {
        square(size = 13, center = true);
      }
    }
  }

  // Flat hanger plate
  hangerX = 21;
  hangerHeight = 10;
  hangerLength = 50;
  hangerWidth = 30;
  translate([0, 0, hangerX]) {
    cube(size=[hangerWidth, hangerLength, hangerHeight], center = true);
  }

  pegLength = 10;
  pegRadius = 3;

  translate([(hangerWidth/2), (hangerLength/4) - 3, hangerX]) {
    peg(length = pegLength, r = pegRadius);
  }

  translate([(hangerWidth/2), -(hangerLength/4) - 3, hangerX]) {
  peg(length = pegLength, r = pegRadius);
  }

  translate([-(hangerWidth/2 + pegLength), (hangerLength/4) - 3, hangerX]) {
  peg(length = pegLength, r = pegRadius);
  }

  translate([-(hangerWidth/2 + pegLength), -(hangerLength/4) - 3, hangerX]) {
  peg(length = pegLength, r = pegRadius);
  }

  // t'nipple
  nippleX = hangerX + (hangerHeight/2);
  translate([0, 5, nippleX]) { // FIXME: Figure out correct offset for hole
    linear_extrude(height = 2, center = false) {
      circle(r = 1);
    }
  }
}
