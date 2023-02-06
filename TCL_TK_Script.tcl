# Section1: ?
# Description of what does the script do?
# Script to immerse our protein 1j4n.pdb in a sphere of water just large enough to cover it
# This script will place 1j4n in the smallest possible water sphere
# which completely immerses the protein.
# The output of the tcl script will be the center and radius of the water sphere.
# Determine the center of mass of the molecule and store the coordinates
# Solvate the molecule in a water box with enough padding (15 Angestrom)
# Determine which water molecules need to be deleted and use a for loop to delete them
# First modification done is to add our molecule name 1j4n

set molname 1j4n

mol new ${molname}.psf
mol addfile ${molname}.pdb

set cen [measure center [atomselect top all] weight mass]
set x1 [lindex $cen 0]
set y1 [lindex $cen 1]
set z1 [lindex $cen 2]
set max 0

foreach atom [[atomselect top all] get index] {
  set pos [lindex [[atomselect top "index $atom"] get {x y z}] 0]
  ## Section2: ?
  ## write lines of code to calculate the distance of the furthest atom from the center of mass
  ## Then store the maximum distance in the $max variable
         set x [lindex $pos 0] 
         set y [lindex $pos 1] 
         set z [lindex $pos 2] 
         set dx [ expr $x1 - $x ] 
         set dy [ expr $y1 - $y ] 
         set dz [ expr $z1 - $z ] 
         set dx2 [ expr $dx * $dx ] 
         set dy2 [ expr $dy * $dy ] 
         set dz2 [ expr $dz * $dz ] 
         set dist [ expr $dx2 + $dy2 + $dz2 ] 
         set distsq [ expr sqrt( $dist ) ] 
         if { $max < $distsq } { 
         set max $distsq } 
                               
  }

mol delete top

package require solvate
solvate ${molname}.psf ${molname}.pdb -t 15 -o del_water

resetpsf
package require psfgen

readpsf del_water.psf
coordpdb del_water.pdb

set wat [atomselect top "same residue as {water and ((x-$x1)*(x-$x1) + 
  (y-$y1)*(y-$y1) + (z-$z1)*(z-$z1))<($max*$max)}"]

set del [atomselect top "water and not same residue as {water and 
  ((x-$x1)*(x-$x1) + (y-$y1)*(y-$y1) + (z-$z1)*(z-$z1))<($max*$max)}"]

set seg [$del get segid]
set res [$del get resid]
set name [$del get name]

for {set i 0} {$i < [llength $seg]} {incr i} {
	## Section 3: ?
	## Delete the atoms in the $del variable from the top molecule
        delatom [lindex $seg $i] [lindex $res $i] [lindex $name $i]    
  }
  
writepsf ${molname}_ws.psf
writepdb ${molname}_ws.pdb

mol delete top

mol new ${molname}_ws.psf
mol addfile ${molname}_ws.pdb
puts "CENTER OF MASS OF SPHERE IS: [measure center [atomselect top all] weight mass]"
puts "RADIUS OF SPHERE IS: $max"