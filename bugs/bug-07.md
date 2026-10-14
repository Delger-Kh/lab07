# BUG-07: POST /api/books буруу JSON биетэй хүсэлтэд 400 биш 200 OK буцаана

Орчин: Уншлагын жагсаалт v2.0, Google Chrome 155.0.8059.79, Windows 10 22H2 (19045.7725), 2026-10-14
Урьдчилсан нөхцөл: `node app.js`-ийг шинээр асаасан (анхны 3 ном)

## Дахин гаргах алхам
1. Git Bash-д дараах командыг ажиллуулна:
   `curl -i -X POST localhost:3000/api/books -H 'Content-Type: application/json' -d 'not json at all'`
2. (Хувилбар) Дутуу JSON:
   `curl -i -X POST localhost:3000/api/books -H 'Content-Type: application/json' -d '{"title": "broken'`

Хүлээгдэж байсан: «API: буруу JSON биетэй POST хүсэлтэд 400 алдаа буцаана.»

Бодит үр дүн: Хоёр хүсэлт хоёулаа `HTTP/1.1 200 OK`, биe нь `{"result":"OK"}` — клиент хүсэлт амжилтгүй болсныг мэдэх боломжгүй.

Ноцтой байдал: Major — API-ийн гэрээ зөрчигдөж, клиент талд алдааг илрүүлэх, засах боломжгүй болно.

Хавсралт: evidence/bug-07-curl.txt (curl -i бүтэн гаралт)

Олдсон аялал: Saboteur
