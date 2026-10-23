# delete.bash
#!/bin/bash
echo "Enter department code and course number:"; read dept_code course_num
course_file="data/${dept_code^^}$course_num.crs"
if [[ ! -e "$course_file" ]]; then echo "ERROR: course not found"; exit 1; fi
rm "$course_file"
echo "$(date) DELETED: $dept_code $course_num" >> "$log_file"

