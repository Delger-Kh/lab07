# BUG-05 — Буруу JSON POST хийхэд 400-ын оронд 200 OK буцаана

| Талбар | Утга |
|---|---|
| Олдсон | 2026-10-23, 23:02 (curl-ийн Date толгой 15:02:27 GMT), тэмдэглэл 23:06 |
| Аялал | Saboteur |
| Түвшин | API |
| Ноцтой байдал | Major |
| Давтагдах | Байнга |
| Орчин | Windows 10 Pro · Chrome 155.0.8059.85 · Node v24.13.0 · «Уншлагын жагсаалт» v2.0 (localhost:3000) |

## Алхам
1. Аппыг асаана.
2. Хаалтгүй, эвдэрсэн JSON (`api-bodies/broken.json`) илгээнэ:
   ```
   curl.exe -i -X POST http://localhost:3000/api/books -H "Content-Type: application/json" --data-binary "@api-bodies/broken.json"
   ```

## Хүлээгдэж буй үр дүн
`HTTP/1.1 400 Bad Request` ба алдааны тайлбар. Ном хадгалагдахгүй.

## Бодит үр дүн
`HTTP/1.1 200 OK`, бие нь `{"result":"OK"}`. Сервер JSON-ийн бүтцийг шалгадаггүй.

## Нотолгоо
[evidence/bug-05-curl.txt](../evidence/bug-05-curl.txt)

```
HTTP/1.1 200 OK
Content-Type: application/json
Date: Fri, 23 Oct 2026 15:02:27 GMT
Connection: keep-alive
Keep-Alive: timeout=5
Transfer-Encoding: chunked

{"result":"OK"}
```

## Нэмэлт ажиглалт
Session-ий үеэр `empty.json` (`{}`) ба `year3000.json` (Он 3000) API-аар илгээхэд хоёулаа хадгалагдсан (GET /api/books дээр id 10, 11). Тиймээс серверт оролтын шалгалт огт байхгүй.


## Дахин шалгалт (2026-11-04, 13:10)
Аппыг шинээр асааж давтахад согог давтагдсан:
- `bad.txt` ба `broken.json` → `200 OK {"result":"OK"}`, гэхдээ ном хадгалагдаагүй: сервер амжилттай гэж худал хариулдаг. ([retest-bad](../evidence/retest-bad.txt), [retest-broken](../evidence/retest-broken.txt))
- `empty.json` → `201 Created`, id 4; `year3000.json` → `201 Created`, id 5. ([retest-empty](../evidence/retest-empty.txt), [retest-year3000](../evidence/retest-year3000.txt), [retest-get](../evidence/retest-get.txt))