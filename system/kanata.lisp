
(defsrc
  esc 
  tab 
  caps
  ralt
  f
  h j k l 
  n g
  e d
)

(defalias
  tab-hm (tap-hold 75 150 tab (layer-while-held nav))
  esc-hm (tap-hold 75 150 esc lctl) 
  alt-os (one-shot 3000 lmet)
  f-hm (tap-hold 75 150 f (layer-while-held nav))
  e-hm (tap-hold 75 150 e lsft)
  j-hm (tap-hold 75 150 j lsft)
)

(deflayer base
  caps 
  @tab-hm
  @esc-hm
  @alt-os
  @f-hm
  _ @j-hm _ _ 
  g n
  d @e-hm
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

