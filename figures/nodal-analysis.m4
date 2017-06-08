.PS

cct_init

elen = 0.75
epsilon = 1e-3

Origin: Here
  source(up_ elen,I); llabel(,I_{s1},)
  line up epsilon then right elen*2/3; dot
Node1: "1" rjust above;
  {
    resistor(down_ elen); rlabel(,R_1,); dot; "0" rjust above;
    ground()
  }
  resistor(right_ elen); rlabel(,R_2,); dot
Node2: "2" ljust above;
  resistor(down_ elen); rlabel(,R_3,)
  line down epsilon then to Origin then up epsilon
  {
    move to Node1
    line up elen/2 then right epsilon
    reversed(`source', right_ elen,V); llabel(,V_{s1},)
    line right epsilon then down to Node2
  }

.PE
