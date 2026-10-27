#!/usr/bin/env bash
cd /opt/data/DubaiJobs
git add .
if ! git diff-index --quiet HEAD --; then
  git commit -m "Auto-update Dubai jobs: $(date +\"%Y-%m-%d %H:%M:%S\")"
  git push origin main
  echo "GitHub-ல் வெற்றிகரமாக push செய்யப்பட்டது!"
else
  echo "புதிய மாற்றங்கள் எதுவும் இல்லை."
fi
