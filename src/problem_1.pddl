(define
    (problem no_storm)
    (:domain dronedelivery)
    ;(:situation <situation_name>) ;deprecated
    (:objects 
        drone_a drone_b drone_c location_a location_b location_c location_d
        parcel_a parcel_b parcel_c 
    )
    (:init
        (at parcel_a location_a)
        (at parcel_b location_a)
        (at parcel_c location_a)
        
        (on parcel_a drone_a)
        (on parcel_b drone_b)
        (on parcel_c drone_c)

        (drone-at drone_a location_a)
        (drone-at drone_b location_a)
        (drone-at drone_c location_a)




    )
    (:goal (and
            (at parcel_a location_b)
            (at parcel_b location_c)
            (at parcel_c location_d)
            (drone-at drone_a location_a)
            (drone-at drone_b location_a)
            (drone-at drone_c location_a)
        )
    )
)