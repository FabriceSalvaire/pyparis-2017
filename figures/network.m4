.PS
cct_init

linewid = 0.6

[
  Point_(225) ; dot # Top
  {
    B1: ebox ; b_current; dlabel(dimen_*0.4, -0.1, i_1) dot
    B4: ebox(to rvec_(rp_len, 0)); b_current(, , , E); dlabel(dimen_*0.4, -0.1, , , i_4) dot # left
  }
  Point_(-45)
  B2: ebox ; b_current; dlabel(dimen_*0.4,  0.1, i_2) dot
  B7: ebox ; b_current; dlabel(dimen_*0.4,  0.1, i_7) dot # right
  B3: ebox(from B1.end to B2.end); b_current; dlabel(dimen_*0.4, 0.1, i_3)
    dot(at (B1.start, B7.end))
 { B5: ebox(to B1.end); b_current; dlabel(dimen_*0.4, -0.09, i_5) }
 { B6: ebox(to B2.end); b_current; dlabel(dimen_*0.4,  0.09, i_6) }
 { B8: ebox(right_ to B4.end); b_current; dlabel(dimen_*0.4,  0.1, i_8) }
 B9: ebox(left_ to B7.end); b_current; dlabel(dimen_*0.4, -0.1, i_9)
]

.PE
