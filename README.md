# DevTinder | MERN Stack Developer Networking Platform

A full-stack developer networking platform built with React, Node.js, Express, and MongoDB where developers can connect, send requests, and manage professional profiles.

## 🎯 Quick Start

### **Windows:**
```bash
start.bat
```

### **Mac/Linux:**
```bash
chmod +x start.sh
./start.sh
```

### **Manual:**
```bash
# Terminal 1 - Backend
cd devTinder-backend && npm install && npm run dev

# Terminal 2 - Frontend
cd devTinder-frontend && npm install && npm run dev
```

✅ Open http://localhost:5173

---

## 📚 Documentation

- **Setup Guide:** [SETUP_GUIDE.md](SETUP_GUIDE.md)
- **Deployment:** [DEPLOYMENT_CHECKLIST.md](DEPLOYMENT_CHECKLIST.md)

---

## 🏗️ Architecture

```
┌─────────────────────┐
│   Frontend (React)  │
│   Port: 5173        │
└──────────┬──────────┘
           │
           │ Axios HTTP Requests
           │
┌──────────▼──────────┐
│ Backend (Express)   │
│ Port: 3000          │
└──────────┬──────────┘
           │
           │ Mongoose ODM
           │
┌──────────▼──────────┐
│    MongoDB Atlas    │
│  (Cloud Database)   │
└─────────────────────┘
```

---

## 🔧 What's Connected

- ✅ Frontend → Backend API calls
- ✅ Backend → MongoDB database
- ✅ Authentication → JWT tokens
- ✅ CORS → Both ports configured
- ✅ Environment Variables → All configured
- ✅ Docker Support → Ready to deploy

---

## 📁 Generated Files

### Root Directory
```
start.bat                    # Quick start (Windows)
start.sh                    # Quick start (Mac/Linux)
verify-setup.bat            # Verify configuration
docker-compose.yml          # Docker containerization
Dockerfile.backend          # Backend container
Dockerfile.frontend         # Frontend container
.gitignore                  # Git ignore rules
package.json                # Root NPM scripts
SETUP_GUIDE.md             # Complete setup guide
DEPLOYMENT_CHECKLIST.md    # Pre-deployment checklist
```

## Live Demo

Frontend:
https://devtinder-frontend-tau.vercel.app

Backend:
https://devtinder-backend-zv80.onrender.com

---

## 🚀 Features

- User Authentication (Login/Signup)
- Profile Management
- User Feed
- Connection Requests
- User Connections
- Redux State Management
- Responsive UI (Tailwind CSS + DaisyUI)

---

## 📊 Stack

### Frontend
- React 19
- Vite (Fast bundler)
- Redux Toolkit
- Axios
- Tailwind CSS
- DaisyUI

### Backend
- Node.js + Express
- MongoDB + Mongoose
- JWT Authentication
- Cookie Parser
- Validator

---

## ⚙️ Environment Setup

### Backend (.env)
```
MONGO_URI=mongodb+srv://...
JWT_SECRET=replace-with-a-strong-secret
PORT=3000
```

### Frontend (.env)
```
VITE_API_URL=http://localhost:3000
```

---

## 🐳 Docker Commands

```bash
# Start everything
docker-compose up -d

# Stop everything
docker-compose down

# View logs
docker-compose logs -f

# Rebuild
docker-compose up -d --build
```

---

## 🌐 Deployment

Ready to deploy to:
- ✅ Render.com
- ✅ Vercel (Frontend)
- ✅ Railway.app
- ✅ AWS
- ✅ DigitalOcean
- ✅ Azure

See [DEPLOYMENT_CHECKLIST.md](DEPLOYMENT_CHECKLIST.md) for detailed instructions.

---

## 🆘 Troubleshooting

### Port Already in Use
```bash
# Windows
netstat -ano | findstr :3000

# Mac/Linux
lsof -i :3000
```

### MongoDB Connection Error
- Check MONGO_URI in `.env`
- Verify IP whitelist in MongoDB Atlas
- Test credentials

### Frontend Not Connecting
- Verify backend running on 3000
- Check VITE_API_URL
- Look at browser console errors

---

## 📞 Next Steps

1. ✅ Run `start.bat` or `start.sh`
2. ✅ Test all features locally
3. ✅ Review [DEPLOYMENT_CHECKLIST.md](DEPLOYMENT_CHECKLIST.md)
4. ✅ Deploy to production

---

**Happy Coding! 🎉**
