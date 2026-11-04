# BUG-06: Хуудасны доод талын «Хуучин хувилбар» линк 500 Internal Server Error өгдөг

Орчин: Уншлагын жагсаалт v2.0, Chrome 155.0.8059.85, Windows 10 Pro, 2026-10-23

Урьдчилсан нөхцөл: node app.js-ийг шинээр асаасан (анхны 3 ном), http://localhost:3000 нээлттэй

## Дахин гаргах алхам
1. Хуудасны доод талын «Хуучин хувилбар» линк дарна.

Хүлээгдэж байсан: Спецификацийн «бүх хуудас, линк ажиллана» дүрмийн дагуу хуучин хувилбарын хуудас нээгдэнэ.

Бодит үр дүн: http://localhost:3000/old руу шилжиж, зөвхөн «Internal Server Error» гэсэн текст гарна. `curl -i http://localhost:3000/old` → `HTTP/1.1 500 Internal Server Error`.

Ноцтой байдал: Minor — үндсэн функц (нэмэх, хайх) ажилласаар байгаа ч хэрэглэгчид харагдах линк эвдэрч, серверийн алдаа шууд гарна.

Хавсралт: screenshots/bug-06.jpg · [evidence/bug-06-curl.txt](../evidence/bug-06-curl.txt)

![BUG-06](../screenshots/bug-06.jpg)

```
HTTP/1.1 500 Internal Server Error
Content-Type: text/plain; charset=utf-8
Date: Fri, 23 Oct 2026 15:18:17 GMT
Connection: keep-alive
Keep-Alive: timeout=5
Transfer-Encoding: chunked

Internal Server Error
```

Олдсон аялал: Supermodel
