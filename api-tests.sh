#!/bin/bash
cd /d/Codings/2026/F.CSA313/lab07 || exit 1
mkdir -p evidence
URL=localhost:3000/api/books

log() { echo "$(date +%H:%M) $*" >> notes.txt; }

run() {   # $1 = name, $2 = JSON body
  out="evidence/api-$1.txt"
  {
    echo "\$ curl -i -X POST $URL -H 'Content-Type: application/json' -d '$2'"
    curl -s -i -X POST "$URL" -H 'Content-Type: application/json' -d "$2"
    echo
  } > "$out" 2>&1
  status=$(grep -m1 '^HTTP' "$out" | tr -d '\r')
  log "API POST [$1] body=$2 -> ${status:-NO RESPONSE (server crashed?)} ($out)"
  printf '%-14s %s\n' "$1" "${status:-NO RESPONSE}"
}

# 1) See what the API returns and its field names
{ echo "\$ curl -i $URL"; curl -s -i "$URL"; echo; } > evidence/api-get.txt 2>&1
log "API GET /api/books -> $(grep -m1 '^HTTP' evidence/api-get.txt | tr -d '\r')"
echo "===== GET /api/books ====="; cat evidence/api-get.txt; echo

# 2) Attacks (spec: invalid JSON -> 400; year 1000-2100; all fields required; no duplicates)
run broken-json   '{"title": "broken'
run not-json      'not json at all'
run empty-body    ''
run empty-object  '{}'
run empty-fields  '{"title":"","author":"","year":1999}'
run year-2101     '{"title":"API 2101","author":"Tester","year":2101}'
run year-999      '{"title":"API 999","author":"Tester","year":999}'
run year-decimal  '{"title":"API dec","author":"Tester","year":1999.5}'
run year-text     '{"title":"API text","author":"Tester","year":"abc"}'
run duplicate     '{"title":"Clean Code","author":"Robert C. Martin","year":2008}'
run valid         '{"title":"Valid book","author":"Tester","year":1999}'

echo; echo "Done. Outputs are in evidence/, log lines added to notes.txt"