(define
    (problem no_storm)
    (:domain dronedelivery)
    ;(:situation <situation_name>) ;deprecated
    (:objects 
        drone_a drone_b drone_c - drone 
        location_a location_b location_c location_d - location
        parcel_a parcel_b parcel_c - parcel
        storm_a - storm
    )
    (:init
        
        ;
        (clear-skies location_a)
        (storm-at location_b)
        (clear-skies location_c)
        (storm-at location_d)


        (at parcel_a location_a)
        (at parcel_b location_a)
        (at parcel_c location_a)
        
        (belongs-to parcel_a location_b)
        (belongs-to parcel_b location_c)
        (belongs-to parcel_c location_d)


        ; (on parcel_a drone_a)
        ; (on parcel_b drone_b)
        ; (on parcel_c drone_c)

        (drone-at drone_a location_a)
        (drone-at drone_b location_a)
        (drone-at drone_c location_a)

        ; (has-parcel drone_a parcel_a)
        ; (has-parcel drone_b parcel_b)
        ; (has-parcel drone_c parcel_c)
        
        (drone-landed drone_a)
        (drone-landed drone_b)
        (drone-landed drone_c)

        (drone-empty drone_a)
        (drone-empty drone_b)
        (drone-empty drone_c)


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