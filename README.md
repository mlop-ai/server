## mlop server

This is the collection of services that allow any individual to self-host their own instance of the **mlop** server. It can be used to store, analyze, visualize, and share any data recorded by the latest **mlop** clients or other platforms. It's super easy to get started and we welcome you to try it yourself! All you need is a containerized environment and a minute to spare.

For a managed instance with better scalability, stability and support, please visit [mlop.ai](https://mlop.ai) or contact us at [founders@mlop.ai](mailto:founders@mlop.ai).

### 🚀 Getting Started

#### 0. Ensure you have `docker-compose` (or `podman-compose`) and the current user has access to Docker daemon

```bash
sudo pacman -S docker-compose
# or
sudo apt install docker-compose
# or
sudo port install docker-compose
```

#### 1. Get the repository

```bash
git clone --recurse-submodules https://github.com/mlop-ai/server.git
cd server
git submodule update --rebase --remote
```

#### 2. Edit the `.env` file

```bash
cp .env.example .env
```

#### 3. Let's go!

```bash
sudo docker-compose --env-file .env up --build
```
or to have more granular control over the services,
```bash
sudo docker-compose --env-file .env up -d traefik clickhouse py ingest
```

The server will be swiftly available at `http://localhost:3000`. 

To use the self-hosted server with the client, simply initialize the client with

```python
mlop.init(settings={"host": "localhost"}) # or a specified host matching the CORS policy of the server set by .env
```

### 📲 What's Inside?

- a custom frontend application hosted on `port 3000`
- a custom backend application hosted on `port 3001`
- a Rust server for high-performance data ingestion on `port 3003`
- a Python server for general-purpose health monitoring on `port 3004`
- an S3-compatible storage server on `port 9000`
- a ClickHouse database on `port 9000` (not exposed to host by default)
- a PostgreSQL database on `port 5432` (not exposed to host by default)

### 📦 Moving Servers

You should be aware of all your data stored on the server. That's why the contents of the databases are mapped to directories on the host by default. When you need to migrate the server to a different host, simply make sure you take the `.mlop` folder and `.env` file with you.

### 🤝 Contributing

We welcome any contributions to the project! Please feel free to submit any code, docs, feedback, or examples.

