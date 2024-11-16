#!/bin/bash

#!/bin/bash

queues=("CoarseSet" "FineSet" "LazySet" "LockFreeSet" "OptimisticSet")

threads=(4 8 12 16 20 24 32 40)

readPercentage=(20 40 60 80)
for set_type in "${queues[@]}"; do
    for thread_count in "${threads[@]}"; do
        for contains_percentage in "${readPercentage[@]}"; do
            echo "$set_type for $thread_count threads with $readPercentage% read operation"
            contains_decimal=$(echo "scale=2; $contains_percentage" | bc)
            java -cp build/libs/homework5.jar edu.vt.ece.hw5.Benchmark "$set_type" "$thread_count" "$contains_decimal"
        done
    done
done


