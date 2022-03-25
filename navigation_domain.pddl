(define (domain robots-nav)
    (:requirements :strips :equality :typing)

    (:types
        room zone corridor - location
        robot door
    )

    (:predicates
        (robot_at ?robot - robot ?loc - location)
        (connected ?from ?to - location)
        (connected_through ?from ?to - location ?door - door)
        (door_open ?door - door)
        (door_closed ?door - door)
    )

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

)