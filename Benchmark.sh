#!/bin/bash

#!/bin/bash

queues=("CoarseSet" "FineSet" "LazySet" "LockFreeSet" "OptimisticSet")

threads=(4 8 12 16 20 24 32 40)

readPercentage=(20 40 60 80)
for queue in "${queues[@]}"; do
    for thread in "${threads[@]}"; do
        for percentage in "${readPercentage[@]}"; do
            echo "$queue for $thread threads with $percentage% read operation"
            contains_decimal=$(echo "scale=2; $readPercentage" | bc)
            java -cp build/libs/homework5.jar edu.vt.ece.hw5.Benchmark "$queue" "$thread" "$contains_decimal"
        done
    done
done


