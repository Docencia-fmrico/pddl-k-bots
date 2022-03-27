(define (problem robots-nav-1)
    (:domain robots-nav)

    (:objects
        Room1 Room2 Room3 Room4 Room5 Room6 Room7 Room8 Room9 - room
        Zone1 Zone2 Zone3 Zone4 Zone5 - zone
        Corridor1 Corridor2 Corridor3 - corridor
        kbot - robot
        Door1 Door2 Door3 Door4 Door5 Door6 Door7 - door
        DZ1 DZ2 DZ3 DZ4 DZ5 DZ6 DZ7 - zone 
        Elevator - elevator
        Gripper - gripper
        Object1 Object2 - object
    )

    (:init
        (robot_at kbot Room3)
        (object_at Object1 Room2)
        (object_at Object2 Room8)

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

        (connected_through Room1 DZ1 Door1)
        (connected DZ1 Corridor1)
        (connected Corridor1 DZ1)
        (connected_through DZ1 Room1 Door1)

        (connected Room1 Zone1)
        (connected Zone1 Room1)
        (connected Room1 Zone2)
        (connected Zone2 Room1)

        (connected_through Room3 DZ2 Door2)
        (connected DZ2 Room1)
        (connected Room1 DZ2)
        (connected_through DZ2 Room3 Door2)

        (door_closed Door1)
        (door_closed Door2)    
        (door_closed Door3)
        (door_closed Door4)      
        (door_closed Door5)    
        (door_closed Door6)
        (door_closed Door7) 

        (connected_elevator Corridor1 Elevator)
        (connected_elevator Corridor2 Elevator)

        (connected_through Room5 DZ4 Door4)
        (connected_through DZ4 Room5 Door4)
        (connected DZ4 Corridor2)
        (connected Corridor2 DZ4)

        (connected_through Room6 DZ3 Door3)
        (connected_through DZ3 Room6 Door3)
        (connected DZ3 Corridor2)
        (connected Corridor2 DZ3)

        (gripper_at Gripper kbot)
        (gripper_free Gripper)

        (connected Corridor2 Corridor3)
        (connected Corridor3 Corridor2)

        (connected_through Room7 DZ5 Door5)
        (connected_through DZ5 Room7 Door5)
        (connected DZ5 Corridor3)
        (connected Corridor3 DZ5)

        (connected_through Room9 DZ6 Door6)
        (connected_through DZ6 Room9 Door6)
        (connected DZ6 Corridor3)
        (connected Corridor3 DZ6)

        (connected_through Room8 DZ7 Door7)
        (connected_through DZ7 Room8 Door7)
        (connected DZ7 Corridor3)
        (connected Corridor3 DZ7)


    )

    (:goal
        (and
            (object_at Object1 Room1)
            (object_at Object2 Room5)
        )
    )

)