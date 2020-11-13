# MSU Firebase Example

Чтобы собрать проект:

**Android**
1. Создать Android-приложение в [Firebase Console](https://console.firebase.google.com/)
2. Скачать файл google-services.json (один из шагов при создании Android-приложения)
3. Положить файл google-services.json в директорию `[project]/android/app/`

**iOS**
1. Создать iOS-приложение в [Firebase Console](https://console.firebase.google.com/)
2. Скачать файл GoogleService-Info.plist (один из шагов при создании iOS-приложения)
3. Открыть директорию проекта `[project]/ios/` в XCode
4. Слева выбирать Runner, далее: File → Add Files to Runner
5. Выбирать файл GoogleService-Info.plist, убедиться что включен пункт: "Copy items if needed"

**Web**
1. Создать Web-приложение в [Firebase Console](https://console.firebase.google.com/)
2. Скопировать код из шага "Add Firebase SDK"
3. Добавить скопированный код в `[project]/web/index.html`, заменив комментарий `<!-- Add copied code here -->`