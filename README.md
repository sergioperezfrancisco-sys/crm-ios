# CRM iOS

Esqueleto inicial de un CRM para iPhone y iPad con SwiftUI, arquitectura por capas y Supabase preparado para conectarse cuando exista backend. El repositorio contiene un Swift Package (`CRMKit`) con dominio, protocolos, configuración y mocks, además de los archivos de la aplicación (`CRMApp/`) para un target iOS.

## Requisitos

- macOS con Xcode 15 o posterior.
- iOS 16 o posterior.
- Una cuenta/proyecto de Supabase solo si se quiere conectar un backend real.

Este entorno Windows no incluye Swift ni Xcode, por lo que no es posible ejecutar `xcodebuild` aquí. Se ha validado la estructura del package, se han mantenido las dependencias de producción en Foundation y se incluyen tests unitarios para ejecutarse en macOS/Xcode.

## Abrir en Xcode

1. Abre `Package.swift` en Xcode y añade el paquete local `CRMKit` al proyecto iOS, o crea un proyecto **iOS App** llamado `CRMApp` en Xcode.
2. Arrastra los archivos de `CRMApp/` al target de la aplicación.
3. Añade `CRMKit` como dependencia local del target.
4. Selecciona un simulador iPhone o iPad y ejecuta.

La app arranca con datos mock y ofrece pestañas para Dashboard, Contactos, Oportunidades, Agenda y Reportes.

## Supabase sin secretos en el repositorio

La configuración se resuelve mediante variables de entorno (`SUPABASE_URL` y `SUPABASE_ANON_KEY`) o mediante un archivo local `Supabase.local.plist`. Copia `Supabase.local.plist.example` como `Supabase.local.plist`, añádelo únicamente al target local y no lo confirmes: está ignorado por `.gitignore`.

`SupabaseConfiguration` solo lee esos valores; no contiene credenciales reales ni crea clientes de red todavía. La capa de repositorios está definida con protocolos async para poder sustituir los mocks por una implementación Supabase y probar la UI sin backend.

## Estructura

```text
CRMApp/                         Aplicación SwiftUI y navegación
Sources/CRMKit/Domain/          Modelos y protocolos de repositorio
Sources/CRMKit/Infrastructure/  Mocks y configuración de Supabase
Tests/CRMKitTests/              Tests del núcleo
web/                            Frontend web Vite + React + TypeScript
```

## CRM web (acceso desde navegador)

La carpeta `web/` contiene una versión web responsive del CRM, con la misma navegación y conceptos de dominio que la app SwiftUI: Dashboard, Contactos, Oportunidades, Agenda y Reportes. Se publica automáticamente en GitHub Pages al hacer push a `main`, por lo que el usuario puede abrirla desde Windows, macOS, iPhone o cualquier navegador sin instalar Node.js:

**URL pública:** `https://sergioperezfrancisco-sys.github.io/crm-ios/`

La URL estará disponible después de que termine el workflow **Deploy CRM web to GitHub Pages**. En la configuración del repositorio, activa **Settings → Pages → Source: GitHub Actions** una sola vez si GitHub Pages aún no está habilitado.

### Desarrollo opcional

Solo hace falta Node.js 20+ para modificar la aplicación localmente. Para usarla no se necesita ninguna instalación.

Desde PowerShell:

```powershell
cd web
npm install
npm run dev
```

Para comprobar una compilación de producción:

```powershell
npm run lint
npm run build
npm run preview
```

El workflow ejecuta estos pasos automáticamente en GitHub-hosted runners. No es necesario ejecutarlos en el ordenador del usuario.

### Datos locales y copias de seguridad

La web no necesita cuenta, servidor ni Supabase. En la primera visita carga datos de ejemplo y, desde ese momento, guarda contactos, oportunidades, citas y cambios en `localStorage` del navegador. Los datos permanecen en ese navegador y dispositivo; borrar los datos del sitio o usar otro dispositivo crea un espacio independiente.

Desde **Configuración** puedes descargar una copia JSON o restaurarla con **Importar copia JSON**. La copia es local y no contiene secretos. Si no existe una copia guardada, la app vuelve a cargar los datos de ejemplo incluidos en `web/src/data.ts`.
