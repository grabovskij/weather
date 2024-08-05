# Weather App

Приложение для получения информации о текущих погодных условиях и прогнозах погоды для различных городов. Приложение разработано на Dart с использованием Flutter для построения интерфейса.

## Основные функции

- Отображение текущих погодных условий.
- Поиск геолокации по названию города.
- Отображение информации о восходе и закате солнца.
- Кэширование данных с использованием локального хранилища.

## Установка

1. Убедитесь, что у вас установлен Flutter SDK.
2. Клонируйте репозиторий:
   ```sh
   git clone https://github.com/grabovskij/weather.git
   ```
3. Перейдите в папку с проектом:
   ```sh
   cd weather-app
   ```
4. Установите зависимости:
   ```sh
   flutter pub get
   ```

## Использование

Запустите приложение:
```sh
flutter run
```

## Структура проекта

- `lib/`
    - `core/`: основные утилиты и сервисы приложения
        - `di/`: управление зависимостями
        - `services/`: сервисы для работы с данными
        - `utils/`: утилиты, такие как форматирование строк
    - `data/`: работа с источниками данных и локальным хранилищем
        - `data_sources/`: классы для работы с API
        - `repository/`: классы содержащие бизнес-логику извлечения данных 
        - `storages/`: классы для работы с локальным хранилищем
    - `domain/`: модели и бизнес-логика
        - `models/`: модели данных
    - `features/`: основные функциональные модули приложения
        - `geolocation/`: функциональность для работы с геолокацией
        - `home/`: основной экран приложения
    - `ui/`: пользовательский интерфейс
        - `mixins/`: миксины для упрощения работы с UI
        - `widgets/`: пользовательские виджеты
