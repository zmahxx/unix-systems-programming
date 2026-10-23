# Replace <mname> with "City of Brook Haven, Connecticut"
s/<mname>/City of Brook Haven, Connecticut/g

# Replace <date> with the actual date (Handled in Bash script, but added here as a fallback)
s/<date>/03\/23\/2025/g

# Redact Driver’s License Numbers (Handles optional space before "DL" and number length)
s/[A-Z]\{2\}\s*DL\s*[0-9]\{6,8\}/DL <redacted>/g

# Redact Credit Card Numbers, preserving last 4 digits
s/4[0-9-]\{12,15\}\([0-9]\{4\}\)/VISA-\1/g
s/5[0-9-]\{12,15\}\([0-9]\{4\}\)/MC-\1/g
s/3[47][0-9-]\{11,14\}\([0-9]\{4\}\)/AMEX-\1/g
s/6[0-9-]\{12,15\}\([0-9]\{4\}\)/DISC-\1/g

# Redact Texas License Plates (Handles both formats)
s/TX\s*[A-Z0-9-]\{6,7\}/TX <redacted>/g

