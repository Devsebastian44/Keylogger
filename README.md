# 🛡️ Sentinel Framework: Educational Keylogger & Research Tool


[![GitLab Pipeline Status](https://img.shields.io/gitlab/pipeline-status/github-backup4/keylogger-research?branch=main&gitlab_url=https%3A%2F%2Fgitlab.com&label=GitLab%20CI)](https://gitlab.com/github-backup4/keylogger-research/-/pipelines)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Python: 3.9+](https://img.shields.io/badge/Python-3.9+-blue.svg)](https://www.python.org/)
[![Security: Bandit](https://img.shields.io/badge/Security-Checked-green.svg)](https://github.com/PyCQA/bandit)

Este proyecto es un **Framework de Ciberseguridad Educativa** diseñado para demostrar los principios de captura de eventos, persistencia y exfiltración de datos en entornos controlados de laboratorio.

> [!IMPORTANT]
> **DISCLAIMER ÉTICO:** Este software ha sido desarrollado exclusivamente con fines educativos y de investigación. El uso de esta herramienta contra objetivos sin consentimiento previo es ilegal y poco ético. El autor no se hace responsable del mal uso de este código.

---

## 🏗️ Arquitectura del Sistema

El proyecto sigue una estructura modular y escalable pensada para entornos DevSecOps profesonales:

| Carpeta | Propósito |
| :--- | :--- |
| `src/` | Núcleo del framework y lógica de captura. |
| `tests/` | Pruebas de integración y simulación de comportamiento. |
| `docs/` | Documentación técnica detallada y políticas de ética. |
| `diagrams/` | Visualización de flujos de datos y arquitectura. |
| `configs/` | Archivos de configuración y dependencias. |

---

## 🔒 Estrategia de Seguridad (GitHub vs GitLab)

Este repositorio utiliza una estrategia de **Diferenciación de Entornos**:

- **GitHub (Público):** Escaparate para portafolio. Contiene la estructura, documentación, diagramas y **pseudocódigo educativo** para evitar la distribución de malware funcional.
- **GitLab (Privado):** Laboratorio de desarrollo. Contiene la implementación completa, payloads funcionales, tests automatizados y el pipeline de CI/CD con análisis estático de seguridad (SAST).

---

## 🚀 Instalación y Uso (Laboratorio Privado)

> [!NOTE]
> Estas instrucciones son para el entorno de desarrollo en **GitLab**. El acceso a la implementación completa está restringido.

1. **Clonar el repositorio:**
   ```bash
   git clone https://gitlab.com/github-backup4/keylogger-research.git
   ```
2. **Configurar entorno:**

   ```bash
   python -m venv venv
   source venv/bin/activate
   pip install -r configs/requirements.txt
   ```
3. **Ejecutar en modo educativo:**

   ```bash
   python src/main.py --mode dry-run
   ```

---

## 🛠️ Pipeline DevSecOps

El proyecto integra un flujo de trabajo automatizado en GitLab Cielo:

- **Linting:** Validación de estándares de código.
- **SAST:** Escaneo de vulnerabilidades con `bandit`.
- **Unit Testing:** Validación de módulos con `pytest`.

---

## 📝 Documentación Adicional

- [Guía de Ética y Legalidad](docs/ethics.md)
- [Arquitectura Detallada](docs/architecture.md)
- [Diagramas de Flujo](diagrams/data_flow.md)
