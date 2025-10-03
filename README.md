# Imposter Game Frontend

A social deduction web game where players receive words and imposters try to hide while guessing the correct word. Similar to games like Skribble and Codenames.

## 🎮 Game Concept

- **Genre**: Social deduction game
- **Players**: 4-6 players (1 imposter for 4 players, 2 imposters for 6 players)
- **Gameplay**: Players get a word, imposters get different words and must blend in while guessing the real word
- **Interface**: Players sit at a virtual table with avatars + nicknames, clear turn indicators

## 🏗️ Current Tech Stack

- **Frontend**: Vanilla JavaScript with Vite
- **Module System**: ES6 modules with explicit imports/exports
- **Styling**: Global CSS
- **Development**: Docker containerization
- **Node.js**: Version 20+ (Alpine Linux container)

## 🚀 Planned Migration

- **Frontend**: React (with Vite)
- **Backend**: Java with Spring Boot
- **Database**: SQLite
- **Real-time**: WebSocket integration
- **Deployment**: Cloud integration

## 📁 Project Structure

```
imposter_frontend/
├── docker-compose.yml      # Development environment
├── Dockerfile             # Container configuration
├── index.html            # Entry point
├── package.json          # Dependencies and scripts
├── public/               # Static assets
│   └── vite.svg
└── src/                  # Source code
    ├── main.js          # Application bootstrap
    ├── counter.js       # Example component pattern
    ├── style.css        # Global styles
    └── javascript.svg
```

## 🐳 Development Workflow (Docker)

**Primary development uses Docker containers to avoid Node.js version conflicts.**

### Start Development Server
```bash
docker-compose up
```

### Start in Background
```bash
docker-compose up -d
```

### Rebuild After Dependencies Change
```bash
docker-compose up --build
```

### Stop Containers
```bash
docker-compose down
```

### Adding Dependencies
```bash
# Option 1: Install locally then rebuild
npm install package-name
docker-compose up --build

# Option 2: Install directly in running container
docker-compose exec frontend npm install package-name
```

## 🛠️ Local Development (Alternative)

If you prefer to develop without Docker:

```bash
# Install dependencies
npm install

# Start development server
npm run dev

# Build for production
npm run build

# Preview production build
npm run preview
```

**Note**: Requires Node.js 20+

## 🎯 Features to Implement

### Frontend Components (React Migration)
- [ ] **Landing Page**: Project showcase, developer presentation, game entry points
- [ ] **Game Lobby**: Join/Create game, name + avatar selection, how-to-play instructions
- [ ] **Game Table**: Virtual table interface showing 4-6 players with avatars and nicknames
- [ ] **Turn Management**: Visual indicators for whose turn it is, game state display
- [ ] **Responsive Design**: Similar aesthetic to Skribble and Codenames

### Game Logic Requirements
- [ ] **Room Management**: Create/join games with unique room codes
- [ ] **Player Management**: 4-6 player limit with role assignment (1-2 imposters)
- [ ] **Word Distribution**: Different words for imposters vs. regular players
- [ ] **Game Flow**: Turn-based interaction with real-time updates

### Backend Integration (Planned)
- [ ] **REST API**: Communication for game actions
- [ ] **WebSocket**: Real-time game state updates
- [ ] **State Management**: React context/Redux for synchronization

## 🔧 Development Guidelines

### Module Pattern
Follow the pattern established in `counter.js`:
- Export functions that accept DOM elements
- Set up event listeners with closure-based state management
- Use ES6 modules with explicit imports/exports

### File Organization
- **Static assets**: Place in `/public` directory
- **Processed assets**: Place in `/src` directory (handled by Vite)
- **Components**: Follow modular pattern with clear separation of concerns

### Docker Conventions
- **Port**: Always use 5173 for Vite dev server with `--host 0.0.0.0`
- **Comments**: Maintain German comments in Docker files
- **Volumes**: Live reload enabled via volume mounts

## 📝 Scripts

```bash
npm run dev      # Start development server
npm run build    # Build for production
npm run preview  # Preview production build
```

## 🌐 Ports

- **Development**: http://localhost:5173
- **Docker**: Mapped to host port 5173

## 🏆 Current Status

- ✅ Basic Vite setup with Vanilla JS
- ✅ Docker development environment
- ✅ Module system established
- 🚧 Game components (in progress)
- 📋 React migration (planned)
- 📋 Backend integration (planned)

## 🤝 Contributing

1. Use Docker for development to ensure consistency
2. Follow the established module pattern
3. Maintain German comments in Docker files
4. Test changes with `docker-compose up --build`

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.