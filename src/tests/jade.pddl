(define (problem jade)
(:domain bge)
(:objects highpriest peyj governor hahn mingtzu issam doubleh jade generalkehck secundo - character
  you - player
  spiriteater pterolimax sarco imperator reaper - monster
  aurorawhale greenspider seagull albinorat armadillo vorax - animal
  selene lagoon lagoon2 mammago slaughterhouse lighthouse city pedestrian factory akuda mingtzushop blackisle - location
  peyjmdisk pod kbups circlekey starkos squarekey - artifact
  pearl2 pearl5 pearl4 pearl3 pearl1 - pearl
  daijo daijo2 gyrodisk - weapon
  treasureloc conspiracy - information)
(:init (friend hahn doubleh)
(has imperator pearl3)
(at spiriteater slaughterhouse)
(adjacent pedestrian akuda)
(at albinorat pedestrian)
(at seagull lagoon)
(has spiriteater treasureloc)
(adjacent lagoon2 slaughterhouse)
(has reaper gyrodisk)
(at you lighthouse)
(at generalkehck city)
(captive reaper doubleh)
(has issam pod)
(adjacent city lagoon2)
(adjacent city pedestrian)
(adjacent mammago lagoon)
(adjacent lagoon city)
(at vorax slaughterhouse)
(has peyj peyjmdisk)
(at doubleh factory)
(at imperator lagoon)
(at secundo lighthouse)
(adjacent pedestrian mingtzushop)
(has you daijo2)
(at pterolimax blackisle)
(has doubleh conspiracy)
(at highpriest selene)
(at hahn akuda)
(has mingtzu starkos)
(adjacent lighthouse lagoon)
(at armadillo lighthouse)
(has mingtzu kbups)
(at governor city)
(at greenspider factory)
(has spiriteater pearl4)
(at mingtzu mingtzushop)
(has jade daijo)
(adjacent lagoon selene)
(at peyj lighthouse)
(has doubleh circlekey)
(friend jade peyj)
(friend jade secundo)
(has pterolimax pearl1)
(at aurorawhale lagoon2)
(adjacent lagoon2 blackisle)
(has reaper pearl2)
(at sarco blackisle)
(at jade lighthouse)
(at reaper factory)
(= (total-cost) 0)
(has mingtzu pearl5)
(adjacent lagoon2 factory)
(at issam mammago)
)
(:goal (and (defended pearl2) (explored akuda) (has issam conspiracy)))
(:metric minimize (total-cost)))