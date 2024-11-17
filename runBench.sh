#!/bin/bash
set_types=("CoarseSet" "FineSet" "LazySet" "LockFreeSet" "OptimisticSet")
thread_counts=(4 8 12 16 20 24 32 40)
contains_percentages=(20 40 60 80)
for set_type in "${set_types[@]}"; do
    for thread_count in "${thread_counts[@]}"; do
        for contains_percentage in "${contains_percentages[@]}"; do
            echo "$set_type on $thread_count threads with $contains_percentage% reads"
            contains_decimal=$(echo "scale=2; $contains_percentage" | bc)
            java -cp build/libs/homework5.jar edu.vt.ece.hw5.Benchmark "$set_type" "$thread_count" "$contains_decimal"
            
            echo -n ""
        done
    done
done

echo "Finished."
