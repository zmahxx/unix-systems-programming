# create.bash
#!/bin/bash

echo "Enter department code:"; read dept_code
echo "Enter department name:"; read dept_name
echo "Enter course number:"; read course_num
echo "Enter course name:"; read course_name
echo "Enter schedule (MWF/TH):"; read course_sched
echo "Enter start date:"; read course_start
echo "Enter end date:"; read course_end
echo "Enter credit hours:"; read course_hours
echo "Enter enrollment count:"; read course_size
course_file="data/${dept_code^^}$course_num.crs"
if [[ -e "$course_file" ]]; then echo "ERROR: course already exists"; exit 1; fi
echo -e "$dept_code $dept_name\n$course_name\n$course_sched $course_start $course_end\n$course_hours\n$course_size" > "$course_file"
echo "$(date) CREATED: $dept_code $course_num $course_name" >> "$log_file"
