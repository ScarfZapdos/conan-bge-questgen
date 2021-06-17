(define (domain bge)
    (:requirements :action-costs :typing :fluents)
    (:types animal monster character - living
      photo weapon artifact - item
      wallet
      information
      player
      location
      character item - target)
    (:predicates
        (defended ?c)
        (sneaky ?c)
        (cooperative ?c)
        (has ?clm ?i)
        (at ?c ?l)
        (experimented ?i)
        (captive ?captor ?captive)
        (explored ?l)
        (used ?i)
        (wants ?c ?i)
        (dead ?c)
        (damaged ?i)
        (adjacent ?la ?lb)
        (friend ?c1 ?c2)
        )

    (:functions
        (total-cost)
        (money ?w - wallet))

    (:action buy
      :parameters (?p - player ?c - character ?l - location ?w1 ?w2 - wallet ?i - item)
      :precondition (and (at ?p ?l) (at ?c ?l) (not (dead ?c)) (has ?c ?i) (>= (money ?w1) 1) (has ?p ?w1) (has ?c ?w2))
      :effect (and (has ?p ?i) (not (has ?c ?i)) (decrease (money ?w1) 1) (increase (money ?w2) 1) (increase (total-cost) 2)))

    (:action capture ; capture a living
        :parameters (?p - player ?char - living ?loc - location)
        :precondition (and (at ?p ?loc) (at ?char ?loc) (not (dead ?char)))
        :effect (and (captive ?p ?char) (increase (total-cost) 1)))

    (:action damage ; damage an item
        :parameters (?p - player ?i - item ?w - weapon)
        :precondition (and (has ?p ?i) (has ?p ?w))
        :effect (and (damaged ?i) (increase (total-cost) 2)))

    (:action defend
        :parameters (?p - player ?todefend - target ?loc - location)
        :precondition (and (at ?p ?loc) (not (dead ?todefend))
                      (or (at ?todefend ?loc)
                          (has ?loc ?todefend)))
        :effect (and (defended ?todefend) (increase (total-cost) 2)))

    (:action escort
        :parameters (?p - player ?charA - character ?locA ?locB - location)
        :precondition (and  (at ?p ?locA) (at ?charA ?locA) (adjacent ?locA ?locB) (cooperative ?charA) (not (dead ?charA)))
        :effect (and (at ?p ?locB) (at ?charA ?locB) (not (at ?p ?locA)) (not (at ?charA ?locA)) (increase (total-cost) 4)))

    (:action exchange
        :parameters (?p - player ?char - character ?i2 ?i1 - item ?loc - location)
        :precondition (and (not (dead ?char)) (has ?p ?i1) (has ?char ?i2) (at ?p ?loc) (at ?char ?loc))
        :effect (and (not (has ?p ?i1)) (has ?p ?i2) (not (has ?char ?i2)) (has ?char ?i1) (increase (total-cost) 1)))

    (:action explore
        :parameters (?p - player ?locA ?locB - location)
        :precondition (and (at ?p ?locA) (adjacent ?locA ?locB))
        :effect (and (explored ?locB) (not (at ?p ?locA)) (at ?p ?locB) (increase (total-cost) 3)))

    (:action getfromlocation
        :parameters (?p - player ?loc - location ?i - item)
        :precondition (and (has ?loc ?i) (at ?p ?loc))
        :effect (and (has ?p ?i) (not (has ?loc ?i)) (increase (total-cost) 1)))

    (:action giveto
        :parameters (?p - player ?charB - character ?i - item ?loc - location)
        :precondition (and (not (dead ?charB)) (has ?p ?i) (at ?charB ?loc) (at ?p ?loc))
        :effect (and (has ?charB ?i) (not (has ?p ?i)) (cooperative ?charB) (increase (total-cost) 2)))

    (:action move
        :parameters (?p - player ?to ?from - location)
        :precondition (and (explored ?to) (adjacent ?to ?from) (at ?p ?from))
        :effect (and (at ?p ?to) (not (at ?p ?from)) (increase (total-cost) 1)))

    (:action kill
        :parameters (?p - player ?charA - living ?loc - location ?w - weapon)
        :precondition (and (not (dead ?charA)) (not (damaged ?w)) (at ?charA ?loc) (at ?p ?loc) (has ?p ?w))
        :effect (and (dead ?charA) (increase (total-cost) 2)))

    (:action killforitem
        :parameters (?p - player ?charA - living ?i - item ?loc - location ?w - weapon)
        :precondition (and (not (dead ?charA)) (not (damaged ?w)) (at ?charA ?loc) (at ?p ?loc) (has ?charA ?i) (has ?p ?w))
        :effect (and (has ?loc ?i) (dead ?charA) (increase (total-cost) 3)))

    (:action killforinfo
        :parameters (?p - player ?charA - monster ?info - information ?loc - location ?w - weapon)
        :precondition (and (not (dead ?charA)) (not (damaged ?w)) (at ?charA ?loc) (at ?p ?loc) (has ?charA ?info) (has ?p ?w))
        :effect (and (has ?p ?info) (dead ?charA) (increase (total-cost) 3)))

    (:action listen
        :parameters (?p - player ?char - character ?loc - location ?info - information)
        :precondition (and (not (dead ?char)) (at ?p ?loc) (at ?char ?loc) (has ?char ?info))
        :effect (and (has ?p ?info) (increase (total-cost) 2)))

    (:action read
        :parameters (?p - player ?loc - location ?i - item ?info - information)
        :precondition (and (at ?p ?loc) (has ?loc ?i) (has ?i ?info))
        :effect (and (has ?p ?info) (increase (total-cost) 2)))

    (:action repair
        :parameters (?p - player ?loc - location ?i - item)
        :precondition (and (damaged ?i) (or (and (at ?p ?loc) (has ?loc ?i))) (has ?p ?i))
        :effect (and (not (damaged ?i)) (increase (total-cost) 2)))


    (:action report
        :parameters (?p - player ?char - character ?info - information ?loc - location)
        :precondition (and (not (dead ?char)) (at ?p ?loc) (at ?char ?loc) (has ?p ?info))
        :effect (and (has ?char ?info) (increase (total-cost) 2)))

    (:action sell
        :parameters (?p - player ?c - character ?l - location ?w1 ?w2 - wallet ?i - item)
        :precondition (and (at ?p ?l) (at ?c ?l) (not (dead ?c)) (has ?p ?i) (>= (money ?w2) 1) (has ?p ?w1) (has ?c ?w2))
        :effect (and (has ?c ?i) (not (has ?p ?i)) (decrease (money ?w2) 1) (increase (money ?w1) 1) (increase (total-cost) 2)))

    (:action spy
        :parameters (?p - player ?char - character ?loc - location ?info - information)
        :precondition (and (at ?p ?loc) (not (dead ?char)) (at ?char ?loc) (sneaky ?p) (has ?char ?info))
        :effect (and (has ?p ?info) (increase (total-cost) 1)))


    (:action stealth
        :parameters (?p - player)
        :precondition (not (sneaky ?p))
        :effect (and (sneaky ?p) (increase (total-cost) 2)))


    (:action take
        :parameters (?p - player ?char - living ?i2 - item ?loc - location)
        :precondition (and (has ?char ?i2) (at ?p ?loc) (at ?char ?loc) (cooperative ?char))
        :effect (and (has ?p ?i2) (not (has ?char ?i2)) (increase (total-cost) 2)))

    (:action use
        :parameters (?p - player ?i - item)
        :precondition (has ?p ?i)
        :effect (and (used ?i) (increase (total-cost) 1)))

)
