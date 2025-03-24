# Valorant Ajanlar Uygulaması

Valorant API kullanarak ajanları ve yeteneklerini gösteren, favorilere ekleme ve not alma özelliklerine sahip bir Flutter uygulaması.

## 📱 Özellikler

- Tüm Valorant ajanlarını görüntüleme
- Detaylı ajan bilgilerini inceleme
- Rollere göre filtreleme
- Arama fonksiyonu
- Ajanlara özel notlarla favorilere ekleme
- Karanlık/Aydınlık tema desteği
- Çoklu dil desteği (TR/EN)
- Çevrimdışı kullanım için önbellekleme
- Responsive tasarım

## 📱 Uygulama Önizlemesi

### Ana Ekran ve Ajan Detayları
![Ana Ekran ve Detaylar](gif/1.gif)

### Favori Ajanlar
![Favori Ajanlar](gif/2.gif)

### Arama ve Filtreleme
![Arama Özellikleri](gif/3.gif)

### Tema Değiştirme
![Tema Değiştirme](gif/4.gif)

### Dil Seçenekleri
![Dil Değiştirme](gif/5.gif)

## 🛠 Teknoloji Altyapısı

### Ana Paketler
- **Durum Yönetimi**: [Stacked](https://pub.dev/packages/stacked)
- **Ağ İşlemleri**: [Dio](https://pub.dev/packages/dio)
- **Yerel Depolama**: [Hive](https://pub.dev/packages/hive)
- **Lokalizasyon**: [Easy Localization](https://pub.dev/packages/easy_localization)
- **Bağımlılık Enjeksiyonu**: [Get It](https://pub.dev/packages/get_it)
- **Animasyonlar**: [Lottie](https://pub.dev/packages/lottie)
- **Kod Üretimi**: [Build Runner](https://pub.dev/packages/build_runner)

### Modül Yapısı ve Bağımlılıklar
```
module/
├── core/                  # Temel altyapı modülü
│   ├── lib/              # Core fonksiyonlar ve utilities
│   └── dependencies:     
│       └── very_good_analysis
│
├── common/               # Ortak bileşenler modülü
│   ├── lib/              # Shared widgets ve utilities
│   └── dependencies:
│       ├── cached_network_image
│       └── shimmer
│
├── widgets/              # UI bileşenleri modülü
│   ├── lib/              # Reusable widgets
│   └── dependencies:
│       ├── responsive_framework
│       └── shimmer
│
└── gen/                  # Kod üretimi modülü
    ├── lib/              # Generated code ve assets
    └── dependencies:
        ├── envied
        ├── dio_nexus
        ├── equatable
        ├── json_annotation
        ├── flutter_svg
        └── lottie
```

### Modül Özellikleri

#### Core Module
- Temel altyapı fonksiyonları
- Cache yönetimi (Hive implementasyonu)
- Utility sınıfları
- Extension metodları
- Base sınıflar

#### Common Module
- Shared widget'lar
- Custom network image handling
- Loading indicators
- Error widgets
- Toast mesajları
- Keyboard yönetimi

#### Widgets Module
- Reusable UI bileşenleri
- Custom animations
- Form elemanları
- Layout bileşenleri
- Responsive tasarım araçları

#### Gen Module
- Asset yönetimi (flutter_gen)
- Environment değişkenleri (envied)
- Model sınıfları (json_serializable)
- API response tipleri
- SVG ve Lottie asset yönetimi

### Geliştirme Araçları
- **Analiz**: very_good_analysis
- **Kod Üretimi**: build_runner
- **Test**: mockito, golden_toolkit
- **CI/CD**: flutter_launcher_icons

## 🏗 Proje Yapısı

```
lib/
├── app/                    # Uygulama konfigürasyonu
├── product/               # Ürüne özel implementasyonlar
│   ├── cache/            # Önbellekleme modelleri
│   ├── config/           # Uygulama ayarları
│   ├── init/            # Başlangıç mantığı
│   ├── manager/         # Yöneticiler (Network, Error, vb.)
│   └── widget/          # Yeniden kullanılabilir widgetlar
├── repository/           # Repository pattern implementasyonu
│   ├── agent/           # Ajan repository
│   └── favorite_agent/  # Favori ajan repository
├── services/            # Servis katmanı
├── ui/                  # UI katmanı
│   ├── themes/         # Tema konfigürasyonu
│   └── views/          # Uygulama ekranları
└── main.dart           # Giriş noktası
```

## 🔧 Konfigürasyon

### Ortam Değişkenleri

Uygulama, geliştirme ve üretim için farklı ortam konfigürasyonları kullanır. Ortam dosyaları `assets/env/` dizininde bulunur:

- `.dev.env`: Geliştirme ortamı konfigürasyonu
- `.prod.env`: Üretim ortamı konfigürasyonu

### API Konfigürasyonu

Uygulama Valorant API'sini kullanır:
- Base URL: https://valorant-api.com/v1
- Uç Noktalar:
  - `/agents`: Tüm ajanları getir
  - `/agents/{agentUuid}`: Ajan detaylarını getir
  - `/agents?isPlayableCharacter=true`: Oynanabilir karakterleri getir

## 🎯 Mimari

Uygulama MVVM pattern ile temiz mimari prensiplerini takip eder:

1. **View Katmanı**: UI bileşenleri ve ekranlar
2. **ViewModel Katmanı**: İş mantığı ve durum yönetimi
3. **Repository Katmanı**: Veri işlemleri soyutlaması
4. **Service Katmanı**: Temel servis implementasyonları
5. **Product Katmanı**: Uygulamaya özel implementasyonlar

### Temel Bileşenler

- **ApplicationInitialize**: Uygulama başlatma ve kurulum işlemleri
- **AppEnvironment**: Ortam konfigürasyonu yönetimi
- **ProductCacheService**: Yerel veri önbellekleme
- **NetworkErrorManager**: Ağ hatası yönetimi
- **ThemeService**: Tema yönetimi

## 🎨 UI Bileşenleri

### Özel Widget'lar

- **CustomNetworkImage**: Resim yükleme ve önbellekleme
- **LottieError**: Hata durumu animasyonu
- **LottieNotFound**: Bulunamadı durumu animasyonu
- **LottieNoInternetConnection**: Ağ hatası animasyonu

### Tema Desteği

Uygulama hem açık hem koyu tema destekler:
- Kalıcı tema seçimi
- Her tema için özel renk şemaları
- ScreenUtil ile responsive boyutlandırma

## 📱 Ekran Görüntüleri

[Ekran görüntüleri eklenecek]

## 🔒 Güvenlik

- Ortam değişkenleri Envied ile şifrelenir
- API yanıtları Hive ile güvenli şekilde önbelleklenir
- Hassas veriler düz metin olarak saklanmaz

## 🙏 Teşekkürler

- Kod incelemesi için teşekkürler

## 💡 Kullanım Örnekleri

### API Kullanımı

```dart
// Ajan listesini getirme
final agents = await agentRepository.getAgentsFromRemote();

// Belirli bir ajanın detaylarını getirme
final agent = await agentRepository.getAgentByIdFromRemote(id: 'agent-uuid');
```

### Widget Kullanımı

```dart
// Özel network image kullanımı
CustomNetworkImage(
  imageUrl: agent.displayIcon,
  height: 200,
  width: 200,
)

// Lottie animasyon kullanımı
const LottieError()
```

### Tema Kullanımı

```dart
// Tema değiştirme
ThemeService().updateThemeMode(AppThemeMode.dark);

// Tema renkleri kullanımı
context.theme.appThemeColors.primary
```

### Önbellekleme Kullanımı

```dart
// Önbelleğe veri kaydetme
await productCache.agentCacheOperation.add(AgentCacheModel(agent: agent));

// Önbellekten veri okuma
final cachedAgent = await productCache.agentCacheOperation.get(agentId);
```
