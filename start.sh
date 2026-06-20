#!/bin/bash

# DevTinder - Start both Frontend and Backend

echo "🚀 Starting DevTinder Application..."

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed. Please install Node.js first."
    exit 1
fi

# Start Backend
echo "📦 Starting Backend Server..."
cd devTinder-backend
npm install 2>/dev/null
npm run dev &
BACKEND_PID=$!

# Wait for backend to start
sleep 3

# Start Frontend
echo "🎨 Starting Frontend Server..."
cd ../devTinder-frontend
npm install 2>/dev/null
npm run dev &
FRONTEND_PID=$!

echo ""
echo "✅ DevTinder is Running!"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Backend:  http://localhost:3000"
echo "Frontend: http://localhost:5173"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "Press Ctrl+C to stop both servers"
echo ""

# Trap Ctrl+C to kill both processes
trap "kill $BACKEND_PID $FRONTEND_PID" INT

# Wait for both processes
wait
