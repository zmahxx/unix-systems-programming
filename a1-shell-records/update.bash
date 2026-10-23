# update.bash
#!/bin/bash
echo "Enter department code and course number:"; read dept_code course_num
course_file="data/${dept_code^^}$course_num.crs"
if [[ ! -e "$course_file" ]]; then echo "ERROR: course not found"; exit 1; fi
echo "Enter new course name (leave blank to keep current):"; read new_name
if [[ -n "$new_name" ]]; then sed -i "2s/.*/$new_name/" "$course_file"; fi
echo "$(date) UPDATED: $dept_code $course_num" >> "$log_file"
