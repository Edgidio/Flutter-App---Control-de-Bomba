# Control de Bomba - Flutter App

Esta aplicación Flutter está diseñada para realizar peticiones a un pequeño servidor desarrollado en **MicroPython**, el cual utiliza un servidor HTTP básico. La aplicación se conecta a este servidor para controlar el estado de una bomba automática, permitiendo encenderla o apagarla remotamente desde un dispositivo móvil.

## Descripción

La app envía solicitudes HTTP a un microservicio en MicroPython que corre en una red local. El servidor responde con el estado de la bomba y, en función de la respuesta, la aplicación muestra notificaciones de éxito o error.

### Características:
- **Encender la bomba**: Realiza una solicitud HTTP GET para activar la bomba.
- **Apagar la bomba**: Realiza una solicitud HTTP GET para desactivar la bomba.
- **Notificaciones**: Muestra notificaciones para indicar el estado de la solicitud (éxito o error).
- **Red local**: La app y el servidor deben estar en la misma red local.

## Estructura de la API

La API del servidor MicroPython responde con una estructura simple:

- **Endpoint para encender la bomba**: `/prender`
- **Endpoint para apagar la bomba**: `/apagar`

### Ejemplo de respuesta de la API:

```json
{
  "status": "success",
  "message": "Luz apagada y temporizador detenido"
}
```

## Instalación y Configuración

1. Clona este repositorio en tu máquina local.

2. Instala los paquetes necesarios ejecutando:

   ```bash
   flutter pub get
   ```

## Requerimientos

- **Flutter SDK**
- **Servidor MicroPython** corriendo en la misma red local
- **Permisos de red** en el dispositivo móvil

## Permisos

La app requiere los siguientes permisos para funcionar correctamente:

```xml
<uses-permission android:name="android.permission.INTERNET" />
```

## Consideraciones

- Asegúrate de que el dispositivo móvil y el servidor MicroPython estén conectados a la misma red local.
- Si la conexión falla, revisa la configuración del firewall y la red para permitir tráfico en los puertos del servidor MicroPython (por defecto, el puerto es 8082).
