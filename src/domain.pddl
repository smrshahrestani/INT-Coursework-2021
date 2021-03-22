(define
    (domain dronedelivery)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        location parcel storm drone ; our types
    )

    (:predicates
        ;(drone-at ?a - location)
        (drone-at ?a - drone ?b - location) ;the drone is in a location
        (storm-at ?b - location) ;the storm is in a location
        (no-storm-at ?b - location) ;there is no storm in a location
        (has-parcel ?a - drone)  ; the parcel is with the drone
        ; (has-no-parcel ?a - drone)
        (at ?d - parcel ?b - location) ;the parcel is in a location
        (on ?d - parcel ?a - drone) ; the parcel is on a drone
        (can-land ?b - location);the location is clear for landing
        (drone-is-flying ?a - drone) ;a drone is flying
        ; (engine-is-on ?a - drone) ; instead of drone-is-flying

    )
    ;move the drone to a new location. right now it can teleport
    (:action change_location
        :parameters (?droneinit - drone ?locationinit - location ?locationfinal - location )
        :precondition (and
            (drone-is-flying ?droneinit)
            (drone-at ?droneinit ?locationinit)
            (not (storm-at ?locationfinal))
        )
        :effect (and
            (drone-at ?droneinit ?locationfinal)
            (not (drone-at ?droneinit ?locationinit))
        )
    )

    ; (:action land_and_pick_up_parcel
    ;     :parameters (?drone - drone ?p - parcel ?l - location)
    ;     :precondition (and
    ;         (drone-at ?drone ?l)
    ;         (at ?p ?l)
    ;         (not (has-parcel ?drone))
    ;         (can-land ?l)
    ;         (drone-is-flying ?drone)
    ;     )
    ;     :effect (and
    ;         (not (at ?p ?l))
    ;         (on ?p ?drone)
    ;         (not (can-land ?l))
    ;         (has-parcel ?drone)
    ;         (not (drone-is-flying ?drone))
    ;     )
    ; )

    (:action land
        :parameters (?drone - drone ?l - location)
        :precondition (and 
            (can-land ?l)
            (drone-is-flying ?drone)
            (drone-at ?drone ?l)
        )
        :effect (and )
    )

    (:action release
        :parameters (?drone - drone ?p - parcel)
        :precondition (and 
            
        )
        :effect (and )
    )

    (:action pickup
        :parameters (?drone - drone ?p - parcel)
        :precondition (and )
        :effect (and )
    )


    (:action take_off
        :parameters (?drone - drone ?l - location)
        :precondition (and
            (drone-at ?drone ?l)
            (has-parcel ?drone)
            (not (storm-at ?l))
            (not (drone-is-flying ?drone ))
        )
        :effect (and
            (can-land ?l)
            (drone-is-flying ?drone)

        )
    )
)