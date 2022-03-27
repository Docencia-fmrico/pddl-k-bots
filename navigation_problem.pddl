(define (problem robots-nav-1)
    (:domain robots-nav)

    (:objects
        Room1 Room2 Room3 Room4 Room5 Room6 Room7 Room8 Room9 - room
        Zone1 Zone2 Zone3 Zone4 Zone5 - zone
        Corridor1 Corridor2 Corridor3 - corridor
        kbot - robot
        Door1 Door2 Door3 Door4 Door5 Door6 Door7 - door
        PrevDoor1 PrevDoor2 PrevDoor3 PrevDoor4 PrevDoor5 PrevDoor6 PrevDoor7 - zone 
        Elevator - elevator
        Gripper - gripper
        Object1 - object
    )

    (:init
        (robot_at kbot Room3)
        (object_at Object1 Room2)

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

        (connected_through Room1 PrevDoor1 Door1)
        (connected PrevDoor1 Corridor1)
        (connected Corridor1 PrevDoor1)
        (connected_through PrevDoor1 Room1 Door1)

        (connected Room1 Zone1)
        (connected Zone1 Room1)
        (connected Room1 Zone2)
        (connected Zone2 Room1)

        (connected_through Room3 PrevDoor2 Door2)
        (connected PrevDoor2 Room1)
        (connected Room1 PrevDoor2)
        (connected_through PrevDoor2 Room3 Door2)

        (door_closed Door1)
        (door_closed Door2)    
        (door_closed Door3)
        (door_closed Door4)      
        (door_closed Door5)    
        (door_closed Door6)
        (door_closed Door7) 

        (connected_elevator Corridor1 Elevator)
        (connected_elevator Corridor2 Elevator)

        (connected_through Room5 PrevDoor4 Door4)
        (connected_through PrevDoor4 Room5 Door4)
        (connected PrevDoor4 Corridor2)
        (connected Corridor2 PrevDoor4)

        (connected_through Room6 PrevDoor3 Door3)
        (connected_through PrevDoor3 Room6 Door3)
        (connected PrevDoor3 Corridor2)
        (connected Corridor2 PrevDoor3)

        (gripper_at Gripper kbot)
        (gripper_free Gripper)

        (connected Corridor2 Corridor3)
        (connected Corridor3 Corridor2)

        (connected_through Room7 PrevDoor5 Door5)
        (connected_through PrevDoor5 Room7 Door5)
        (connected PrevDoor5 Corridor3)
        (connected Corridor3 PrevDoor5)

        (connected_through Room9 PrevDoor6 Door6)
        (connected_through PrevDoor6 Room9 Door6)
        (connected PrevDoor6 Corridor3)
        (connected Corridor3 PrevDoor6)

        (connected_through Room8 PrevDoor7 Door7)
        (connected_through PrevDoor7 Room8 Door7)
        (connected PrevDoor7 Corridor3)
        (connected Corridor3 PrevDoor7)


    )

    (:goal
        (and
            (object_at Object1 Room5)
            (robot_at kbot Room7)
        )
    )

)