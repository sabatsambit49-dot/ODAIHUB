# 🎓 EduTrack — Educational Hierarchy & Analytics Platform

EduTrack is a web application designed to manage, explore, and analyze multi-level educational hierarchies (States, Districts, Institutions, Courses, Branches, and Academic Years), along with syllabus entries, event management, and network analytics.

---

## 🚀 Quick Links (Localhost Access)

Once the application servers are running, click any link below to open it directly in your browser:

* 🖥️ **Frontend React Application:** [http://localhost:3000](http://localhost:3000)
* ⚙️ **Backend FastAPI Health Check:** [http://localhost:8000/health](http://localhost:8000/health)
* 📖 **Backend Swagger Interactive API Docs:** [http://localhost:8000/api/docs](http://localhost:8000/api/docs)
* 📚 **Backend ReDoc Interactive Documentation:** [http://localhost:8000/api/redoc](http://localhost:8000/api/redoc)

---

## 🛠️ How to Run the Project Locally

### 1. Start the Backend Server (FastAPI + SQLite)
Open your terminal in the `backend` directory:

```bash
# Navigate to backend folder
cd backend

# (Optional) Activate Virtual Environment if available
# Windows: venv\Scripts\activate

# Install dependencies (if not already installed)
pip install -r requirements.txt

# Start the FastAPI server on port 8000
python -m uvicorn app.main:app --reload --port 8000
```
> The backend server will automatically initialize the local SQLite database at `backend/edutrack.db`.

---

### 2. Start the Frontend Server (React + Vite)
Open a second terminal in the `frontend` directory:

```bash
# Navigate to frontend folder
cd frontend

# Install node modules (if not already installed)
npm install

# Start Vite dev server on port 3000
npm run dev
```

Once running, open your web browser to **[http://localhost:3000](http://localhost:3000)**!

---

## 📚 Technical PDF Documentation Guides

Complete architectural documentation and mapping guides are available as PDF documents in the project root:

1. 📄 [**EduTrack_Part1_Backend_to_Database_Mapping_Guide.pdf**](file:///d:/New%20folder%20%282%29/EduTrack_Part1_Backend_to_Database_Mapping_Guide.pdf)  
   *Covers SQLAlchemy ORM models, SQLite database tables, session lifecycles, and CRUD data operations.*

2. 📄 [**EduTrack_Part2_Backend_to_Frontend_API_Guide.pdf**](file:///d:/New%20folder%20%282%29/EduTrack_Part2_Backend_to_Frontend_API_Guide.pdf)  
   *Covers FastAPI REST endpoints, request/response validation with Pydantic schemas, JWT authentication, and Axios client React state bindings.*

3. 📄 [**EduTrack_Part3_End_to_End_System_Architecture_Guide.pdf**](file:///d:/New%20folder%20%282%29/EduTrack_Part3_End_to_End_System_Architecture_Guide.pdf)  
   *Covers the complete 6-layer system architecture blueprint, master entity matrix, and sequence flow diagrams.*

---

## 🏛️ System Architecture Overview

```text
[ React UI Components ] (Port 3000)
         │
         ▼  (Axios HTTP REST Calls)
[ FastAPI Routers & Pydantic Schemas ] (Port 8000 /api)
         │
         ▼  (Session & Query Translation)
[ SQLAlchemy ORM & CRUD Operations ]
         │
         ▼  (SQL Execution)
[ SQLite Database: edutrack.db ]
```

---

## ⚡ Handling Backend Sleep & Free Tier Cold Starts

Free-tier cloud hosting providers (e.g. Render, Koyeb, Railway, Heroku) automatically spin down idle backend instances after 15 minutes. EduTrack includes built-in safeguards across the entire stack:

### 1. 🛡️ Frontend Cold-Start Resilience
- **Extended Request Timeout (45s)**: Prevents Axios requests from failing prematurely during server boot up.
- **Auto-Retry Interceptor**: Automatically retries failed requests up to 3 times with exponential backoff on `502`, `503`, `504`, or `Network Errors`.
- **Live Server Wakeup Banner (`ServerWakeupBanner.jsx`)**: Automatically displays an animated banner showing cold start progress and elapsed seconds when the server is spinning up.
- **Active Session Keep-Alive (`BackendHealthContext.jsx`)**: Automatically sends a background `/health` ping every 4 minutes while the browser tab is open to keep the backend warm.

### 2. ⚡ Backend Keep-Alive Tools
- **Standalone Pinger Script**:
  Run the included `keep_alive.py` script locally or in a worker to continuously keep any deployed instance awake:
  ```bash
  python backend/keep_alive.py --url https://your-backend.onrender.com/health --interval 600
  ```
- **Built-in FastAPI Self-Pinger**:
  When deploying your backend, set environment variables to enable automatic self-pinging:
  ```env
  ENABLE_KEEP_ALIVE=true
  APP_PUBLIC_URL=https://your-backend.onrender.com
  ```
- **External Uptime Services**:
  You can also configure free monitoring tools like [UptimeRobot](https://uptimerobot.com) or [Cron-Job.org](https://cron-job.org) to hit `https://your-backend.onrender.com/health` or `https://your-backend.onrender.com/api/v1/ping` every 5–10 minutes.

