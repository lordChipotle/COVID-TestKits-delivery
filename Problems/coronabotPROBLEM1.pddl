(define (problem nhs)
 
       (:domain coronabot)
 
       (:objects bot1 bot2 - bot
                         pack1 pack2 - facemask
                         warehouse house1 house2 - location
       )
 
       (:init
               (at-bot bot1 warehouse)
               (at-bot bot2 warehouse)
               (at-facemask pack1 warehouse)
               (at-facemask pack2 warehouse)
 
               (bot-empty bot1)
               (bot-empty bot2)
                               (=(juice bot1)10)
                               (=(juice bot2)10)
                               (=(battery)30)
               (= (move-time warehouse house1) 15)
              (= (move-time house1 warehouse) 15)
               (= (move-time warehouse house2) 10)
               (= (move-time house2 warehouse) 10)
               (= (move-time house1 house2) 15)
               (= (move-time house2 house1) 15)
                              
               (= (test-time)8)
               (is-warehouse warehouse)
               (not(to-warehouse bot1))
               (not(to-warehouse bot2))
 
               (testedP house1)
 
              
       )
 
       (:goal (and
 
               (at-bot bot1 warehouse)
               (at-bot bot2 warehouse)
               (tested house1)
               (tested house2)
               (received house1)
 
               )
       )
)
