# 🚀 DevTinder - Setup & Deployment Guide

## 📋 Requirements
- Node.js v18+ ([Download](https://nodejs.org/))
- npm (comes with Node.js)
- MongoDB Connection String (you already have this in `.env`)
- Docker & Docker Compose (optional, for containerized deployment)

---

## 🎯 Quick Start (Development)

### **Windows Users:**
```bash
# Just double-click this file:
start.bat
```

### **Mac/Linux Users:**
```bash
chmod +x start.sh
./start.sh
```

### **Manual Start (Both Windows/Mac/Linux):**

**Terminal 1 - Backend:**
```bash
cd devTinder-backend
npm install
npm run dev
```

**Terminal 2 - Frontend:**
```bash
cd devTinder-frontend
npm install
npm run dev
```

✅ Backend: http://localhost:3000
✅ Frontend: http://localhost:5173

---

## 📁 Project Structure

```
devTinder/
├── devTinder-backend/      # Express + MongoDB API
│   ├── .env               # Development variables (already configured)
│   ├── .env.production    # Production variables
│   ├── app.js            # Main server file
│   └── src/
│
├── devTinder-frontend/     # React + Vite + Redux
│   ├── .env              # Development variables
│   ├── .env.production   # Production variables
│   └── src/
│
├── docker-compose.yml      # Docker containerization
├── Dockerfile.backend      # Backend container config
├── Dockerfile.frontend     # Frontend container config
├── start.sh               # Linux/Mac startup script
└── start.bat              # Windows startup script
```

---

## 🔧 Environment Variables

### **Backend (.env - Already Configured)**
```
MONGO_URI=mongodb+srv://...
JWT_SECRET=replace-with-a-strong-secret
PORT=3000
NODE_ENV=development
```

### **Frontend (.env - Auto-configured)**
```
VITE_API_URL=http://localhost:3000
```

---

## 🐳 Docker Deployment (Production)

### **Option 1: Docker Compose (Easiest)**
```bash
# Build and run everything
docker-compose up -d

# Stop everything
docker-compose down
```

### **Option 2: Individual Docker Builds**

**Backend:**
```bash
docker build -f Dockerfile.backend -t devtinder-backend .
docker run -p 3000:3000 --env-file devTinder-backend/.env.production devtinder-backend
```

**Frontend:**
```bash
docker build -f Dockerfile.frontend -t devtinder-frontend .
docker run -p 80:3000 devtinder-frontend
```

---

## ☁️ Deployment Platforms

### **1. Render.com (Recommended - Free tier available)**

**Backend:**
1. Push to GitHub
2. Create new Web Service on Render
3. Connect GitHub repo
4. Set build command: `npm install`
5. Set start command: `npm start`
6. Add environment variables from `.env.production`

**Frontend:**
1. Create new Static Site on Render
2. Connect GitHub repo
3. Set build command: `npm run build`
4. Set publish directory: `dist`

### **2. Vercel (Frontend only)**
```bash
npm i -g vercel
vercel --prod
```

### **3. Railway.app (Full Stack)**
1. Push to GitHub
2. Connect Railway account
3. Auto-detect Node.js backend
4. Configure environment variables
5. Deploy

### **4. AWS/DigitalOcean/Azure**
- Use Docker Compose file
- Configure environment variables
- Set up database connection
- Configure domain/SSL

---

## 🔗 Important Configuration

### **Backend app.js**
- ✅ CORS configured for frontend (localhost:5173)
- ✅ MongoDB connection ready
- ✅ JWT authentication setup
- ✅ All routes configured

### **Frontend Constants**
- ✅ Automatically uses environment variables
- ✅ Falls back to localhost:3000

### **What's Connected:**
```
Frontend (React) 
    ↓
Axios Requests
    ↓
BASE_URL (http://localhost:3000)
    ↓
Backend (Express)
    ↓
MongoDB Database
```

---

## 📝 API Endpoints

All endpoints are configured:
- `POST /auth/*` - Authentication
- `GET/POST /profile/*` - User profile
- `GET /user/feed` - User feed
- `GET /user/connections` - Connections
- `POST /request/*` - Connection requests

---

## ✅ Pre-Deployment Checklist

- [ ] Test locally with `start.bat` or `start.sh`
- [ ] Verify MongoDB connection works
- [ ] Check all API endpoints respond
- [ ] Test user login/signup flow
- [ ] Build frontend: `npm run build`
- [ ] Update `.env.production` with production URLs
- [ ] Update Docker environment variables if using containers
- [ ] Configure CORS for production domain in `app.js`
- [ ] Set production database backups
- [ ] Enable HTTPS on production

---

## 🐛 Troubleshooting

### **Port Already in Use:**
```bash
# Windows
netstat -ano | findstr :3000
taskkill /PID <PID> /F

# Mac/Linux
lsof -i :3000
kill -9 <PID>
```

### **MongoDB Connection Error:**
- Verify MONGO_URI in `.env`
- Check IP whitelist in MongoDB Atlas
- Ensure credentials are correct

### **Frontend Can't Connect to Backend:**
- Verify backend is running on http://localhost:3000
- Check VITE_API_URL in `.env`
- Verify CORS is enabled in `app.js`

---

## 📞 Support

For issues:
1. Check terminal error messages
2. Verify environment variables
3. Test each part independently
4. Check MongoDB Atlas dashboard

Happy Coding! 🎉
