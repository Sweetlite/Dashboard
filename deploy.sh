#!/bin/bash
# Deploy Dashboard to Hostinger
# Usage: ./deploy.sh

cd "$(dirname "$0")"

echo "📦 Commit & push..."
git add -A
git commit -m "Update $(date '+%d/%m %H:%M')" 2>/dev/null

if git push origin main 2>&1 | tail -1; then
    echo "🚀 Déploiement sur Hostinger..."
    RESULT=$(curl -s -k -X POST "https://n8n.srv1230871.hstgr.cloud/webhook/deploy-dashboard" 2>&1)
    if echo "$RESULT" | grep -q '"status":"ok"'; then
        echo "✅ Déployé sur https://home.srv1230871.hstgr.cloud/"
    else
        echo "❌ Erreur webhook: $RESULT"
    fi
else
    echo "❌ Erreur git push"
fi
