(define (domain testkit-delivery)
	
	(:requirements :typing :durative-actions)

	(:types bot testkit location)

	(:constants lab - location station - location)

	(:predicates
		(at-testkit  ?t - testkit, ?l - location)
        (at-bot ?b - bot, ?l - location)
        (in ?t - testkit, ?b - bot)
        (tested ?t - testkit)
        (done ?l - location)
        (botempty ?b - bot)
        (is-lab ?l - location)
        (is-station ?l - location)

	)
    (:functions 
        (time-to-arrive ?from ?to - location ?b - bot)
        (testing-time)
        (load-time)
        
    )

	(:durative-action LOAD
		:parameters (?b - bot ?t - testkit ?l - location)
		:duration (= ?duration (load-time))
		:condition (and (over all (at-bot ?b ?l))
						(at start (botempty ?b))
                        (at start (is-station ?l))
						(at start(at-testkit ?t ?l))
                        (at start(not(done ?l)))
                        (at start(not(tested ?t))))
		:effect (and (at start (in ?t ?b))
					 (at start (not (botempty ?b)))
					 (at end(not (at-testkit ?t ?l))))
	)
    (:durative-action UNLOAD
		:parameters (?b - bot ?t - testkit ?l - location)
        :duration (= ?duration (load-time))
		:condition (and (over all(at-bot ?b ?l))
						(at start(in ?t ?b))
                        (at start(not(is-lab ?l)))
                        (at start(not(done ?t)))
                        (at start(not(tested ?t))))
		:effect (and (at start(not(in ?t ?b)))
					 (at end(botempty ?b))
					 (at end(at-testkit ?t ?l)))
	)
    (:durative-action testing
        :parameters (?t - testkit ?l - location)
        :duration (= ?duration (testing-time))
        :condition (and 
            (at start (not(tested ?t)))
            (at start (not(done ?l)))
            (over all (at-testkit ?t ?l))
        )
        :effect (and 
            (at start (not(tested ?t)
            )
            (at end (tested ?t)
            )
            (at start (not(done ?l))
            )
            (at end (done ?t)
            )
        ))
    )
    
    (:durative-action PICKUP
		:parameters (?b - bot ?t - testkit ?l - location)
        :duration (= ?duration (load-time))
		:condition (and (over all (at-bot ?b ?l))
						(at start (botempty ?b))
						(at start(at-testkit ?t ?l))
                        (at start(done ?l))
                        (at start(tested ?t)))
		:effect (and (at start (in ?t ?b))
					 (at start (not (botempty ?b)))
					 (at end(not (at-testkit ?t ?l))))
	)
    (:durative-action DROPOFF
        :parameters (?b - bot ?t - testkit ?l - location)
        :duration (= ?duration (load-time))
		:condition (and (over all(at-bot ?b ?l))
                    (at start (is-lab ?l))
					(at start(in ?t ?b))
                    (at start(done ?l))
                    (at start(tested ?t)))
		:effect (and (at start(not(in ?t ?b)))
					 (at end(botempty ?b))
					 (at end(at-testkit ?t ?l)))
    )
    (:durative-action MOVE
		:parameters (?b - bot ?from ?to - location)
        :duration (= ?duration (time-to-arrive ?from ?to ?b))
		:condition (at start(at-bot ?b ?from))
		:effect (and (at end(at-bot ?b ?to))
					 (at start(not (at-bot ?b ?from))))
	)
    
    