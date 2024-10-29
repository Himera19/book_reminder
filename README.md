# Flutter Book Reminder

**Kitap Favori ve Hatırlatıcı Uygulaması**

---

## GIF Demo

![Uygulama Önizlemesi](https://github.com/Himera19/flutter_book_reminder/blob/master/app_preview.gif)

---

## Özellikler

- **Kitap Favorileme**: Kullanıcılar, istedikleri kitapları favorilerine ekleyebilir.
- **Kitap Filtreleme**: Kullanıcılar, kitapları aratarak bulabilir.
- **Günlük Hatırlatmalar**: Kullanıcılar, kitapları için günlük hatırlatmalar oluşturabilir.
- **Yerel Depolama**: API üzerinden erişilen kitaplar, Hive ile yerel olarak saklanır, böylece internet bağlantısına ihtiyaç duymadan erişilebilir.
- **Favori Kitaplar**: Favorilere eklenen kitaplar, internet bağlantısı olmadan da erişilebilir ve tamamen yerel olarak depolanır.
- **Tema Seçeneği**: Uygulama, karanlık ve aydınlık olmak üzere iki farklı tema sunar.
- **Dil Desteği**: Uygulama, İngilizce ve Türkçe dillerini destekler.
- **Birim Testi**: Uygulamanın güvenilirliğini artırmak için API sorgu sisteminin test edilmesini sağlar.

## Kullanılan Başlıca Eklentiler

- **Hive**: Kitap verilerini ve kullanıcı tercihlerini yerel olarak saklamak.
- **Provider**: Uygulama bütünlüğünü korumak ve durum yönetimini sağlamak.
- **Flutter Local Notification**: Hatırlatıcılar için bildirimler sağlamak.
- **Flutter Localizations**: İngilizce ve Türkçe dil desteği.
- **HTTP**: API'ye sorgu atmak ve dönen sonuçları işlemek.
- **Mockito**: API sorgularını test etmek için kullanılır.

---

## Kullanım

1. **API Erişimi**: Uygulama, başlangıçta kitap bilgilerini API üzerinden alır.
2. **Yerel Depolama**: Erişilen kitaplar Hive kutularına kaydedilir, böylece daha sonrasında internet bağlantısına ihtiyaç duymadan erişilebilir.
3. **Kitap Detayı**: Seçilen kitabın temel bilgileri görüntülenir ve kullanıcı kitabı favorilerine ekleyebilir.
4. **Favoriler**: Kullanıcılar, favori kitaplarını yerel olarak görüntüleyebilirler.
5. **Hatırlatmalar**: Günlük hatırlatmalar ayarlanabilir ve bu hatırlatmalar yerel olarak saklanır.
6. **Tema ve Dil Seçimi**: Kullanıcılar, tercih ettikleri temayı ve dili seçebilirler.
7. **Filtreleme**: Kullanıcı, aradığı kitabı bulabilir.

---

## Lisans

Bu proje MIT Lisansı altında lisanslanmıştır.
