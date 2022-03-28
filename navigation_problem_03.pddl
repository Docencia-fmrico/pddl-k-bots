(define (problem robots-nav-1)
    (:domain robots-nav)

    (:objects
        Room1 Room2 Room3 Room4 Room5 Room6 Room7 Room8 Room9 Room10 Room11 Room12 Room13 Room14 Room15 Room16- room 
        Zone1 Zone2 Zone3 Zone4 Zone5 Zone6 - zone
        Corridor1 Corridor2 Corridor3 Corridor4 Corridor5 Corridor6 Corridor7 Corridor8 Corridor9 Corridor10 Corridor11 Corridor12 Corridor13- corridor 
        kbot - robot
        Door1 Door2 Door3 Door4 Door5 Door6 Door7 Door8 Door9 Door10 Door11 Door12 Door13 Door14 - door
        DZ1 DZ2 DZ3 DZ4 DZ5 DZ6 DZ7 DZ8 DZ9 DZ10 DZ11 DZ12 DZ13 DZ14 - zone
        Elevator1 Elevator2 Elevator3 - elevator
        Gripper1 - gripper
        Object1 Object2 - object
    )

    (:init
        (robot_at kbot Room5)
        (gripper_at Gripper1 kbot)
        (gripper_free Gripper1)


        (object_at Object1 Zone1)
        (object_at Object2 Room8)

        ;;;;;;;;;;;;;;;;;;;;;;;;;;
        ;;      First floor     ;;
        ;;;;;;;;;;;;;;;;;;;;;;;;;;

        ;--Corridor1--
        (connected Corridor1 Room5)
        (connected Room5 Corridor1)
        (connected Corridor1 Corridor3)
        (connected Corridor3 Corridor1)
        
        ;--Corridor2--
        (connected Corridor2 Room5)
        (connected Room5 Corridor2)
        (connected Corridor2 Corridor3)
        (connected Corridor3 Corridor2)

        ;--Corridor3--
        ;--Room1
        (connected Corridor3 DZ1)
        (connected DZ1 Corridor3)
        (connected_through DZ1 Room1 Door1)
        (connected_through Room1 DZ1 Door1)

        ;--Room2
        (connected Corridor3 DZ2)
        (connected DZ2 Corridor3)
        (connected_through DZ2 Room2 Door2)
        (connected_through Room2 DZ2 Door2)

        ;--Room3
        (connected Corridor3 DZ3)
        (connected DZ3 Corridor3)
        (connected_through DZ3 Room3 Door3)
        (connected_through Room3 DZ3 Door3)

        ;--Elevator1
        (connected_elevator Corridor3 Elevator1)

        ;--Corridor4--
        (connected Corridor4 Room5)
        (connected Room5 Corridor4)
        
        ;--Room4
        (connected Corridor4 DZ4)
        (connected DZ4 Corridor4)
        (connected_through DZ4 Room4 Door4)
        (connected_through Room4 DZ4 Door4)
        
        ;--Elevator3
        (connected_elevator Corridor4 Elevator3)

        ;--Corridor5--
        ;--Room5
        (connected Corridor5 DZ5)
        (connected DZ5 Corridor5)
        (connected_through DZ5 Room5 Door5)
        (connected_through Room5 DZ5 Door5)

        ;--Room6
        (connected Corridor5 DZ6)
        (connected DZ6 Corridor5)
        (connected_through DZ6 Room6 Door6)
        (connected_through Room6 DZ6 Door6)

        ;--Room7
        (connected Corridor5 Room7)
        (connected Room7 Corridor5)
        
        ;;;;;;;;;;;;;;;;;;;;;;;;;;
        ;;     Second floor     ;;
        ;;;;;;;;;;;;;;;;;;;;;;;;;;

        ;--Corridor6 and Corridor 7--
        (connected_elevator Corridor6 Elevator1)
        (connected_elevator Corridor7 Elevator2)

        (connected Corridor6 Corridor7 Door11)
        (connected Corridor7 Corridor6 Door11)

        (connected Corridor6 Corridor8)
        (connected Corridor8 Corridor6)

        (connected Corridor7 Corridor10)
        (connected Corridor10 Corridor7)

        ;--Corridor8--
        (connected Corridor8 Corridor9)
        (connected Corridor8 Room12)
        (connected Room12 Corridor8)

        ;--Corridor9--
        (connected Corridor9 Corridor8)
        (connected Corridor9 Corridor10)
        
        (connected Corridor9 Room10 Door10)
        (connected Room10 Corridor9 Door10)

        ;--Corridor10--
        (connected Corridor10 Corridor9)
        (connected Corridor10 Room11)
        (connected Room11 Corridor10)

        ;--Room8 and Room9--
        (connected Room8 ZD8)
        (connected ZD8 Room8)
        (connected_through ZD8 Corridor8 Door8)
        (connected_through Corridor8 ZD8 Door8)

        (connected Room9 ZD9)
        (connected ZD9 Room9)
        (connected_through ZD9 Corridor10 Door9)
        (connected_through Corridor10 ZD9 Door9)

        (connected_through Room8 Room9 Door7)
        (connected_through Room9 Room8 Door7)

        


        ; Zones
        ; -- Room2
        (connected Room2 Zone1)
        (connected Zone1 Room2)
        (connected Room2 Zone2)
        (connected Zone2 Room2)
        ; -- Room11
        (connected Room11 Zone3)
        (connected Zone3 Room11)
        ; -- Room12
        (connected Room12 Zone4)
        (connected Zone4 Room12)
        ; -- Room8
        (connected Room8 Zone5)
        (connected Zone5 Room8)
        (connected Room8 Zone6)
        (connected Zone6 Room8)
        (connected Room8 Zone7)
        (connected Zone7 Room8)
        ; -- Room7
        (connected Room7 Zone3)
        (connected Zone8 Room8)

        ; Corridors with door-zones
        ; -- Corridor1 
        (connected DZ1 Corridor1)
        (connected Corridor1 DZ1)
        (connected DZ2 Corridor1)
        (connected Corridor1 DZ2)
        (connected DZ3 Corridor1)
        (connected Corridor1 DZ3)
        ; -- Corridor2
        (connected DZ4 Corridor2)
        (connected Corridor2 DZ4)
        (connected DZ5 Corridor2)
        (connected Corridor2 DZ5)
        (connected DZ12 Corridor2)
        (connected Corridor2 DZ12)
        ; -- Corridor3
        (connected DZ6 Corridor3)
        (connected Corridor3 DZ6)
        (connected DZ7 Corridor3)
        (connected Corridor3 DZ7)
        (connected DZ8 Corridor3)
        (connected Corridor3 DZ8)
        ; -- Corridor4
        (connected DZ9 Corridor4)
        (connected Corridor4 DZ9)
        (connected DZ10 Corridor4)
        (connected Corridor4 DZ10)
        (connected DZ11 Corridor4)
        (connected Corridor4 DZ11)

        ; between corridors 
        (connected Corridor1 Corridor2)
        (connected Corridor2 Corridor1)
        (connected Corridor2 Corridor3)
        (connected Corridor3 Corridor2)
        (connected Corridor3 Corridor4)
        (connected Corridor4 Corridor3)
        (connected Corridor4 Corridor1)
        (connected Corridor1 Corridor4)

        ;;;;;;;;;;;;;;;;;;;;;;;;;;
        ;;      Second floor    ;;
        ;;;;;;;;;;;;;;;;;;;;;;;;;;

        ; between rooms
        (connected Room13 DZ13)
        (connected DZ13 Room13)
        (connected_through DZ13 Room14 Door13)
        (connected_through Room14 DZ13 Door13)

        ; rooms with corridors
        (connected Corridor6 Room13)
        (connected Room13 Corridor6)
        (connected Corridor7 Room14)
        (connected Room14 Corridor7)

        ; zones
        (connected Room14 Zone9)
        (connected Zone9 Room14)
        (connected Room14 Zone10)
        (connected Zone10 Room14)

        ;;;;;;;;;;;;;;;;;;;;;;;;;;
        ;;       Elevator       ;;
        ;;;;;;;;;;;;;;;;;;;;;;;;;;

        ; elevator1
        (connected_elevator Corridor4 Elevator1)
        (connected_elevator Corridor6 Elevator1)

        ; elevator2
        (connected_elevator Corridor2 Elevator2)
        (connected_elevator Corridor7 Elevator2)

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
        (door_closed Door8)
        (door_closed Door9)
        (door_closed Door10)
        (door_closed Door11)
        (door_closed Door12)
        (door_closed Door13)
    )

    (:goal
        (and
            (object_at Object1 Room1)
            (object_at Object2 Room5)
        )
    )

)