# flutter_book_reminder

**Kitap Favori ve Hatırlatıcı Uygulaması**

---

## Özellikler

- **Kitap Favorileme**: Kullanıcılar, istedikleri kitapları favorilere ekleyebilir.
- **Günlük Hatırlatmalar**: Kullanıcılar, kitapları için günlük hatırlatmalar oluşturabilir.
- **Yerel Depolama**: API üzerinden kitaplara erişildikten sonra, kitaplar Hive ile yerel olarak saklanır. Bu, internet bağlantısına olan ihtiyacı ortadan kaldırır.
- **Favori Kitaplar**: Favorilere eklenen kitaplar, internet bağlantısı olmadan da erişilebilir ve tamamen yerel olarak saklanır.
- **Tema Seçeneği**: Uygulama, karanlık ve aydınlık olmak üzere iki farklı tema sunar.
- **Dil Desteği**: Uygulama, hem İngilizce hem de Türkçe dillerini destekler.

## Kullanılan Başlıca Eklentiler

- **Hive**: Çekilen kitap verilerini ve kullanıcı tercihlerini yerelde depolamak.
- **Provider**: Uygulama bütünlüğünü korumak ve durum yönetimini sağlamak.
- **Flutter Local Notification**: Hatırlatıcı eklenen kitaptan bildirim almak.
- **Flutter Localizations**: İngilizce ve Türkçe dil desteği.
- **HTTP**: API'ye sorgu atmak ve dönen sorguyu işlemek.

---

## Kurulum ve Kullanım

1. **API Erişimi**: Uygulama, başlangıçta kitap bilgilerini API üzerinden alır.
2. **Yerel Depolama**: Erişilen kitaplar Hive kutularına kaydedilir, böylece internet bağlantısına ihtiyaç duymadan erişilebilir.
3. **Favoriler**: Kullanıcılar, favorilere ekledikleri kitapları lokal olarak görüntüleyebilir.
4. **Hatırlatmalar**: Günlük hatırlatmalar ayarlanabilir ve bu hatırlatmalar yerel olarak saklanır.
5. **Tema ve Dil Seçimi**: Kullanıcılar, tercih ettikleri temayı ve dili seçebilirler.

---

## Lisans

Bu proje MIT Lisansı altında lisanslanmıştır.
