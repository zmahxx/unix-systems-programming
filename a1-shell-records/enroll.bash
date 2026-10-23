# enroll.bash
#!/bin/bash
echo "Enter department code and course number:"; read dept_code course_num
course_file="data/${dept_code^^}$course_num.crs"
if [[ ! -e "$course_file" ]]; then echo "ERROR: course not found"; exit 1; fi
echo "Enter enrollment change amount:"; read change_amt
current_enrollment=$(sed -n '5p' "$course_file")
new_enrollment=$((current_enrollment + change_amt))
sed -i "5s/.*/$new_enrollment/" "$course_file"
echo "$(date) ENROLLMENT: $dept_code $course_num changed by $change_amt" >> "$log_file"
