(define (problem baker)
(:domain vincentland)
(:objects you slime forge baker ore fireball sword village spellbook field blacksmith guard troll forest pelt lumberjack shop wolf daughter king castle secret hammer wheat gel bakery cave merchant )
(:init (adjacent castle village)
(at daughter cave)
(at king field)
(at slime village)
(has field wheat)
(has castle spellbook)
(captive troll daughter)
(has blacksmith hammer)
(has wolf pelt)
(location cave)
(item ore)
(adjacent field cave)
(character merchant)
(monster wolf)
(character lumberjack)
(has king secret)
(location castle)
(character blacksmith)
(item sword)
(item pelt)
(character baker)
(item gel)
(has cave ore)
(at wolf village)
(at troll village)
(player you)
(at lumberjack village)
(= (total-cost) 0)
(character guard)
(location forge)
(weapon hammer)
(has troll hammer)
(monster troll)
(item spellbook)
(at you bakery)
(at guard shop)
(location shop)
(adjacent village forest)
(adjacent village field)
(character king)
(has spellbook fireball)
(adjacent village shop)
(location forest)
(information secret)
(cooperative baker)
(adjacent village forge)
(at merchant shop)
(location bakery)
(item hammer)
(location field)
(has slime gel)
(monster slime)
(at blacksmith forge)
(adjacent village bakery)
(weapon sword)
(character daughter)
(has you sword)
(location village)
(at baker bakery)
(information fireball)
(item wheat)
)
(:goal  (defended sword))
(:metric minimize (total-cost)))