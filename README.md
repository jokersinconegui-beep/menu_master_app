# 🍔 MenuMaster

Aplicación de gestión de pedidos para restaurantes desarrollada con **Flutter**, **Clean Architecture** y **BLoC**.

## 📱 Características

- Autenticación de usuarios (cliente, cocina, admin)
- Visualización de menú por categorías
- Carrito de compras
- Historial de pedidos
- Panel de cocina (próximamente)

## 🛠️ Tecnologías

- **Flutter** 3.x
- **Dart** 3.x
- **Clean Architecture** (capa data, domain, presentation)
- **BLoC** para gestión de estado
- **GetIt** para inyección de dependencias
- **Dio** para peticiones HTTP
- **GoRouter** para navegación
- **JSON Server** como backend de prueba

## 🚀 Cómo ejecutar

1. Clonar el repositorio
2. Ejecutar `flutter pub get`
3. Iniciar JSON Server: `json-server --watch db.json --port 3000 --host 0.0.0.0`
4. Ejecutar `flutter run`

## 📱 Capturas de pantalla

| Login | Home | Carrito |
|-------|------|---------|
| ![Login](screenshots/login.png) | ![Home](screenshots/home.png) | ![Cart](screenshots/cart.png) |

## 📄 Licencia

MIT