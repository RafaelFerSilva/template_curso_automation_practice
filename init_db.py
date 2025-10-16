"""
Database Initialization Script

This script initializes a MySQL database by:
1. Establishing a connection to the MySQL server
2. Executing SQL commands from an initialization file
3. Implementing a retry mechanism with timeout

The script will attempt to connect to the database multiple times
until successful or until the timeout period is reached.
"""

import time
import sys
import os
import mysql.connector
import dotenv

dotenv.load_dotenv()

# Retry mechanism configuration
TIMEOUT = 60      # Maximum waiting time in seconds
INTERVAL = 5      # Time between connection attempts in seconds
ELAPSE_TIME = 0  # Tracks total elapsed time

# Attempt to connect to the database with retry logic
while ELAPSE_TIME < TIMEOUT:
    try:
        print("Trying to connect to MySQL...")
        # Establish database connection
        conn = mysql.connector.connect(
            host=os.environ["DB_HOST"],
            user=os.environ["DB_USER"],
            password=os.environ["DB_PASSWORD"],
            database=os.environ["DB_NAME"]
        )
        print("✅ Connected to MySQL successfully!")
        break

    except mysql.connector.Error as e:
        # Handle connection errors
        print(f"⚠️ Error connecting to MySQL: {e}")
        ELAPSE_TIME += INTERVAL
        print(f"Waiting {INTERVAL} seconds before trying again...")
        time.sleep(INTERVAL)
else:
    # Exit if timeout is reached
    print("⛔ Timeout! MySQL is not available.")
    sys.exit(1)
