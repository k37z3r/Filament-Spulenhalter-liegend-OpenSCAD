/*
Filament-Spulenhalter-liegend-OpenSCAD by Sven Reddemann is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.
To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-sa/4.0/.
Based on a work at https://github.com/k37z3r/Filament-Spulenhalter-liegend-OpenSCAD.
*/
module cone(){
    rotate_extrude($fn=200) translate([10.5,0,0]) polygon([[16,0],[16,1],[11,6],[8,6],[1,13],[0,13],[0,0]]);
}
module wheel(){
    difference(){
        union(){
            cylinder(h=5, d1=15, d2=sin(45)*12, $fn=200);
            cylinder(h=5, d1=sin(45)*12, d2=15, $fn=200);
            translate([0,0,-1.5]) cylinder(h=8, d=5, $fn=200);
        }
        translate([0,0,-2.5]) cylinder(h=10, d=3.5, $fn=200);
    }
}
module plate(){
    translate([0,0,20]) cone();
    translate([0,0,20]) cylinder(h=13, d=23, $fn=8);
    difference(){
        translate([0,0,0]) cylinder(h=20, d=140, $fn=200);
        for(a=[45:45:360]){
            translate([47*sin(a),47*cos(a),5]) rotate([a-45,90,45]) cylinder(h=2.6,r=3.46,$fn=6);
            translate([48.3*sin(a+90),-48.3*cos(a+90),-5]) rotate([0,0,a]) cube([2.6,6,20], center=true);
            translate([72*sin(a),72*cos(a),5]) rotate([a+90,90,0]) cylinder(h=31, d=3.5, $fn=200);
            translate([72*sin(a),72*cos(a),5]) rotate([a+90,90,0]) cylinder(h=5.5, d=6, $fn=200);
            translate([59.5*sin(a),-59.5*cos(a),5]) rotate([0,0,a+90]) cube([9,20,20], center=true);
            translate([-63.6*sin(a+22.5),63.6*cos(a+22.5),4.75]) rotate([0,0,a+22.5]) linear_extrude(height=17) translate([-7.5,0,0]) polygon([[0,0],[4,6.5],[11,6.5],[15,0]]);
        }
        translate([0,0,-1]) cylinder(h=11,d=10.5, $fn=200);
        translate([0,0,106]) rotate_extrude(convexity = 10, $fn=200) translate([12, 0, 0]) circle(r = 10, $fn=4);
    }
    translate([0,0,20]) linear_extrude(height = 80, center = false, convexity = 10, twist = 3000) translate([1.5, 0, 0]) circle(r = 10,$fn=40);
}
module plate_cage(){
    for(a=[45:45:90]){
        translate([-63.6*sin(a+22.5),63.6*cos(a+22.5),5]) rotate([0,0,a+22.5]) linear_extrude(height=15) translate([-7.5,0,0]) polygon([[0.25,0.25],[4.45,6.75],[10.75,6.75],[14.75,0.25]]);
        if (a==90){
            difference(){
                rotate([0,0,-67.5+a]) translate([-112,0.05,28.599]) cylinder(h=36.4, d=6.75, $fn=64);
                translate([0,0,65]) rotate([0,0,180+22.5]) rotate_extrude(angle=90.01, convexity=10, $fn=128) translate([112.01,0]) circle(7/2);
                translate([0,0,35]) rotate([0,0,180+22.5]) rotate_extrude(angle=90.01, convexity=10, $fn=128) translate([112.01,0]) circle(7/2);
            }
            difference(){
                rotate([-112.5-a,90,0]) translate([-16.6,-0.05,68]) cylinder(h=32.001, d=6.75, $fn=64);
                translate([0,0,16.6]) rotate([0,0,180+22.5]) rotate_extrude(angle=90.01, convexity=10, $fn=128) translate([90,0]) circle(7/2);
            }  
        }
        else{
            rotate([0,0,-67.5+a]) translate([-112,0.05,28.599]) cylinder(h=36.4, d=6.75, $fn=64);
            rotate([-112.5-a,90,0]) translate([-16.6,-0.05,68]) cylinder(h=32.001, d=6.75, $fn=64);
        }
        rotate([0,90,22.5+a]) translate([-28.6,100, 0.05]) rotate_extrude(angle=90, convexity=10, $fn=128) translate([12,0]) circle(6.75/2);
    }
    translate([0,0,65]) rotate([0,0,90+22.5]) rotate_extrude(angle=89.99, convexity=10, $fn=128) translate([112.01,0]) circle(6.75/2);
    translate([0,0,35]) rotate([0,0,90+22.5]) rotate_extrude(angle=89.99, convexity=10, $fn=128) translate([112.01,0]) circle(6.75/2);
    translate([0,0,16.6]) rotate([0,0,90+22.5]) rotate_extrude(angle=89.99, convexity=10, $fn=128) translate([90,0]) circle(6.75/2);
}
module bignut(){
    difference(){
        union(){
            translate([0,0,10]) rotate_extrude($fn=200) translate([10.5,0,0]) polygon([[16,0],[16,1],[11,6],[8,6],[1,13],[0,13],[0,0]]);
            translate([0,0,10]) cylinder(h=13, d=23, $fn=8);
            difference(){
                translate([0,0,0]) cylinder(h=10, d=70, $fn=200);
                for(a=[36:72:360]) translate([35.5*sin(a),-35.5*cos(a),-0.5]) cylinder(h=11,d=17.5, $fn=200);
            }
        }
        linear_extrude(height = 80, center = false, convexity = 10, twist = 3000) translate([1.5, 0, 0]) circle(r = 10.5, $fn=40);
        translate([0,0,17.5]) cylinder(h=10, d1=15, d2=30, $fn=200);
    }
}
module ground(){
    translate([0,0,20]) cylinder(h=11,d=10, $fn=200);
    difference(){
        cylinder(h=21.75, d=140, $fn=200);
        translate([0,0,20]) cylinder(h=2, d=126, $fn=200);
        translate([-63.6*sin(45),63.6*cos(45),4.75]) rotate([0,0,45]) linear_extrude(height=17) translate([-7.5,0,0]) polygon([[0,0],[4,6.5],[11,6.5],[15,0]]);
        translate([-63.6*sin(-45),63.6*cos(-45),4.75]) rotate([0,0,-45]) linear_extrude(height=17) translate([-7.5,0,0]) polygon([[0,0],[4,6.5],[11,6.5],[15,0]]);
    }
    translate([0,0,20]) cylinder(h=1.75, d=113, $fn=200);
    difference(){
        translate([-50,-15,-42.5]) cube([100,30,42.5]);
        translate([-30,-16,-43]) cube([60,32,43.5]);
        translate([-51,-10,-43]) cube([102,20,23.5]);
        translate([40,20,-30]) rotate([90,0,0]) cylinder(h=40, d=4.2, $fn=200);
        translate([-40,20,-30]) rotate([90,0,0]) cylinder(h=40, d=4.2, $fn=200);
    }
    translate([35,-12.5,-17.5]) rotate([0,300,60])cylinder(h=40, d=5, $fn=200);
    translate([-35,-12.5,-17.5]) rotate([0,300,120])cylinder(h=40, d=5, $fn=200);
    translate([35,12.5,-17.5]) rotate([0,60,120])cylinder(h=40, d=5, $fn=200);
    translate([-35,12.5,-17.5]) rotate([0,60,60])cylinder(h=40, d=5, $fn=200);
    translate([-32.5,12.5,-37.5]) rotate([0,50,90])cylinder(h=61.5, d=5, $fn=200);
    translate([32.5,12.5,-37.5]) rotate([0,50,90])cylinder(h=61.5, d=5, $fn=200);
    translate([-32.5,-12.5,-37.5]) rotate([0,310,90])cylinder(h=61.5, d=5, $fn=200);
    translate([32.5,-12.5,-37.5]) rotate([0,310,90])cylinder(h=61.5, d=5, $fn=200);
    translate([0,0,20]) rotate_extrude(angle=360, convexity=10, $fn=200) translate([59,0]) square([1,1.3]);
}
module ground_cage(){
    for(a=[0:90:90]){
        translate([-63.6*sin(a),63.6*cos(a),6]) rotate([0,0,a]) linear_extrude(height=16.75) translate([-7.5,0,0]) polygon([[0.25,0.25],[4.45,6.75],[10.75,6.75],[14.75,0.25]]);
        translate([-63.6*sin(a),63.6*cos(a),19.3]) rotate([-90,90,a]) translate([0,-0.1,4]) cylinder(h=52.5, d=6.75, $fn=200);
        translate([-63.6*sin(a),63.6*cos(a),19.3]) rotate([0,90,a]) translate([-8,56.5,0.1]) rotate_extrude(angle=90, convexity=10, $fn=200) translate([8,0]) circle(6.75/2);
        translate([-63.6*sin(a),63.6*cos(a),8.5]) rotate([-79.3,0,a]) translate([0.1,0,6]) cylinder(h=52.5, d=6.75, $fn=200);
        translate([-63.6*sin(a),63.6*cos(a),19.3]) rotate([0,0,a]) translate([0.1,64.51,8]) cylinder(h=100, d=6.75, $fn=200);
        translate([-63.6*sin(a),63.6*cos(a),119.3]) rotate([0,90,a]) translate([-14.45,64.51,0.1]) rotate_extrude(angle=360, convexity=10, $fn=200) translate([6.38,0]) circle(6.75/2);
    }
    translate([-63.6*sin(90),63.6*cos(90),127.3]) rotate([-90,90,179.5]) translate([0,-64.1,-0.1]) cylinder(h=63, d=6.75, $fn=200);
    translate([-63.6*sin(90),63.6*cos(90),77.3]) rotate([-45,0,180]) translate([64.51,-0.2,0]) cylinder(h=70.5, d=6.75, $fn=200);
    translate([-127.3,-61.9,133.5]) rotate([0,90,135]) rotate_extrude(angle=360, convexity=10, $fn=200) translate([6.38,0]) circle(6.75/2);
    translate([-113.3,-75.9,133.5]) rotate([0,90,135]) rotate_extrude(angle=360, convexity=10, $fn=200) translate([6.38,0]) circle(6.75/2);
    difference(){
        translate([-113.3,-75.9,133.5]) rotate([0,90,135]) cylinder(h=20, d=6.75*2.888, $fn=200);
        translate([-111.3,-77.9,133.5]) rotate([0,90,135]) cylinder(h=26, d=6.75, $fn=200);
    }
    difference(){
        translate([-113.3,-75.9,133.5]) rotate([0,90,135]) cylinder(h=4, d=12, $fn=200);
        translate([-111.3,-77.9,133.5]) rotate([0,90,135]) cylinder(h=26, d=2, $fn=200);
    }
    translate([0,0,127.3]) rotate([0,0,90]) rotate_extrude(angle=90, convexity=10, $fn=200) translate([128.1,0]) circle(6.75/2);
    translate([0,0,77.6]) rotate([0,0,90]) rotate_extrude(angle=90, convexity=10, $fn=200) translate([128.1,0]) circle(6.75/2);
    translate([0,0,147]) difference(){
        a=68;
        xy=129;
        translate([-xy*sin(a),xy*cos(a),-4]) rotate([-90,0,a]) linear_extrude(height=23) translate([-38,0,0]) polygon([[0,1],[26,72],[28,73],[48,73],[50,72],[76,1]]);
        translate([-xy*sin(a)-2,xy*cos(a)+2,10]) rotate([-90,0,a]) linear_extrude(height=16) translate([-38,0,0]) polygon([[3,0],[28,70],[48,70],[73,0]]);
    }
    translate([0,0,147]) difference(){
        a=22;
        xy=140.5;
        translate([0,7.5,-23.9]) union(){
            translate([-xy*sin(a),xy*cos(a),-8]) cylinder(h=28, d1=14, d2=40, $fn=200);
            translate([-xy*sin(a),xy*cos(a),-16.5]) rotate([0,0,a]) cube([73,14,73], center=true);
            translate([-xy*sin(a)+40.245,xy*cos(a)+16.26,-16.5]) rotate([0,0,a]) cube([14,14,73], center=true);
            translate([-xy*sin(a)+30,xy*cos(a)+10,-45.5]) rotate([-270,0,a]) cylinder(h=22, d=6.75, $fn=200);
            translate([-xy*sin(a)-30,xy*cos(a)-10,-45.5]) rotate([-270,0,a]) cylinder(h=24.5, d=6.75, $fn=200);
            translate([-xy*sin(a)+30,xy*cos(a)+10,4.2]) rotate([-270,0,a]) cylinder(h=22, d=6.75, $fn=200);
            translate([-xy*sin(a)-30,xy*cos(a)-10,4.2]) rotate([-270,0,a]) cylinder(h=24.5, d=6.75, $fn=200);
            translate([-xy*sin(a)+30,xy*cos(a)+10,-45.5]) rotate([23.95,0,a]) cylinder(h=54.5, d=6.75, $fn=200);
            translate([-xy*sin(a)-28.75,xy*cos(a)-13.75,-45.5]) rotate([22.55,0,a]) cylinder(h=54.5, d=6.75, $fn=200);
            translate([-xy*sin(a)+30,xy*cos(a)+10,4.2]) rotate([-23.95-180,0,a]) cylinder(h=54.5, d=6.75, $fn=200);
            translate([-xy*sin(a)-28.75,xy*cos(a)-13.75,4.2]) rotate([-22.55-180,0,a]) cylinder(h=54.5, d=6.75, $fn=200);
        }
        translate([-xy*sin(a),xy*cos(a)+7.5,-39.5]) rotate([0,0,a]) cube([67,8,75], center=true);
        translate([-xy*sin(a),xy*cos(a)+7.5,-33.8]) cylinder(h=30, d1=8, d2=34, $fn=200);
        translate([-xy*sin(a)+38.75,xy*cos(a)+23,-36.4]) rotate([0,0,a]) cube([14,10,75], center=true);
    }
}
translate([0,0,25]) plate_cage();
translate([0,0,25]) rotate([0,0,90]) plate_cage();
translate([0,0,25]) rotate([0,0,180]) plate_cage();
translate([0,0,25]) rotate([0,0,270]) plate_cage();
translate([0,0,120]) mirror([0,0,1]) bignut();
translate([0,0,25]) plate();
translate([0,0,1]) rotate([0,0,45]) ground();
ground_cage();
translate([57,0,28.5]) rotate([0,90,0]) wheel();
translate([57*sin(45),57*sin(45),30]) rotate([0,90,45]) wheel();
translate([0,57*sin(90),30]) rotate([0,90,90]) wheel();
translate([-57*sin(45),57*sin(45),30]) rotate([0,90,135]) wheel();
translate([-57,-57*sin(180),30]) rotate([0,90,180]) wheel();
translate([-57*sin(45),-57*sin(45),30]) rotate([0,90,225]) wheel();
translate([0,-57*sin(90),30]) rotate([0,90,270]) wheel();
translate([57*sin(45),-57*sin(45),30]) rotate([0,90,315]) wheel();
