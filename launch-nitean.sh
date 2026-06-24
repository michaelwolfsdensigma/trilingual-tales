#!/bin/bash
# Nitean — Build'o'thon demo launcher

APP_DIR="$(dirname "$0")/app"
ENV_FILE="$APP_DIR/.env"

cd "$APP_DIR" || { echo "ERROR: app directory not found at $APP_DIR"; read -rp "Press Enter to close..."; exit 1; }

# Write env if missing
if [ ! -f "$ENV_FILE" ]; then
    cat > "$ENV_FILE" <<'ENVEOF'
EXPO_PUBLIC_SUPABASE_URL=https://hmhcyaxvcgepldafpeol.supabase.co
EXPO_PUBLIC_SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhtaGN5YXh2Y2dlcGxkYWZwZW9sIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODIyNTQzNDMsImV4cCI6MjA5NzgzMDM0M30.6xrcr1HKbmcVJZXJ_vhODIIlphskEliecZwnxmF6VqE
ENVEOF
    echo "Created .env with Supabase credentials."
fi

echo ""
echo "  ╔══════════════════════════════════╗"
echo "  ║        N I T E A N  📖           ║"
echo "  ║   Trilingual Tales — Demo App    ║"
echo "  ╚══════════════════════════════════╝"
echo ""
echo "  Supabase: https://hmhcyaxvcgepldafpeol.supabase.co"
echo "  Freemium: flip is_premium in Supabase Studio to demo unlock"
echo ""
echo "  Press Ctrl+C to stop."
echo ""

npx expo start
