# total.bash
#!/bin/bash
total_courses=$(ls data/*.crs 2>/dev/null | wc -l)
echo "Total course records: $total_courses"
