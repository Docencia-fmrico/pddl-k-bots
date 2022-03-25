(define (problem robots-nav-1)
    (:domain robots-nav)

    (:objects
        Room1 Room2 Room3 Room4 - room
        Zone1 Zone2 Zone3 Zone4 Zone5 - zone
        Corridor1 - corridor
        kbot - robot
        Door1 Door2 - door
    )

    (:init
        (robot_at kbot Room3)

        (connected Room2 Corridor1)
        (connected Corridor1 Room2)
        (connected Room2 Room4)
        (connected Room4 Room2)

        (connected Room2 Zone3)
        (connected Zone3 Room2)
        (connected Room2 Zone4)
        (connected Zone4 Room2)
        (connected Room2 Zone5)
        (connected Zone5 Room2)

        (connected_through Room1 Corridor1 Door1)
        (connected_through Corridor1 Room1 Door1)

        (connected Room1 Zone1)
        (connected Zone1 Room1)
        (connected Room1 Zone2)
        (connected Zone2 Room1)

        (connected_through Room3 Room1 Door2)
        (connected_through Room1 Room3 Door2)

        (door_closed Door1)
        (door_closed Door2)        

    )

    (:goal
        (and
            (robot_at kbot Zone3)
        )
    )

)