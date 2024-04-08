# bloc_learning -> Aprendiendo del video de Fernando Herrera, [url](https://www.youtube.com/watch?v=QXygNzvbsa8&list=PLCKuOXG0bPi3P1T460Dgh9G_1JVMIeUaX&index=5)
Empieza usando pubspec assist para instalar las dependencias necesarias:
flutter_bloc, bloc, equatable, get_it

# La forma de estructurar el proyecto, será la combinación de tres patrones de diseño:
- De la forma oficial de Flutter BLoC: [url](https://bloclibrary.dev/architecture/)
- De la forma de Fernando Herrera: Propia de este proyecto.
- De la web Code With Andrea: [url](https://codewithandrea.com/articles/flutter-project-structure/)

# Estructura de carpetas:
```
- lib
  - config
    - helpers
    - router
    - theme
  - data
  - domain
  - application 
    - blocs
    - presentation
      - pages
          - blocs
          - models
          - view
          - widgets
    app.dart
  - main.dart

```