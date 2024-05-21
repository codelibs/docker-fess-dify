# Docker for Fess and Dify

This project sets up a Docker environment to run Fess, OpenSearch, Dify, and Ollama containers.

## Setup

Run the setup script:

```bash
/bin/bash ./scripts/setup.sh
```

## Run Containers

### For CPU

```bash
docker compose -f compose.yaml -f compose-opensearch2.yaml -f compose-dify.yaml -f compose-ollama.yaml up -d
```

### For GPU

```bash
docker compose -f compose.yaml -f compose-opensearch2.yaml -f compose-dify.yaml -f compose-ollama.yaml -f compose-gpu.yaml up -d
```

## Pull Ollama Model

Pull the required Ollama model:

```bash
docker exec -it ollama ollama pull gemma:instruct
```

## Endpoints

- **Fess**: `http://localhost:8080/`
- **Dify**: `http://localhost:8000/`

## Steps to Configure

1. **Login to Fess**
2. **Create Crawling Config and Start Crawler**
3. **Login to Dify**
4. **Add Ollama Model on Model Provider**
   - Model Name: `gemma:instruct`
   - Base URL: `http://ollama:11434`
   - Completion Mode: `Chat`
5. **Add Fess as Custom Tool**
   - Import from `http://fess:8080/dify/openapi.yaml`
   - Replace `http://localhost:8080` with `http://fess:8080`
6. **Create Chatflow**

## License

This project is licensed under the Apache License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- [Fess](https://github.com/codelibs/fess)
- [Dify](https://github.com/langgenius/dify)
- [OpenSearch](https://github.com/opensearch-project/OpenSearch)
- [Ollama](https://github.com/ollama/ollama)

