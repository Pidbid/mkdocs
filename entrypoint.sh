#!/bin/sh
# Exit immediately if a command exits with a non-zero status.
set -e

# Check if requirements.txt exists in the working directory (/docs)
# and install dependencies from it if it does.
if [ -f "requirements.txt" ]; then
    echo ">>> Found requirements.txt, installing dependencies..."
    pip install --no-cache-dir -r requirements.txt
else
    echo ">>> requirements.txt not found, skipping."
fi

echo ">>> Starting MkDocs server..."
# Start the MkDocs development server, listening on all interfaces.
exec mkdocs serve --dev-addr 0.0.0.0:8000
