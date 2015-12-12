// Adapter plate to bolt under the BarFly SLI
// Bottom of the model is the top of physical object
module undersideAdapter(height) {

  innerRadius = 18.5;
  lipRecess = 3;

  // M4 Nuts
  nutRadius = 3.6; // Dia 7.2
  nutDepth = 10;
  nutOffset = nutRadius + 6.5;

  translate([0, 0, height]) rotate([0, 180, 0]) difference() {
    topDisc(height, innerRadius, lipRecess);

    // Top
    translate([0, nutOffset]) nutHole(depth = nutDepth, radius = nutRadius);
    // Bottom
    translate([0, -nutOffset]) nutHole(depth = nutDepth, radius = nutRadius);
    // Right
    translate([nutOffset, 0]) {
      rotate([0, 0, 90]) nutHole(depth = nutDepth, radius = nutRadius);
    }
    // Left
    translate([-nutOffset, 0]) {
      rotate([0, 0, 90]) nutHole(depth = nutDepth, radius = nutRadius);
    }
  }
}

// Top "disc" of the mount, to fit the underside of the mount.
// Includes the lip to fit up into the mount completely
module topDisc(height, radius, lipRecess) {
  lowerHeight = height - lipRecess;

  linear_extrude(lowerHeight) {
    circle(r = radius);
  }

  translate([0, 0, lowerHeight]) {
    linear_extrude(lipRecess) {
      circle(radius - lipRecess);
    }
  }
}

// Sticks out beyond depth by 1 pixel either end
module nutHole(depth, radius) {

  nutRecessHeight = depth * 0.6;

  translate([0, 0, -1]) {
    linear_extrude(nutRecessHeight + 1) {
      circle(r = radius, $fn = 6);
    }
  }

  translate([0, 0, nutRecessHeight - 1]) {
    linear_extrude(depth - nutRecessHeight + 2) {
      circle(r = radius * 0.5); 
    }
  }

}
