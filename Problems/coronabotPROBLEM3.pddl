(define (problem nhs)
 
       (:domain coronabot)
 
       (:objects bot1 bot2 - bot
                         pack1 pack2 - facemask
                         warehouse house1 house2 house3 house4 house5 - location
       )
 
   (:init
               (at-bot bot1 warehouse)
               (at-bot bot2 warehouse)
               (at-facemask pack1 warehouse)
               (at-facemask pack2 warehouse)
 
               (bot-empty bot1)
               (bot-empty bot2)
               (=(juice bot1)5)
               (=(juice bot2)5)
               (=(battery)30)
               (= (move-time warehouse house1) 5)
               (= (move-time house1 warehouse) 5)
               (= (move-time warehouse house2) 5)
               (= (move-time house2 warehouse) 5)
               (= (move-time warehouse house3) 5)
               (= (move-time house3 warehouse) 5)
               (= (move-time warehouse house4) 5)
               (= (move-time house4 warehouse) 5)
               (= (move-time warehouse house5) 5)
               (= (move-time house5 warehouse) 5)      
 
               (= (move-time house1 house2) 15)
               (= (move-time house2 house1) 15)
               (= (move-time house1 house3) 20)
               (= (move-time house3 house1) 20)
               (= (move-time house1 house4) 15)
               (= (move-time house4 house1) 15)
               (= (move-time house1 house5) 30)
               (= (move-time house5 house1) 30)
 
               (= (move-time house2 house3) 5)
               (= (move-time house3 house2) 5)
               (= (move-time house2 house4) 15)
               (= (move-time house4 house2) 15)
               (= (move-time house2 house5) 20)
               (= (move-time house5 house2) 20)
 
               (= (move-time house3 house4) 5)
               (= (move-time house4 house3) 5)
               (= (move-time house3 house5) 10)
               (= (move-time house5 house3) 10)
 
               (= (move-time house4 house5) 20)
               (= (move-time house5 house4) 20)
 
              
               (= (test-time)8)
               (is-warehouse warehouse)
               (not(to-warehouse bot1))
               (not(to-warehouse bot2))
 
               (testedP house1)
               (testedP house3)
 
              
      
   )
 
   (:goal (and
 
               (at-bot bot1 warehouse)
               (at-bot bot2 warehouse)
               (tested house1)
               (tested house2)
               (tested house3)
               (tested house4)
               (tested house5)
              
 
               )
       )
)
