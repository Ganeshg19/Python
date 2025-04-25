from fastapi import FastAPI
from send_email import run_excel_based_scheduler
from datetime import datetime

app = FastAPI(title="Hotel Report Generator API")

# Define your API routes here

# The code block `if __name__ == "__main__":` is a common Python idiom that allows the code within it
# to run only if the script is executed directly (not imported as a module in another script).
if __name__ == "__main__":
    import uvicorn
    uvicorn.run("main:app", host="0.0.0.0", port=8000)

@app.get("/")
def read_root():
    return {"message": "🏨 Hotel Report Generator API is running!"}

@app.post("/generate-reports/")
def generate_reports():
    try:
        booking_month = datetime.now().strftime("%Y-%m")
        run_excel_based_scheduler(booking_month)
        return {
            "status": "success",
            "message": f"Reports generated for {booking_month}"
        }
    except Exception as e:
        return {
            "status": "error",
            "message": str(e)
        }
