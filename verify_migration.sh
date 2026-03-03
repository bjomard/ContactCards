#!/bin/bash
# Verify ContactCard v2 migration

echo "🔍 Verifying ContactCard v2 migration..."

echo ""
echo "── alice ──"
if [ -f "/Users/bjomard/F3NIX-Whisper/ContactCards/wspr/alice/alice.min.json" ]; then
  V=$(python3 -c "import json; print(json.load(open('/Users/bjomard/F3NIX-Whisper/ContactCards/wspr/alice/alice.min.json'))['v'])")
  SPK=$(python3 -c "import json; c=json.load(open('/Users/bjomard/F3NIX-Whisper/ContactCards/wspr/alice/alice.min.json')); print(c['usage_identity']['pub'].get('signed_pre_key','MISSING')[:20])")
  IID=$(python3 -c "import json; c=json.load(open('/Users/bjomard/F3NIX-Whisper/ContactCards/wspr/alice/alice.min.json')); mb=c['mailboxes']; print(mb[0].get('inbox_id','MISSING') if mb else 'NO_MAILBOX')")
  echo "  📄 Version: $V"
  echo "  🔑 PreKey:  $SPK..."
  echo "  📬 InboxID: $IID"
  if [ "$V" = "2" ] && [ "$SPK" != "MISSING" ] && [ "$IID" != "MISSING" ]; then
    echo "  ✅ VALID"
  else
    echo "  ❌ INCOMPLETE"
  fi
else
  echo "  ❌ File not found"
fi