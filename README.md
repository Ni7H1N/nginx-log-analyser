🧪 Nginx Log Analyser — Bash Shell Script Tool

A lightweight, efficient, and production-ready Nginx Access Log Analysis Tool written using pure Bash + awk + sort + uniq.
This project demonstrates real-world DevOps, Linux, Shell Scripting, and Log Analysis skills — essential for SRE, Cloud, Platform and Security Engineering roles.
It allows you to extract meaningful insights from large Nginx access logs directly from the command line.

📌 Features

• Top 5 IP addresses generating the most requests
• Top 5 requested URLs/paths
• Top 5 response status codes
• Top 5 user agents
• Supports both ./nginx-log-analyser.sh access.log and cat access.log | ./nginx-log-analyser.sh
• Works with large production Nginx logs
• Pure Bash — no external dependencies
• Clean, readable output formatting
• Beginner-friendly and production-ready

📁 Project Structure

nginx-log-analyser/
├── nginx-log-analyser.sh (Main analysis script)
├── sample.log (Sample log file for testing)
├── .gitignore (Ignored files)
└── README.md (Documentation file)

⚙️ Script Requirements

Works on any Linux/macOS system with:
bash, awk, sort, uniq, grep, head
No third-party packages needed.

🚀 Usage Instructions

Make the script executable:
chmod +x nginx-log-analyser.sh

Run with a file:
./nginx-log-analyser.sh sample.log

Or via stdin:
cat access.log | ./nginx-log-analyser.sh

📊 Example Output

Top 5 IP addresses with the most requests:
178.128.94.113 - 1087 requests
142.93.136.176 - 1087 requests
138.68.248.85 - 1087 requests
159.89.185.30 - 1086 requests
86.134.118.70 - 277 requests

Top 5 most requested paths:
/v1-health - 4560 requests
/ - 270 requests
/v1-me - 232 requests
/v1-list-workspaces - 127 requests
/v1-list-timezone-teams - 75 requests

Top 5 response status codes:
200 - 5740 requests
404 - 937 requests
304 - 621 requests
400 - 260 requests
403 - 23 requests

Top 5 user agents:
DigitalOcean Uptime Probe 0.22.0 - 4347 requests
Mozilla/5.0 (Windows NT 10.0...) - 513 requests
Mozilla/5.0 (Mac OS X 10_15_7...) - 332 requests
Custom-AsyncHttpClient - 294 requests
Mozilla/5.0 (Mac OS X 10_15_7...) - 282 requests

🧠 How It Works (Shell Logic)

• awk extracts IP, method, URL path, status code, and user agent
• sort and uniq -c count occurrences
• sort -rn and head -n 5 display top results
• Temporary files separate data into clean sections

This is the same pattern used in real DevOps incident analysis workflows.

🛠️ Future Enhancements (Planned)

• JSON output mode (--json)
• Color output (ANSI)
• Docker image (docker run -v logs:/logs analyser)
• Log filtering by time range (--from --to)
• GitHub Actions CI to auto-analyse logs on push
• Export results to CSV

📦 Installation

git clone https://github.com/Ni7H1N/nginx-log-analyser.git

cd nginx-log-analyser
chmod +x nginx-log-analyser.sh

🤝 Contributing

Contributions are welcome —
You can help by improving parsing logic, adding new analysis features, or enhancing the script output.

👨‍💻 Author

Karipalli Nithin
DevOps Engineer | Linux | Cloud | Automation | Shell Scripting
GitHub: https://github.com/Ni7H1N

LinkedIn: (Add your link here)
