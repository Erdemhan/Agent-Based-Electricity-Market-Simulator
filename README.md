# 🚀 ABMEM Web Platform

A Dockerized Django-based simulation platform with PostgreSQL integration. This repository enables you to simulate market dynamics using rule-based or intelligent agents. Perfect for research, prototyping, and academic exploration.

---

## 📁 Table of Contents

* [Prerequisites](#prerequisites)
* [Getting Started](#getting-started)

  * [Cloning the Repository](#cloning-the-repository)
  * [Building Docker Containers](#building-docker-containers)
* [Running the Project](#running-the-project)
* [Installing Dependencies](#installing-dependencies)
* [Database Migrations](#database-migrations)

  * [Automatic Migrations](#automatic-migrations)
  * [Manual Migrations](#manual-migrations)
* [Accessing the Application](#accessing-the-application)
* [Development Modes](#development-modes)
* [Intelligent Agents & Collaboration](#intelligent-agents--collaboration)
* [Contributing](#contributing)
* [License](#license)
* [Acknowledgements](#acknowledgements)

---

## ✅ Prerequisites

Make sure you have the following installed:

* 🐳 [Docker](https://docs.docker.com/get-docker/)
* 🧱 [Docker Compose](https://docs.docker.com/compose/install/)
* 🐍 [Python 3.12](https://www.python.org/downloads/)

---

## 🚀 Getting Started

### 🧬 Cloning the Repository

```bash
git clone https://github.com/Erdemhan/Agent-Based-Electricity-Market-Simulator.git
cd abmem_web
```

### 🛠️ Building Docker Containers

```bash
docker-compose up --build
```

This builds both the web and database containers as specified in the `docker-compose.yml` file.

---

## ▶️ Running the Project

To launch the containers (after build):

```bash
docker-compose up
```

To stop the containers:

```bash
docker-compose down
```

---

## 📦 Installing Dependencies

Enter the `web` container:

```bash
docker-compose exec web bash
```

Install Python packages:

```bash
pip install -r requirements.txt
```

To install additional packages:

```bash
pip install pygame matplotlib
```

---

## 🧬 Database Migrations

### ⚙️ Automatic Migrations

On container startup, migrations are applied automatically via the following command inside `docker-compose.yml`:

```bash
python abmem/manage.py makemigrations && python abmem/manage.py migrate
```

### 🛠️ Manual Migrations

If needed:

```bash
docker-compose exec web bash

# Then inside container
python abmem/manage.py makemigrations
python abmem/manage.py migrate
```

---

## 🌐 Accessing the Application

Once containers are up, visit: [http://localhost:8000/dev](http://localhost:8000/dev)

---

## 🔧 Development Modes

To enable live reloading during development without rebuilding the image:

```yaml
volumes:
  - .:/usr/src/app  # Active during development
```

To disable live sync for production builds:

```yaml
volumes:
  - /usr/src/app  # Code is frozen from build
```

Or use `docker-compose.override.yml` for development mode.

---

## 🤖 Intelligent Agents & Collaboration

> ⚠️ **Current version does not include intelligent agents.** Agents submit bids randomly.

However, you can implement and integrate:

* Custom market algorithms (in `market_service.py`)
* Intelligent bidding agents (in `agent_service.py`)

Please reach out for collaboration or integration:

**Contact**: [erdemhan@erciyes.edu.tr](mailto:erdemhan@erciyes.edu.tr)

A development branch including reinforcement learning agents is available at:
[https://github.com/Erdemhan/abmem\_web](https://github.com/Erdemhan/abmem_web)

> ✨ This project has been developed with the support of TUBITAK 3501 and Erciyes University Scientific Research Projects Office.

---

## 📚 Contributing

Pull requests and suggestions are welcome! Please open an issue or submit a PR.

---

## 📄 License

This project is licensed under the **Creative Commons Attribution-NonCommercial 4.0 International License**.  
It also includes third-party software licensed under the **MIT License** (see [LICENSE](./LICENSE.md) file for details).

---

## 👨‍💻 Acknowledgements

**Developer**: Erdemhan Özdin - [https://github.com/Erdemhan](https://github.com/Erdemhan)  Email: erdemhan@erciyes.edu.tr

**Dockerization**: Bengisu Yavuz - [https://github.com/bengisu17](https://github.com/bengisu17)
