(define (domain robots-nav)
    (:requirements :strips :equality :typing)

    (:types
        room zone corridor - location
        robot door elevator
    )

    (:predicates
        (robot_at ?robot - robot ?loc - location)
        (robot_in ?robot - robot ?elevator - elevator)
        (connected ?from ?to - location)
        (connected_through ?from ?to - location ?door - door)
        (connected_elevator ?loc - location ?elevator - elevator)
        (door_open ?door - door)
        (door_closed ?door - door)

    )

    ;Move between connected locations when there is not door;
    (:action move_directly
        :parameters (?robot - robot ?from ?to - location)
        :precondition (and
            (robot_at ?robot ?from)
            (connected ?from ?to)
        )
        :effect (and
            (robot_at ?robot ?to)
            (not (robot_at ?robot ?from))
        )
    )
    ;Move between connected locations when there is door;
    (:action move_through
        :parameters (?robot - robot ?from ?to - location ?door - door)
        :precondition (and
            (robot_at ?robot ?from)
            (connected_through ?from ?to ?door)
            (door_open ?door)
        )
        :effect (and
            (robot_at ?robot ?to)
            (not (robot_at ?robot ?from))
        )
    )

    (:action open_door
        :parameters (?robot - robot ?from ?to - location ?door - door)
        :precondition (and
            (robot_at ?robot ?from)
            (connected_through ?from ?to ?door)
            (door_closed ?door)
        )
        :effect (and
            (door_open ?door)
            (not (door_closed ?door))
        )
    )

    ;Take elevator;
    (:action take_elevator
        :parameters (?robot - robot ?from - location ?elevator - elevator)
        :precondition (and
            (robot_at ?robot ?from)
            (connected_elevator ?from ?elevator)

        )
        :effect (and
            (robot_in ?robot ?elevator)
            (not (robot_at ?robot ?from))

        )
    )

    (:action leave_elevator
        :parameters (?robot - robot ?elevator - elevator ?to - location)
        :precondition (and
            (robot_in ?robot ?elevator)
            (connected_elevator ?to ?elevator)

        )
        :effect (and
            (robot_at ?robot ?to)
            (not (robot_in ?robot ?elevator))

        )
    )

)