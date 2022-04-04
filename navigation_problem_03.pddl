(define (problem robots-nav-1)
    (:domain robots-nav)

    (:objects
        Room1 Room2 Room3 Room4 Room5 Room6 Room7 Room8 Room9 Room10 Room11 Room12 Room13 Room14 Room15 Room16 - room 
        Zone1 Zone2 Zone3 Zone4 Zone5 Zone6 - zone
        Corridor1 Corridor2 Corridor3 Corridor4 Corridor5 Corridor6 Corridor7 Corridor8 Corridor9 Corridor10 Corridor11 Corridor12 Corridor13 - corridor 
        kbot - robot
        Door1 Door2 Door3 Door4 Door5 Door6 Door7 Door8 Door9 Door10 Door11 Door12 Door13 Door14 Door15 Door16 Door17 - door
        
        DZ1 DZ2 DZ3 DZ4 DZ5 DZ6 DZ7 DZ8 DZ9 DZ10 DZ11 DZ12 DZ13 DZ14 DZ15 DZ16 DZ17 - zone
        DZ12A DZ12B DZ13A DZ13B DZ14A DZ14B DZ15A DZ15B DZ16A DZ16B DZ17A DZ17B - zone

        Elevator1 Elevator2 Elevator3 - elevator
        Gripper1 Gripper2 - gripper
        Object1 Object2 - object
    )

    (:init
        (robot_at kbot Zone1)
        
        (gripper_at Gripper1 kbot)
        (gripper_free Gripper1)
        (gripper_at Gripper2 kbot)
        (gripper_free Gripper2)

        (object_at Object1 Zone1)
        (object_at Object2 Room9)

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

        (connected_through Corridor6 Corridor7 Door11)
        (connected_through Corridor7 Corridor6 Door11)

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
        
        (connected_through Corridor9 Room10 Door10)
        (connected_through Room10 Corridor9 Door10)

        ;--Corridor10--
        (connected Corridor10 Corridor9)
        (connected Corridor10 Room11)
        (connected Room11 Corridor10)

        ;--Room8 and Room9--
        (connected Room8 DZ8)
        (connected DZ8 Room8)
        (connected_through DZ8 Corridor8 Door8)
        (connected_through Corridor8 DZ8 Door8)

        (connected Room9 DZ9)
        (connected DZ9 Room9)
        (connected_through DZ9 Corridor10 Door9)
        (connected_through Corridor10 DZ9 Door9)

        (connected_through Room8 Room9 Door7)
        (connected_through Room9 Room8 Door7)

        ;;;;;;;;;;;;;;;;;;;;;;;;;;
        ;;     Third  floor     ;;
        ;;;;;;;;;;;;;;;;;;;;;;;;;;

        (connected_elevator Corridor11 Elevator2)
        (connected_elevator Corridor13 Elevator3)
        
        ; Room14
        (connected Corridor11 Room14)
        (connected Room14 Corridor11)
        
        ;--Door12
        
        (connected Corridor11 DZ12A)
        (connected DZ12A Corridor11)

        (connected Room13 DZ12B)
        (connected DZ12B Room13)

        (connected_through DZ12A DZ12B Door12)
        (connected_through DZ12B DZ12A Door12)

        ;--Door15
        (connected Corridor11 DZ15A)
        (connected DZ15A Corridor11)
        (connected Corridor12 DZ15B)
        (connected DZ15B Corridor12)

        (connected_through DZ15A DZ15B Door15)
        (connected_through DZ15B DZ15A Door15)

        ;--Door16
        (connected Corridor12 DZ16A)
        (connected DZ16A Corridor12)
        (connected Room16 DZ16B)
        (connected DZ16B Room16)

        (connected_through DZ16A DZ16B Door16)
        (connected_through DZ16B DZ16A Door16)

        ;--Door17
        (connected Corridor12 DZ17A)
        (connected DZ17A Corridor12)
        (connected Corridor13 DZ17B)
        (connected DZ17B Corridor13)

        (connected_through DZ17A DZ17B Door17)
        (connected_through DZ17B DZ17A Door17)

        ;--Door14
        (connected Corridor13 DZ14A)
        (connected DZ14A Corridor13)
        (connected Room15 DZ14B)
        (connected DZ14B Room15)

        (connected_through DZ14A DZ14B Door17)
        (connected_through DZ14B DZ14A Door17)

        (connected Room15 Room14)
        (connected Room14 Room15)

        ;--Door13
        (connected Room13 DZ13A)
        (connected DZ13A Room13)
        (connected Room16 DZ13B)
        (connected DZ13B Room16)

        (connected_through DZ13A DZ13B Door13)
        (connected_through DZ13B DZ13A Door13)


        ;;;;;;;;;;;;;;;;;;;;;;;;;;
        ;;     Room   Zones     ;;
        ;;;;;;;;;;;;;;;;;;;;;;;;;;

        (connected Zone1 Room1)
        (connected Room1 Zone1)
        (connected Zone2 Room1)
        (connected Room1 Zone2)

        (connected Zone3 Room5)
        (connected Room5 Zone3)
        (connected Zone4 Room5)
        (connected Room5 Zone4)

        (connected Zone5 Room16)
        (connected Room16 Zone5)
        (connected Zone6 Room15)
        (connected Room15 Zone6)
        
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
        (door_closed Door14)
        (door_closed Door15)
        (door_closed Door16)
        (door_closed Door17)
        
    )

    (:goal
        (and
            (object_at Object1 Room11)
            (object_at Object2 Room16)
            (robot_at kbot Room5)
        )
    )

)