from pathlib import Path

import pandas as pd
from flask import Flask, jsonify, send_from_directory
from sqlalchemy import create_engine

BASE_DIR = Path(__file__).resolve().parent

# ---- Database connection ---------------------------------------------------
# SQL Express:   change "localhost" to "localhost\\SQLEXPRESS"
# ODBC Driver 18: change "17" to "18" and add "&TrustServerCertificate=yes"
CONNECTION_STRING = (
    "mssql+pyodbc://@localhost/StudentDB"
    "?driver=ODBC+Driver+17+for+SQL+Server"
    "&trusted_connection=yes"
)
engine = create_engine(CONNECTION_STRING)

app = Flask(__name__)


# ---- Routes ----------------------------------------------------------------
@app.route("/")
def home():
    """Serve the dashboard page."""
    return send_from_directory(BASE_DIR, "dashboard.html")


@app.route("/api/data")
def api_data():
    """Return raw students and marks as JSON for the dashboard."""
    try:
        students = pd.read_sql(
            "SELECT student_id, student_name, city FROM Students", engine
        )
        marks = pd.read_sql(
            "SELECT mark_id, student_id, subject, marks FROM Marks", engine
        )
        return jsonify(
            students=students.to_dict("records"),
            marks=marks.to_dict("records"),
        )
    except Exception as e:
        # The dashboard falls back to sample data when this returns 500
        print("Database error:", e)
        return jsonify(error=str(e)), 500


@app.route("/api/performance")
def api_performance():
    """Optional: return the StudentPerformance view as JSON."""
    try:
        df = pd.read_sql("SELECT * FROM StudentPerformance", engine)
        return jsonify(df.to_dict("records"))
    except Exception as e:
        print("Database error:", e)
        return jsonify(error=str(e)), 500


# ---- Start server ----------------------------------------------------------
if __name__ == "__main__":
    app.run(debug=True)