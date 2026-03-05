## mlop server

This is the collection of services that allow any individual to self-host their own instance of the **mlop** server. It can be used to store, analyze, visualize, and share any data recorded by the latest **mlop** clients or other platforms. It's super easy to get started and we welcome you to try it yourself! All you need is a containerized environment and a minute to spare.

For a managed instance with better scalability, stability and support, please visit [mlop.ai](https://mlop.ai) or contact us at [founders@mlop.ai](mailto:founders@mlop.ai).

### 🚀 Getting Started

```bash
git clone --recurse-submodules https://github.com/mlop-ai/server.git && cd server
cp .env.example .env
sudo docker-compose up --build
```
The web server will be available at `http://localhost:3000`. To use this self-hosted server with the **mlop** client, simply initialize the client with

```python
mlop.login(settings={"host": "localhost"})
mlop.init(settings={"host": "localhost"})
```

### 📲 What's Inside?

- custom frontend and backend hosted on `port 3000` and `port 3001`
- a Rust server for high-performance data ingestion on `port 3003`
- a Python server for general-purpose health monitoring on `port 3004`
- an S3-compatible storage server on `port 9000`
- a ClickHouse database on `port 9000` (not exposed to host by default)
- a PostgreSQL database on `port 5432` (not exposed to host by default)

### 📦 Moving Servers

All data are wholly controlled by the user, and locally mapped to directories on the host by default. When you need to migrate the server to a different host, simply make sure you take the `.mlop` folder and `.env` file with you.

### 🤝 Contributing

We welcome any contributions to the project! Please feel free to submit any code, docs, feedback, or examples.

