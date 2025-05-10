# 🌉 CoreBridge – Integração Multiplataforma com Bibliotecas Nativas

[![Android Library](https://img.shields.io/badge/Android-AAR-3DDC84?style=for-the-badge&logo=android&logoColor=white)](https://developer.android.com/studio/projects/android-library)
[![Flutter Plugin](https://img.shields.io/badge/Flutter-Plugin-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev/)
[![React Native Bridge](https://img.shields.io/badge/React%20Native-Bridge-61DAFB?style=for-the-badge&logo=react&logoColor=white)](https://reactnative.dev/)
[![Educational Project](https://img.shields.io/badge/Type-Educational-blue?style=for-the-badge&logo=bookstack&logoColor=white)](https://github.com/matheusjuan1)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow?style=for-the-badge)](https://opensource.org/licenses/MIT)

Este repositório demonstra uma **ponte de integração entre código nativo (Pascal)** e aplicações modernas em **Android, Flutter e React Native**.

---

## 🧭 Visão Geral do Projeto

O projeto é dividido em múltiplos módulos com responsabilidades bem definidas:

| Módulo               | Linguagem            | Função                                                                |
|----------------------|----------------------|-----------------------------------------------------------------------|
| **CoreBridge**       | Pascal               | Biblioteca nativa compilada em `.so` com funções e lógica principal  |
| **CoreBridgeLib**    | Java (Android)       | Biblioteca wrapper que se comunica com `.so` via JNA e gera `.aar`    |
| 🟢 **CoreBridgeAndroid**| Kotlin               | Aplicativo Android exemplo que consome o `.aar`                       |
| 🔵 **CoreBridgeFlutter**| Flutter + Kotlin     | Aplicativo Flutter exemplo que consome o `.aar` via Plugin            |
| 🟣 **CoreBridgeReact**  | React Native + Kotlin| Aplicativo React Native que consome o `.aar` via bridge nativo        |

### ➡️ Fluxo

```bash
  CoreBridge (Pascal/.so)
            ↓
  CoreBridgeLib (Java/.aar)
     ↓      ↓       ↓
 Android  Flutter  React Native
  (🟢)     (🔵)       (🟣)
```


---

## 📚 Como estudar ou reutilizar

Este repositório é ideal para quem deseja:

- Criar **plugins multiplataforma** a partir de uma biblioteca em Pascal ou C/C++
- Entender o processo de **empacotar uma `.so` dentro de um `.aar`**
- Reaproveitar lógicas legadas Delphi/Pascal em **apps mobile modernos**

---

## ⚙️ Scripts de Build

Automatize a distribuição do .aar para os projetos de exemplo 🟢 Android, 🔵 Flutter e 🟣 React Native

- `build-core-bridge.sh` (Linux/macOS)
- `build-core-bridge.bat` (Windows)
- `GitHub Actions`

---

## 📝 Licença

Este projeto está sob a licença MIT.

Feito por Matheus Juan. [Entre em contato](https://www.linkedin.com/in/matheusjuan1/)

<div align="center">
  <img width="60" alt="Image" src="https://github.com/user-attachments/assets/efd1d014-148c-4ae8-8dbd-81850fadf9ba" />
</div>


