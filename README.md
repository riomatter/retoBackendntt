# retoBackendntt
Reto de backend en karate framework

# Proyecto de Automatización de APIs con Karate Framework

## 📌 Descripción General
Este proyecto implementa **automatización de pruebas de servicios REST** utilizando **[Karate Framework](https://github.com/karatelabs/karate)**.  
El objetivo es validar diferentes operaciones CRUD (`GET`, `POST`, `PUT`, `PATCH`) y el manejo de respuestas de una API pública, incluyendo verificación de códigos de estado y estructura de datos.

Se utiliza un archivo `karate-config.js` para la configuración de variables globales y un **Runner** en Java para la ejecución de los tests desde la línea de comandos o entornos de integración continua.

---

## 📂 Estructura del Proyecto

```
karate-project/
│── src/test/java/BDD/posts/         # Features de prueba
│── karate/resources/request/        # Archivos JSON esperados y payloads
│── karate-config.js                  # Configuración global del proyecto
│── UsersRunner.java                  # Clase runner para ejecutar escenarios
│── pom.xml                           # Configuración de dependencias Maven
└── README.md                         # Documentación del proyecto
```

---

## 🧪 Features Implementadas

### 1️⃣ **Actualizar información de recursos**
Pruebas para validar actualización de usuarios:
- **PUT** – Actualiza todos los campos de un recurso.
- **PATCH** – Actualiza parcialmente un recurso.
- **POST con status 404** – Valida error al intentar crear en endpoint inexistente.

### 2️⃣ **Obtener información de recursos**
Incluye ejemplos de obtención de datos:
- **GET** – Lista completa de usuarios y validación de estructura JSON.
- **GET con status 404** – Validación de error al consultar endpoint inválido.
- **GET con parámetros (`Scenario Outline`)** – Obtiene datos filtrados por `userId`.
- **Ejemplo de obtención de token** *(solo demostrativo)* usando OAuth2.

### 3️⃣ **Crear nuevos recursos**
Pruebas para creación de usuarios:
- **POST** – Crea un nuevo recurso y valida que la respuesta cumpla la estructura esperada.
- **POST con status 404** – Valida respuesta de error ante endpoint inexistente.

---

## ⚙️ Configuración de Dependencias y Plugins (`pom.xml`)
El proyecto está configurado para **Java 21** y utiliza **Maven** como gestor de dependencias.  
Se incluyen las librerías necesarias para **Karate Framework** y **JUnit 5**, así como el plugin `maven-surefire-plugin` para ejecutar pruebas con soporte de codificación UTF-8.

```xml
<properties>
    <maven.compiler.source>21</maven.compiler.source>
    <maven.compiler.target>21</maven.compiler.target>
    <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
</properties>

<dependencies>
    <!-- Karate Core -->
    <dependency>
        <groupId>com.intuit.karate</groupId>
        <artifactId>karate-core</artifactId>
        <version>1.2.0</version>
    </dependency>

    <!-- Karate con JUnit 5 -->
    <dependency>
        <groupId>com.intuit.karate</groupId>
        <artifactId>karate-junit5</artifactId>
        <version>1.2.0</version>
    </dependency>

    <!-- JUnit 5 -->
    <dependency>
        <groupId>org.junit.jupiter</groupId>
        <artifactId>junit-jupiter-api</artifactId>
        <version>5.10.0</version>
    </dependency>
    <dependency>
        <groupId>org.junit.jupiter</groupId>
        <artifactId>junit-jupiter-engine</artifactId>
        <version>5.10.0</version>
    </dependency>
</dependencies>

<build>
    <testResources>
        <testResource>
            <directory>src/test/java</directory>
            <excludes>
                <exclude>**/*.java</exclude>
            </excludes>
        </testResource>
    </testResources>
    <plugins>
        <plugin>
             <groupId>org.apache.maven.plugins</groupId>
             <artifactId>maven-surefire-plugin</artifactId>
             <version>2.22.2</version>
             <configuration>
                <argLine>-Dfile.encoding=UTF-8</argLine>
             </configuration>
        </plugin>
    </plugins>
</build>
```

---

## 🚀 Ejecución del Proyecto

### Desde Maven
```bash
mvn test -Dtest=UsersRunner
```

### Desde IntelliJ IDEA
1. Abrir el proyecto.
2. Ubicar el archivo `UsersRunner.java`.
3. Clic derecho → **Run 'UsersRunner'**.

---

## 📄 Configuración (`karate-config.js`)
Este archivo define:
- Variables globales como `URL`, credenciales y rutas.
- Configuración de entornos (`dev`, `qa`, `prod`).
- Posible manejo de tokens (ejemplo incluido).

---

## 📌 Tecnologías Utilizadas
- **Karate Framework** – Automatización de APIs.
- **Java 21 (Amazon Corretto)** – Lenguaje base para ejecución.
- **Maven 3.9.11** – Gestión de dependencias y ejecución de pruebas.
- **JUnit 5** – Integración con el runner de pruebas.
- **Maven Surefire Plugin 2.22.2** – Ejecución de tests con soporte UTF-8.

---

## 📢 Notas Importantes
- El endpoint de token en el `Background` es **solo demostrativo** y actualmente devuelve `null`.
- Las pruebas usan ejemplos con `jsonplaceholder.typicode.com`, por lo que **no modifican datos reales**.
- Para ejecución en CI/CD, configurar `UsersRunner` y el `karate-config.js` con las variables de entorno necesarias.

---

✍ **Autor:** [Mario Martin Anciburo]  
📅 **Fecha:** Agosto 2025
