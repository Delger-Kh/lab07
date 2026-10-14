# Session report

- Тестер: Х.Дэлгэр (B222270835)
- Огноо: 2026-10-14, 17:38 - 17:38 (60 мин)
- Mission: Уншлагын жагсаалт аппын чанарыг шинжлэх
- Charter: Ном нэмэх форм, хүснэгт, хайлт, устгах, «Нийт ном» тоолуур болон /api/books API-г хоосон/хил хязгаарын/буруу оролт, давхардал, curl-ээр буруу JSON ашиглан шалгаж, validation, мессеж, тоолуур, UI болон HTTP статусын согог илрүүлэх. Аялал: Couch Potato, Saboteur, Supermodel, FedEx.

## Тэмдэглэл (он цагийн дарааллаар)

```
17:38 API GET /api/books -> HTTP/1.1 200 OK
17:38 API POST [broken-json] body={"title": "broken -> HTTP/1.1 200 OK (evidence/api-broken-json.txt)
17:38 API POST [not-json] body=not json at all -> HTTP/1.1 200 OK (evidence/api-not-json.txt)
17:38 API POST [empty-body] body= -> HTTP/1.1 201 Created (evidence/api-empty-body.txt)
17:38 API POST [empty-object] body={} -> HTTP/1.1 201 Created (evidence/api-empty-object.txt)
17:38 API POST [empty-fields] body={"title":"","author":"","year":1999} -> HTTP/1.1 201 Created (evidence/api-empty-fields.txt)
17:38 API POST [year-2101] body={"title":"API 2101","author":"Tester","year":2101} -> HTTP/1.1 201 Created (evidence/api-year-2101.txt)
17:38 API POST [year-999] body={"title":"API 999","author":"Tester","year":999} -> HTTP/1.1 201 Created (evidence/api-year-999.txt)
17:38 API POST [year-decimal] body={"title":"API dec","author":"Tester","year":1999.5} -> HTTP/1.1 201 Created (evidence/api-year-decimal.txt)
17:38 API POST [year-text] body={"title":"API text","author":"Tester","year":"abc"} -> HTTP/1.1 201 Created (evidence/api-year-text.txt)
17:38 API POST [duplicate] body={"title":"Clean Code","author":"Robert C. Martin","year":2008} -> HTTP/1.1 201 Created (evidence/api-duplicate.txt)
17:38 API POST [valid] body={"title":"Valid book","author":"Tester","year":1999} -> HTTP/1.1 201 Created (evidence/api-valid.txt)
```

## Саадууд (issues)

- Заавар Linux-д зориулагдсан тул Windows 10 дээр Git Bash (MSYS2 UCRT64) ашигласан; PowerShell-д curl-ийн хашилт эвдэрдэг.
- VS Code терминалд paste хийхэд ^[[200~ тэмдэгт нэмэгдэж команд эвдэрсэн → «Ignore Bracketed Paste Mode» тохиргоог асааж засав.
- API-ийн талбарын нэрийг урьдчилан мэдээгүй тул эхлээд GET /api/books-оор шалгасан.
- Апп өгөгдлөө санах ойд хадгалдаг тул curl туршилт өгөгдлийг өөрчилсний дараа UI тест бүрийн өмнө аппыг дахин асаах шаардлагатай байв.
- Скриншотыг Win+Shift+S-ээр авч гараар нэрлэж хадгалах нь цаг авсан.

## Цагийн задаргаа

Setup 15% · Тест дизайн ба гүйцэтгэл 60% · Согог судлах 25%
