# APPUC App

## Dev

1. Clone el repositorio
2. Cree el archivo `.env` en la raíz del proyecto y cree las variables de entorno que se muestran en el archivo `.env.template` con sus respectivos valores.
3. Asegúrate de tener instalado Dart SDK en la versión `^3.5.0` o superior. Puedes verificar la versión instalada ejecutando el siguiente comando en tu terminal:
     ```bash
     dart --version
     ```
   * Si necesitas actualizar la versión, puedes seguir las instrucciones oficiales de Dart.
4.  Descargue las librerías con :

```
flutter pub get
```

5. Corra el proyecto con `F5`



### Extras

1. Para limpiar el build y paquetes ejecutar

```
flutter clean
```

Para reconstruir todo ejecutar

```
flutter pub get
```


2. Para utilizar el generador de modelos mantener activo el siguiente comando

```
dart run build_runner watch
```
