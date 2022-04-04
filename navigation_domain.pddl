(define (domain robots-nav)
    (:requirements :strips :equality :typing :durative-actions)

    (:types
        room zone corridor - location
        gripper
        robot door elevator object
    )

    (:predicates
        (robot_at ?robot - robot ?loc - location)
        (robot_in ?robot - robot ?elevator - elevator)
        (connected ?from ?to - location)
        (connected_through ?from ?to - location ?door - door)
        (connected_elevator ?loc - location ?elevator - elevator)
        (door_open ?door - door)
        (door_closed ?door - door)
        (gripper_at ?gripper - gripper ?robot - robot)
        (gripper_free ?gripper - gripper)
        (object_at ?object - object ?loc - location)
        (robot_carry ?robot - robot ?object - object)
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
    (:durative-action move_through
        :parameters (?robot - robot ?from ?to - location ?door - door)
        :duration(= ?duration 3)
        :condition (and
            (at start (and
                (robot_at ?robot ?from)
                (door_open ?door)
            ))
            (over all 
                (connected_through ?from ?to ?door)
            )
            (at end 
                (door_closed ?door)
            )
        )
        :effect (and
            (at start (and
                (not (robot_at ?robot ?from))
                (robot_at ?robot ?to)
            )
        ))
    )

    (:action open_door
        :parameters (?robot - robot ?from ?to - location ?door - door ?gripper - gripper)
        :precondition (and
            (gripper_free ?gripper)
            (robot_at ?robot ?from)
            (connected_through ?from ?to ?door)
            (door_closed ?door)
        )
        :effect (and
            (door_open ?door)
            (not (door_closed ?door))
        )
    )

    (:action close_door
        :parameters (?robot - robot ?from ?at - location ?door - door ?gripper - gripper)
        :precondition (and
            (gripper_free ?gripper)
            (robot_at ?robot ?at)
            (connected_through ?from ?at ?door)
            (door_open ?door)
        )
        :effect (and
            (door_closed ?door)
            (not (door_open ?door))
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


    (:action pick_object
        :parameters (?robot - robot ?object - object ?loc - location ?gripper - gripper)
        :precondition 
            (and
                (gripper_at ?gripper ?robot)
                (gripper_free ?gripper)
                (object_at ?object ?loc)
                (robot_at ?robot ?loc) 
            )
        :effect 
            (and
                (not (gripper_free ?gripper))
                (robot_carry ?robot ?object) 
                (not (object_at ?object ?loc))
            )
    )

    (:action drop_object
        :parameters (?robot - robot ?object - object ?loc - location ?gripper - gripper)
        :precondition 
            (and 
                (gripper_at ?gripper ?robot)
                (robot_at ?robot ?loc) 
                (robot_carry ?robot ?object) 
            )
        :effect 
            (and
                (gripper_free ?gripper)
                (object_at ?object ?loc)
                (not (robot_carry ?robot ?object))
            )
    )
)