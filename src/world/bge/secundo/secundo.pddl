(define (problem secundo)
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
(:init (has spiriteater pearl4)
(adjacent lighthouse lagoon)
(has jade daijo)
(adjacent city pedestrian)
(has imperator pearl3)
(has you daijo2)
(at peyj lighthouse)
(at doubleh factory)
(at generalkehck city)
(at you lighthouse)
(adjacent city lagoon2)
(at secundo lighthouse)
(captive reaper doubleh)
(has mingtzu starkos)
(has mingtzu kbups)
(has issam pod)
(has peyj peyjmdisk)
(at mingtzu mingtzushop)
(at greenspider factory)
(friend jade peyj)
(has doubleh circlekey)
(at pterolimax blackisle)
(= (total-cost) 0)
(has doubleh conspiracy)
(at jade lighthouse)
(at albinorat pedestrian)
(at seagull lagoon)
(adjacent lagoon selene)
(at issam mammago)
(friend jade secundo)
(at armadillo lighthouse)
(adjacent lagoon2 blackisle)
(adjacent mammago lagoon)
(has reaper gyrodisk)
(at hahn akuda)
(at vorax slaughterhouse)
(friend hahn doubleh)
(at imperator lagoon)
(has mingtzu pearl5)
(has reaper pearl2)
(adjacent lagoon2 slaughterhouse)
(at governor city)
(at spiriteater slaughterhouse)
(at highpriest selene)
(adjacent lagoon2 factory)
(adjacent pedestrian mingtzushop)
(has pterolimax pearl1)
(adjacent lagoon city)
(at aurorawhale lagoon2)
(at sarco blackisle)
(has spiriteater treasureloc)
(adjacent pedestrian akuda)
(at reaper factory)
)
(:goal (and (captive you peyj) (captive you hahn) (used pearl2)))
(:metric minimize (total-cost)))