
(defsrc
  esc 
  tab 
  caps
  h j k l 
  n g
  e d
)

(defalias
  tab-th (tap-hold 75 150 tab (layer-while-held nav))
  esc-th (tap-hold 75 150 esc lctl) 
)

(deflayer base
  caps 
  @tab-th
  @esc-th
  _ _ _ _ 
  g n
  d e
)

(deflayer nav
  _
  _
  _
  left down up right
  _ _
  _ _
)

