
(defsrc
  esc 
  tab 
  caps
  spc
  ralt
  h j k l 
  n g
  e d
)

(defalias
  tab-th (tap-hold 75 150 tab (layer-while-held nav))
  esc-th (tap-hold 75 150 esc lctl) 
  spc-th (tap-hold 75 150 spc lsft)
  alt-os (one-shot 3000 lmet)
)

(deflayer base
  caps 
  @tab-th
  @esc-th
  @spc-th
  @alt-os
  _ _ _ _ 
  g n
  d e
)

(deflayer nav
  _
  _
  _
  _
  _
  left down up right
  _ _
  _ _
)

