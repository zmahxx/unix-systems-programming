# assign3B.awk
BEGIN {
    # Month abbreviation to numeric conversion
    split("Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec", m)
    for (i = 1; i <= 12; i++) {
        mon[m[i]] = sprintf("%02d", i)
    }
}

# Match usernames in abc123 format, skip header
NR > 1 && $1 ~ /^[a-z]{3}[0-9]{3}$/ {
    uid = $1
    stime = $5

    # Combine the full command field
    cmd = $8
    for (i = 9; i <= NF; i++) {
        cmd = cmd " " $i
    }

    # Group commands per user
    cmds[uid][++cmds_count[uid]] = cmd
    users[uid] = 1

    # Normalize STIME to sortable value
    if (stime ~ /^[A-Z]/) {
        mmdd = mon[substr(stime, 1, 3)] sprintf("%02d", substr(stime, 4))
        sortkey = "0" mmdd   # earlier than any "HHMM"
    } else {
        split(stime, t, ":")
        sortkey = "1" sprintf("%02d%02d", t[1], t[2])
    }

    # Store for earliest/latest comparison
    times[uid, sortkey] = $0

    # Track lowest and highest seen times
    if (!min_time || sortkey < min_time || (sortkey == min_time && uid < min_uid)) {
        min_time = sortkey
        min_uid = uid
    }

    if (!max_time || sortkey > max_time || (sortkey == max_time && uid < max_uid)) {
        max_time = sortkey
        max_uid = uid
    }
}

END {
    # Output commands by user
    n = asorti(users, sorted_users)
    for (i = 1; i <= n; i++) {
        u = sorted_users[i]
        print "User:", u
        for (j = 1; j <= cmds_count[u]; j++) {
            print "\t" cmds[u][j]  # <-- Indented output
        }
    }

    print ""
    print "Earliest Start Time:"
    print times[min_uid, min_time]

    print ""
    print "Latest Start Time:"
    print times[max_uid, max_time]
}

