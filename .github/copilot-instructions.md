# Copilot Instructions for imposter_frontend

## Project Overview
This is an **Imposter Game** web application where players receive words and imposters try to hide while guessing the correct word. Currently implemented as a Vanilla JavaScript frontend with Vite, but planned for migration to React + Java backend architecture.

### Game Concept
- **Genre**: Social deduction game similar to Skribble and Codenames
- **Players**: 4-6 players (1 imposter for 4 players, 2 imposters for 6 players)
- **Gameplay**: Players get a word, imposters get different words and must blend in while guessing the real word
- **Interface**: Players sit at a virtual table with avatars + nicknames, clear turn indicators

### Planned Tech Stack Migration
- **Frontend**: React (set up with Vite) - *currently Vanilla JS*
- **Backend**: Java with Spring Boot
- **Database**: SQLite (lightweight, sufficient for use case)
- **Containerization**: Docker for all services
- **Deployment**: Cloud integration (open to suggestions)

## Architecture & Structure

### Current (Vanilla JS + Vite)
- **Entry Point**: `index.html` → `src/main.js` → component modules
- **Module Pattern**: ES6 modules with explicit imports/exports (see `counter.js`)  
- **Styling**: Global CSS in `src/style.css`, imported in `main.js`
- **Assets**: Static assets in `public/`, imported assets in `src/`

### Planned Architecture
- **Frontend**: React components with game-specific UI (landing page, game room, player table)
- **Backend**: Spring Boot REST API for game logic, room management, player state
- **Database**: SQLite with tables for games, players, rooms, word lists
- **Real-time**: WebSocket integration for live game updates and turn management

## Development Workflow
**Primary Development**: Use Docker containers to avoid Node.js version conflicts
```bash
# Start development server
docker-compose up

# Start in background
docker-compose up -d

# Rebuild after dependency changes  
docker-compose up --build

# Stop containers
docker-compose down
```

**Adding Dependencies**: 
- Install locally: `npm install package-name` 
- Rebuild container: `docker-compose up --build`
- Or install directly in running container: `docker-compose exec frontend npm install package-name`

## Project-Specific Conventions
- **Node.js Version**: Requires Node 20+ (handled by Docker container using `node:20-alpine`)
- **German Comments**: Docker files contain German comments - maintain this pattern
- **Port Configuration**: Always use port 5173 for Vite dev server with `--host 0.0.0.0` for Docker networking
- **Volume Mapping**: Code changes are live-reloaded via Docker volume mounts (`.:/app` with `node_modules` exclusion)

## Key Files & Their Roles
- `Dockerfile`: Multi-stage build optimized for development with proper layer caching
- `docker-compose.yml`: Development environment with live reload and port mapping
- `src/main.js`: Application bootstrap - handles DOM manipulation and module imports
- `src/counter.js`: Example of the project's modular component pattern using closures and event listeners

## Integration Points
- **Docker Development**: All development should happen in containers due to Node.js version requirements
- **Vite HMR**: Hot module replacement works through Docker port forwarding
- **Asset Handling**: Distinguish between `/public` assets (static) and `/src` assets (processed by Vite)

## Building & Deployment
- Development: `docker-compose up` (auto-reload enabled)
- Production build: `npm run build` (creates `dist/` folder)
- Preview production: `npm run preview`

## Game-Specific Features to Implement

### Frontend Components (React Migration)
- **Landing Page**: Project showcase, developer presentation, game entry points
- **Game Lobby**: Join/Create game, name + avatar selection, how-to-play instructions
- **Game Table**: Virtual table interface showing 4-6 players with avatars and nicknames
- **Turn Management**: Visual indicators for whose turn it is, game state display
- **Responsive Design**: Similar aesthetic to Skribble and Codenames

### Game Logic Requirements
- **Room Management**: Create/join games with unique room codes
- **Player Management**: 4-6 player limit with role assignment (1-2 imposters)
- **Word Distribution**: Different words for imposters vs. regular players
- **Game Flow**: Turn-based interaction with real-time updates

### Integration Points
- **Backend Communication**: REST API calls for game actions
- **Real-time Updates**: WebSocket connections for live game state
- **State Management**: React context/Redux for game state synchronization

When adding new features, follow the existing pattern in `counter.js`: export functions that accept DOM elements and set up event listeners with closure-based state management.
