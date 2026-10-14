# Charter

Судлах: "Уншлагын жагсаалт" апп — ном нэмэх форм, хүснэгт, хайлт, устгах, «Нийт ном» тоолуур, /api/books API
Ашиглан: хоосон/хил хязгаарын/буруу оролт (он 999, 1000, 2100, 2101, бутархай, текст), давхардал, том/жижиг үсгээр хайх, маш урт текст, curl-ээр буруу JSON илгээх
Илрүүлэх: шалгалт (validation) дутуу, буруу/алдаатай мессеж, тоолуурын зөрүү, хайлтын алдаа, хүснэгт эвдрэх, буруу HTTP статус, ажиллахгүй линк

## Сонгосон аялалууд

- Couch Potato (Hotel district): <reason, e.g. all 3 fields are required, so empty/minimal input directly tests that rule>
- Saboteur (Seedy district): <reason, e.g. the spec requires 400 for bad JSON, so attack the API with curl>
- Supermodel (Tourist district): <reason, e.g. button color, message typos and table layout are visible UI rules>
- FedEx (Business district): <reason, e.g. follow one book through add → table → counter → search → delete>