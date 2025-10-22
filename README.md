# Bible Gematria Interlinear Explorer

A Flask web application for exploring Bible texts with gematria calculations, Strong's Concordance integration, and manuscript viewing capabilities.

## Features

- **Bible Text Explorer**: Navigate through Bible verses with interlinear display
- **Gematria Calculator**: Calculate numerical values of Hebrew and Greek words
- **Strong's Concordance**: Integrated Strong's number definitions and transliterations
- **Manuscript Viewer**: View Leningrad Codex images
- **Search Functionality**: Search by verse reference, Strong's numbers, gematria values, or English text
- **Caching**: Flask-Caching for improved performance

## Quick Start with Docker

### Prerequisites
- Docker installed on your system
- Git (for cloning the repository)

### Build and Run

1. **Clone the repository**:
   ```bash
   git clone <your-github-repo-url>
   cd Bible-Gematria-Interlinear-Explorer
   ```

2. **Download required data files** (these are too large for GitHub):
   - **Complete.db** (178MB): Download from the original source or contact the repository maintainer
   - **LC_/ directory** (2.7GB): Contains Leningrad Codex manuscript images - download from the original source
   
   Place these files in the project root directory:
   ```
   Bible-Gematria-Interlinear-Explorer/
   ├── Complete.db          # Download and place here
   ├── LC_/                 # Download and place here
   ├── static/              # Already included
   └── ... (other files)
   ```

3. **Build the Docker image**:
   ```bash
   docker build -t bible-gematria-app .
   ```

4. **Run the container**:
   ```bash
   docker run -p 8000:8000 bible-gematria-app
   ```

5. **Access the application**:
   Open your browser and go to `http://localhost:8000`

### Using the Test Script

The repository includes a test script for easy building and verification:

```bash
chmod +x docker-test.sh
./docker-test.sh
```

## Project Structure

```
├── myproject.py          # Main Flask application
├── wsgi.py               # WSGI entry point
├── Complete.db           # SQLite database with Bible data
├── static/               # Static assets (CSS, JS, fonts, icons)
├── LC_/                  # Leningrad Codex manuscript images
├── Dockerfile            # Docker configuration
├── requirements.txt      # Python dependencies
└── docker-test.sh        # Build and test script
```

## API Endpoints

- `/` - Main application interface
- `/explorer` - Bible verse explorer
- `/strongs` - Strong's Concordance search
- `/gematria` - Gematria value search
- `/english` - English text search
- `/LC_/<filename>` - Manuscript images
- `/test-lc` - Test endpoint for LC_ directory access

## Development

### Local Development Setup

1. **Install Python dependencies**:
   ```bash
   pip install -r requirements.txt
   ```

2. **Run the Flask application**:
   ```bash
   python myproject.py
   ```

### Docker Development

For x86-64 architecture specifically:

```bash
# Build for x86-64 platform
docker build --platform linux/amd64 -t bible-gematria-app .

# Run the container
docker run --platform linux/amd64 -p 8000:8000 bible-gematria-app
```

## Configuration

The application uses the following configuration:
- **Database**: SQLite (`Complete.db`)
- **Cache**: Filesystem cache in `CACHED_PAGES/`
- **Port**: 8000 (configurable via Docker)
- **Workers**: 3 Gunicorn workers

## Requirements

- Python 3.12+
- Flask 2.3.3
- Flask-Caching 2.1.0
- dataset 1.6.2
- gunicorn 21.2.0

## License

This project is for educational and research purposes.

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## Support

For issues and questions, please create an issue in the GitHub repository.
