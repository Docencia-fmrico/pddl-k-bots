(define (problem robots-nav-1)
    (:domain robots-nav)

    (:objects
        Room1 Room2 Room3 Room4 Room5 Room6 Room7 Room8 Room9 - room
        Zone1 Zone2 Zone3 Zone4 Zone5 - zone
        Corridor1 Corridor2 Corridor3 - corridor
        kbot - robot
        Door1 Door2 Door3 Door4 Door5 Door6 Door7 - door
        Elevator - elevator
        Gripper - gripper
        Object1 Object2 - object
    )

    (:init
        (robot_at kbot Room5)
        (gripper_at Gripper kbot)
        (gripper_free Gripper)

        (object_at Object1 Room7)
        (object_at Object2 Room8)


        ;;;;;;;;;;;;;;;;;;;;;;;;;;
        ;;      First floor     ;;
        ;;;;;;;;;;;;;;;;;;;;;;;;;;

        ; Room1, Room3
        (connected_through Room1 Corridor1 Door1)
        (connected_through Corridor1 Room1 Door1)
        (connected_through Room3 Room1 Door2)
        (connected_through Room1 Room3 Door2)

        ; Room2, Room4
        (connected Room2 Corridor1)
        (connected Corridor1 Room2)
        (connected Room2 Room4)
        (connected Room4 Room2)


        ;;;;;;;;;;;;;;;;;;;;;;;;;;
        ;;     Room   Zones     ;;
        ;;;;;;;;;;;;;;;;;;;;;;;;;;

        (connected Room1 Zone1)
        (connected Zone1 Room1)
        (connected Room1 Zone2)
        (connected Zone2 Room1)
        (connected Room2 Zone3)
        (connected Zone3 Room2)
        (connected Room2 Zone4)
        (connected Zone4 Room2)
        (connected Room2 Zone5)
        (connected Zone5 Room2)


        ;;;;;;;;;;;;;;;;;;;;;;;;;;
        ;;     Second floor     ;;
        ;;;;;;;;;;;;;;;;;;;;;;;;;;

        ; Rooms at Corridor2
        (connected_through Room5 Corridor2 Door4)
        (connected_through Corridor2 Room5 Door4)

        (connected_through Room6 Corridor2 Door3)
        (connected_through Corridor2 Room6 Door3)

        ; Rooms at Corridor3
        (connected_through Room7 Corridor3 Door5)
        (connected_through Corridor3 Room7 Door5)   
        (connected_through Room8 Corridor3 Door7)
        (connected_through Corridor3 Room8 Door7)
        (connected_through Room9 Corridor3 Door6)
        (connected_through Corridor3 Room9 Door6) 

        ; Corridors
        (connected Corridor2 Corridor3)
        (connected Corridor3 Corridor2)


        ;;;;;;;;;;;;;;;;;;;;;;;;;;
        ;;       Elevator       ;;
        ;;;;;;;;;;;;;;;;;;;;;;;;;;

        (connected_elevator Corridor1 Elevator)
        (connected_elevator Corridor2 Elevator)


        ;;;;;;;;;;;;;;;;;;;;;;;;;;
        ;;     Doors states     ;;
        ;;;;;;;;;;;;;;;;;;;;;;;;;;

        (door_closed Door1)
        (door_closed Door2)    
        (door_closed Door3)
        (door_closed Door4)      
        (door_closed Door5)    
        (door_closed Door6)
        (door_closed Door7) 
    )

    (:goal
        (and
            (object_at Object1 Room9)
            (object_at Object2 Room9)
        )
    )

)