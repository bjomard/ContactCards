#!/bin/bash
# Register all inbox_ids on VPS mailbox servers

echo "📬 Registering alice on https://wspr.f3nix.fr..."
curl -s -X POST https://wspr.f3nix.fr/api/inbox -H 'Content-Type: application/json' -d '{"inbox_id": "a606916d02b17ef4dbde983f", "ens_name": "alice"}' | python3 -c "import sys,json; d=json.load(sys.stdin); print('  ✅' if d.get('success') else '  ❌', d)"

echo "📬 Registering alice on https://wspr2.f3nix.fr..."
curl -s -X POST https://wspr2.f3nix.fr/api/inbox -H 'Content-Type: application/json' -d '{"inbox_id": "a606916d02b17ef4dbde983f", "ens_name": "alice"}' | python3 -c "import sys,json; d=json.load(sys.stdin); print('  ✅' if d.get('success') else '  ❌', d)"
