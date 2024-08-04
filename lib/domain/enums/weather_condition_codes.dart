/// Перечисление кодов погодных условий.
///
/// Используется для представления различных погодных условий с кодами, соответствующими OpenWeatherMap API.
enum WeatherConditionCode {
  // Группа 2xx: Гроза
  /// Гроза с небольшим дождем (код 200)
  thunderstormWithLightRain(200),

  /// Гроза с дождем (код 201)
  thunderstormWithRain(201),

  /// Гроза с сильным дождем (код 202)
  thunderstormWithHeavyRain(202),

  /// Легкая гроза (код 210)
  lightThunderstorm(210),

  /// Гроза (код 211)
  thunderstorm(211),

  /// Сильная гроза (код 212)
  heavyThunderstorm(212),

  /// Разорванная гроза (код 221)
  raggedThunderstorm(221),

  /// Гроза с небольшим моросящим дождем (код 230)
  thunderstormWithLightDrizzle(230),

  /// Гроза с моросящим дождем (код 231)
  thunderstormWithDrizzle(231),

  /// Гроза с сильным моросящим дождем (код 232)
  thunderstormWithHeavyDrizzle(232),

  // Группа 3xx: Моросящий дождь
  /// Легкий моросящий дождь (код 300)
  lightIntensityDrizzle(300),

  /// Моросящий дождь (код 301)
  drizzle(301),

  /// Сильный моросящий дождь (код 302)
  heavyIntensityDrizzle(302),

  /// Легкий моросящий дождь с дождем (код 310)
  lightIntensityDrizzleRain(310),

  /// Моросящий дождь с дождем (код 311)
  drizzleRain(311),

  /// Сильный моросящий дождь с дождем (код 312)
  heavyIntensityDrizzleRain(312),

  /// Ливень и моросящий дождь (код 313)
  showerRainAndDrizzle(313),

  /// Сильный ливень и моросящий дождь (код 314)
  heavyShowerRainAndDrizzle(314),

  /// Моросящий ливень (код 321)
  showerDrizzle(321),

  // Группа 5xx: Дождь
  /// Легкий дождь (код 500)
  lightRain(500),

  /// Умеренный дождь (код 501)
  moderateRain(501),

  /// Сильный дождь (код 502)
  heavyIntensityRain(502),

  /// Очень сильный дождь (код 503)
  veryHeavyRain(503),

  /// Экстремально сильный дождь (код 504)
  extremeRain(504),

  /// Ледяной дождь (код 511)
  freezingRain(511),

  /// Легкий моросящий дождь с ливнем (код 520)
  lightIntensityShowerRain(520),

  /// Ливневый дождь (код 521)
  showerRain(521),

  /// Сильный ливневый дождь (код 522)
  heavyIntensityShowerRain(522),

  /// Разорванный ливневый дождь (код 531)
  raggedShowerRain(531),

  // Группа 6xx: Снег
  /// Легкий снег (код 600)
  lightSnow(600),

  /// Снег (код 601)
  snow(601),

  /// Сильный снег (код 602)
  heavySnow(602),

  /// Снег с дождем (код 611)
  sleet(611),

  /// Легкий снег с дождем (код 612)
  lightShowerSleet(612),

  /// Снег с ливнем (код 613)
  showerSleet(613),

  /// Легкий дождь со снегом (код 615)
  lightRainAndSnow(615),

  /// Дождь со снегом (код 616)
  rainAndSnow(616),

  /// Легкий ливневый снег (код 620)
  lightShowerSnow(620),

  /// Ливневый снег (код 621)
  showerSnow(621),

  /// Сильный ливневый снег (код 622)
  heavyShowerSnow(622),

  // Группа 7xx: Атмосферные явления
  /// Туман (код 701)
  mist(701),

  /// Дымка (код 711)
  smoke(711),

  /// Легкий туман (код 721)
  haze(721),

  /// Вихри песка/пыли (код 731)
  sandDustWhirls(731),

  /// Сильный туман (код 741)
  fog(741),

  /// Песчаная буря (код 751)
  sand(751),

  /// Пыльная буря (код 761)
  dust(761),

  /// Вулканический пепел (код 762)
  volcanicAsh(762),

  /// Шквалы (код 771)
  squalls(771),

  /// Торнадо (код 781)
  tornado(781),

  // Группа 800: Ясное небо
  /// Ясное небо (код 800)
  clearSky(800),

  // Группа 80x: Облака
  /// Небольшая облачность (код 801)
  fewClouds(801),

  /// Рассеянная облачность (код 802)
  scatteredClouds(802),

  /// Разорванная облачность (код 803)
  brokenClouds(803),

  /// Сплошная облачность (код 804)
  overcastClouds(804);

  /// Идентификатор кода погодного условия.
  final int id;

  /// Конструктор для создания кода погодного условия.
  const WeatherConditionCode(this.id);

  /// Метод для получения [WeatherConditionCode] из идентификатора.
  ///
  /// Возвращает [WeatherConditionCode], соответствующий переданному идентификатору.
  /// Если идентификатор не найден, возвращает [WeatherConditionCode.fewClouds].
  static WeatherConditionCode fromId(int id) {
    return WeatherConditionCode.values.firstWhere(
      (value) => value.id == id,
      orElse: () => WeatherConditionCode.fewClouds,
    );
  }
}
