# 🎓 ODAIHUB Institute Directory Portal

**A comprehensive educational institution directory and analytics platform** — empowering students, professionals, and institutions across Odisha to discover, explore, and connect with educational opportunities through AI-powered insights.

🌐 **Live Demo (Local):** [http://localhost:3000/](http://localhost:3000/)
⚙️ **Backend API Docs:** [http://localhost:8000/api/docs](http://localhost:8000/api/docs)

---

## 🚀 What This Project Does

The **ODAIHUB Institute Directory Portal** is a React + FastAPI full-stack web application that provides:

- **🔍 Institution Search** — Search and filter colleges, universities, and schools across cities and districts.
- **📊 Analytics Dashboard** — Visualise student enrolment trends, seat utilisation, and institutional distribution.
- **📚 Course Matrix** — Explore programmes, branches, and academic years across institutions.
- **🎓 Coaching Directory** — Discover coaching classes and professional training programmes.
- **⚡ Problem Statements** — Browse and submit real-world innovation challenges for students.
- **🏛️ Institution Pages** — Deep-dive into individual institution profiles with departments, branches, and graph data.

---

## 🛠️ Tech Stack

| Layer | Technology |
|-------|-----------|
| Frontend | React 18, Vite 5, TailwindCSS 3, Recharts |
| Backend | Python 3.11+, FastAPI, SQLAlchemy, Uvicorn |
| Database | SQLite (included — `database/edutrack.db`) |
| Auth | JWT Bearer Token (HS256) |
| UI Icons | Material Symbols, Lucide React |
| Fonts | Google Fonts (Noto Serif, Inter, Public Sans) |

---

## 📁 Project Structure

```
institute-directory/
├── frontend/              # React + Vite application (Port 3000)
│   ├── src/
│   │   ├── components/    # UI components (common, search, analytics, institutions)
│   │   ├── pages/         # Route pages (HomePage, SearchResultsPage, etc.)
│   │   ├── api/           # API client hooks (axios, auth, hierarchy, etc.)
│   │   └── context/       # AuthContext, BackendHealthContext
│   ├── vite.config.js     # Vite dev server config (proxies /api/v1 → :8000)
│   └── package.json
│
├── backend/               # FastAPI REST API (Port 8000)
│   ├── app/
│   │   ├── routers/       # API route handlers (institutions, courses, users, etc.)
│   │   ├── models/        # SQLAlchemy ORM models
│   │   ├── schemas/       # Pydantic schemas for request/response validation
│   │   ├── crud/          # Database CRUD operations
│   │   ├── services/      # Business logic services (graph data, analytics)
│   │   ├── utils/         # Auth utilities, JWT helpers
│   │   ├── database/      # SQLAlchemy engine and session
│   │   └── config.py      # Settings (DB URL, JWT secret, ports)
│   ├── requirements.txt
│   └── run_backend.py     # Start backend on port 8000
│
├── database/
│   └── edutrack.db        # SQLite database (pre-seeded with sample data)
│
├── start_all.bat          # 1-click launcher (Windows)
├── push_to_github.bat     # 1-click GitHub push script (Windows)
└── README.md
```

---

## ⚡ Quick Start (Localhost)

### Prerequisites
- **Python 3.11+** (download: https://python.org)
- **Node.js 18+** (download: https://nodejs.org)
- **Git** (download: https://git-scm.com)

### Option A: One-Click Launch (Windows)
```bash
# Just double-click this file:
start_all.bat
```
This opens **both** the Frontend (port 3000) and Backend (port 8000) in separate terminal windows.

---

### Option B: Manual Launch

#### Step 1 — Start Backend API (Port 8000)
```bash
cd backend

# Install Python dependencies (first time only)
pip install -r requirements.txt

# Start the FastAPI server
python run_backend.py
```
> Backend will start at: **http://localhost:8000**
> API Documentation: **http://localhost:8000/api/docs**

#### Step 2 — Start Frontend (Port 3000)
```bash
cd frontend

# Install Node dependencies (first time only)
npm install

# Start the Vite dev server
npm run dev
```
> Frontend will start at: **http://localhost:3000**

---

## 🔑 Default Login Credentials

| Username | Password | Role | Permissions |
|----------|----------|------|-------------|
| `admin` | `admin123` | Admin | Full access — create, edit, delete, manage users |
| `omm` | `admin123` | Admin | Full access |
| `testuser` | `password123` | Editor | Create & edit records |
| `test123` | `password123` | Viewer | Read-only access |

---

## 🌐 Available Pages & Routes

| Route | Page | Description |
|-------|------|-------------|
| `/` | Home | Landing page with ecosystem overview |
| `/search` | Institution Search | Filter and search all institutions |
| `/institution/:id` | Institution Detail | Full profile with graph data |
| `/analytics` | Analytics Dashboard | Enrolment trends and data visualisations |
| `/course-matrix` | Course Matrix | Explore programmes across institutions |
| `/coaching` | Coaching | Coaching centres and training programmes |
| `/problem-statements` | Problem Statements | Innovation challenges |
| `/management` | Management Console | Admin data entry and CRUD console |

---

## 🗄️ Database

The SQLite database (`database/edutrack.db`) is included in this repository and comes **pre-seeded** with sample data:
- Institutions, States, Districts, Institution Types
- Courses, Branches, Academic Years
- Academy Courses, Categories, Pillars
- Website content (Events, Blog Posts, Team Members, etc.)
- User accounts (see credentials above)

> **Note:** The database uses WAL (Write-Ahead Logging) mode for performance. The `.db-shm` and `.db-wal` files are safe to delete — they'll be recreated on next start.

---

## 🔧 Environment Configuration

The backend automatically uses `database/edutrack.db`. To use a custom database path, set the environment variable:

```bash
# Windows
set DATABASE_URL=sqlite:///path/to/your/database.db

# Linux/Mac
export DATABASE_URL=sqlite:///path/to/your/database.db
```

---

## 📦 API Endpoints Overview

| Prefix | Description |
|--------|-------------|
| `/api/v1/auth` | Login, register, get current user |
| `/api/v1/institutions` | List and search institutions |
| `/api/v1/states` | State hierarchy |
| `/api/v1/districts` | City/district listing |
| `/api/v1/courses` | Course catalogue |
| `/api/v1/academic-years` | Academic year data with graph data |
| `/api/v1/admin/*` | Admin-only CRUD (requires auth) |
| `/health` | Backend health check |

Full interactive API docs: **http://localhost:8000/api/docs**

---

## 🙌 Contributing

1. Fork this repository
2. Create your feature branch: `git checkout -b feature/my-feature`
3. Commit your changes: `git commit -m 'Add my feature'`
4. Push to the branch: `git push origin feature/my-feature`
5. Open a Pull Request

---

## 📄 License

This project is part of the **ODAIHUB** platform — an AI talent-to-innovation ecosystem for Odisha.

© 2026 ODAIHUB Educational Systems. All rights reserved.
