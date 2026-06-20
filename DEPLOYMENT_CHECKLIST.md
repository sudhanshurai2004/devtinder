# 🚀 DevTinder - Deployment Checklist

## ✅ Pre-Deployment Verification

### Local Testing
- [ ] Run `start.bat` (Windows) or `./start.sh` (Mac/Linux)
- [ ] Backend starts on http://localhost:3000
- [ ] Frontend starts on http://localhost:5173
- [ ] Can access frontend without errors
- [ ] MongoDB connects successfully (check backend console)

### API Testing
- [ ] Login API responds
- [ ] Profile API responds
- [ ] Feed API responds
- [ ] Can create, read, update data

### Code Quality
- [ ] No console errors in browser
- [ ] No errors in backend terminal
- [ ] Frontend builds without warnings: `npm run build`
- [ ] ESLint passes (optional): `npm run lint`

---

## 📦 Build for Production

### Backend
```bash
cd devTinder-backend
npm install --production
npm run start  # Use 'start' script instead of 'dev'
```

### Frontend
```bash
cd devTinder-frontend
npm run build
# Creates optimized 'dist' folder
```

---

## 🐳 Docker Deployment

### Build Images
```bash
# From root directory
docker build -f Dockerfile.backend -t devtinder-backend:latest .
docker build -f Dockerfile.frontend -t devtinder-frontend:latest .
```

### Or Use Docker Compose (Easier)
```bash
docker-compose up -d
```

---

## ☁️ Cloud Deployment Options

### Quick Deploy to Render.com

**Backend:**
1. Push code to GitHub
2. Create new Web Service on render.com
3. Connect GitHub repository
4. Set these environment variables:
   ```
   MONGO_URI=your_mongodb_uri
   JWT_SECRET=your_jwt_secret
   NODE_ENV=production
   ```
5. Set build command: `npm install`
6. Set start command: `npm start`

**Frontend:**
1. Create new Static Site on render.com
2. Connect same GitHub repository
3. Set build command: `npm run build`
4. Set publish directory: `dist`

### Alternative: Vercel (Frontend)
```bash
npm install -g vercel
cd devTinder-frontend
vercel --prod
```

### Alternative: Railway.app (Both)
1. Create account on railway.app
2. Connect GitHub
3. Create two services (Backend + Frontend)
4. Configure environment variables
5. Deploy

---

## 🔐 Security Checklist

- [ ] Change JWT_SECRET in `.env.production` to something strong
- [ ] Add production frontend URL to CORS allowlist in backend
- [ ] Enable HTTPS on production
- [ ] Use environment variables for all secrets
- [ ] Remove sensitive data from commits
- [ ] Set up MongoDB IP whitelist
- [ ] Use strong MongoDB passwords
- [ ] Enable MongoDB authentication
- [ ] Configure rate limiting (optional)

---

## 📝 Pre-Production Configuration

### Backend `.env.production`
```
MONGO_URI=mongodb+srv://username:password@cluster.mongodb.net/devTinder
JWT_SECRET=generate-a-strong-secret-here
PORT=3000
NODE_ENV=production
```

### Frontend `.env.production`
```
VITE_API_URL=https://your-backend-domain.com
```

### Update Backend CORS
In `app.js`, add your production frontend URL:
```javascript
const allowedOrigins = [
  "http://localhost:5173",
  "https://your-frontend-domain.com",  // ADD THIS
];
```

---

## 📊 Performance Optimization

### Frontend
- ✅ Already uses Vite (fast bundler)
- ✅ Already uses React for optimization
- ✅ Already uses Redux for state management
- 🔧 Consider: Lazy load components
- 🔧 Consider: Add service worker for PWA

### Backend
- ✅ Uses Express (lightweight)
- ✅ Uses MongoDB (scalable)
- 🔧 Consider: Add caching (Redis)
- 🔧 Consider: Add API rate limiting
- 🔧 Consider: Add request logging

---

## 📞 Production URLs After Deployment

After deployment, update these:

**Frontend .env.production:**
```
VITE_API_URL=https://your-api-domain.com
```

**Backend app.js CORS:**
```javascript
const allowedOrigins = [
  "https://your-frontend-domain.com",
];
```

---

## 🔗 Quick Links

- MongoDB Atlas: https://www.mongodb.com/cloud/atlas
- Render.com: https://render.com
- Vercel: https://vercel.com
- Railway: https://railway.app
- Docker Hub: https://hub.docker.com

---

## ❓ Deployment Troubleshooting

### "Cannot find module"
```bash
cd devTinder-backend
npm install
```

### "MongoDB connection failed"
- Check MONGO_URI
- Verify IP whitelist in MongoDB Atlas
- Test connection string locally first

### "Frontend blank/not loading"
- Check VITE_API_URL
- Verify backend is running
- Check browser console for errors

### "CORS error"
- Add frontend domain to allowedOrigins in app.js
- Ensure backend is rebuilt/redeployed

---

## ✨ Done! 🎉

Your DevTinder app is ready to deploy!

For questions: Check SETUP_GUIDE.md
