# BUG-05: POST /api/books руу буруу JSON илгээхэд 400-ын оронд 200 OK буцаадаг

Орчин: Уншлагын жагсаалт v2.0, Chrome 155.0.8059.85, Windows 10 Pro, 2026-10-23

Урьдчилсан нөхцөл: node app.js-ийг шинээр асаасан (анхны 3 ном), http://localhost:3000 нээлттэй. Репогийн үндсэн хавтаснаас ажиллуулна (`api-bodies/broken.json` файл репод бий).

## Дахин гаргах алхам
1. Хаалтгүй, эвдэрсэн JSON биетэй POST хүсэлт илгээнэ:
   - Linux/macOS:
     ```
     curl -i -X POST http://localhost:3000/api/books -H "Content-Type: application/json" --data-binary @api-bodies/broken.json
     ```
   - Windows PowerShell:
     ```
     curl.exe -i -X POST http://localhost:3000/api/books -H "Content-Type: application/json" --data-binary "@api-bodies/broken.json"
     ```
2. Хариуны статусын мөрийг харна.
3. `curl -i http://localhost:3000/api/books` илгээж хадгалагдсан номуудыг харна.

Хүлээгдэж байсан: Спецификацийн «API: буруу JSON биетэй POST хүсэлтэд 400 алдаа буцаана» дүрмийн дагуу `HTTP/1.1 400 Bad Request`.

Бодит үр дүн: `HTTP/1.1 200 OK`, бие нь `{"result":"OK"}`. GET /api/books-д шинэ ном нэмэгдээгүй — сервер хүсэлтийг амжилттай гэж худал хариулдаг. JSON биш текст (`api-bodies/bad.txt`) илгээхэд ч мөн 200 OK.

Ноцтой байдал: Major — API-г ашигладаг клиент (жишээ нь өөр апп) өгөгдлөө хадгалагдсан гэж буруу ойлгох тул өгөгдөл чимээгүй алдагдана.

Хавсралт: [evidence/bug-05-curl.txt](../evidence/bug-05-curl.txt)

```
HTTP/1.1 200 OK
Content-Type: application/json
Date: Fri, 23 Oct 2026 15:02:27 GMT
Connection: keep-alive
Keep-Alive: timeout=5
Transfer-Encoding: chunked

{"result":"OK"}
```

Олдсон аялал: Saboteur

## Дахин шалгалт (2026-11-04, 13:10)
Аппыг шинээр асааж давтахад согог давтагдсан:
- `bad.txt` ба `broken.json` → `200 OK {"result":"OK"}`, гэхдээ ном хадгалагдаагүй: сервер амжилттай гэж худал хариулдаг. ([retest-bad](../evidence/retest-bad.txt), [retest-broken](../evidence/retest-broken.txt))
- `empty.json` → `201 Created`, id 4; `year3000.json` → `201 Created`, id 5. ([retest-empty](../evidence/retest-empty.txt), [retest-year3000](../evidence/retest-year3000.txt), [retest-get](../evidence/retest-get.txt))
