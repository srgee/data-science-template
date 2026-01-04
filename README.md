# Data Science Project Template

## 📋 Overview
This repository serves as a standardized template for starting new Data Science and Machine Learning projects. It is designed to ensure reproducibility, project organization, and efficient collaboration.

The structure follows industry best practices (inspired by Cookiecutter Data Science), separating raw data from processed data, and analysis notebooks from production-ready scripts.

## 📂 Project Structure

```text
├── data/                  # Data registry (Not committed to Git)
│   ├── external/          # Data from third party sources
│   ├── processed/         # The final, canonical data sets for modeling
│   └── raw/               # The original, immutable data dump
├── docs/                  # Project documentation
├── models/                # Trained and serialized models, model predictions, or summaries
├── notebooks/             # Jupyter notebooks. Naming convention: 01-initial-analysis.ipynb
├── references/            # Data dictionaries, manuals, and all other explanatory materials
├── src/                   # Source code for use in this project
│   ├── __init__.py        # Makes src a Python package
│   ├── data/              # Scripts to download or generate data
│   ├── features/          # Scripts to turn raw data into features for modeling
│   ├── models/            # Scripts to train models and make predictions
│   └── visualization/     # Scripts to create exploratory and results oriented visualizations
├── tests/                 # Unit tests for the source code
├── .gitignore             # Files and folders to be ignored by Git
├── justfile               # (Optional) Configuration file for command runner just
├── .env-example           # Example file to show required environment variables for the project. Never upload your secrets to the repo!!!
├── README.md              # The top-level README for developers using this project
├── requirements.in        # The file with the defiition of direct dependencies 
└── requirements.txt       # The requirements file with oinned dependencies for reproducing the analysis environment
```

## 🚀 Getting Started

Follow these steps to start a new data science project using this template.

### 1. Initialize the repository
Use this template on GitHub or clone it locally:
```bash
git clone [https://github.com/srgee/ds-template.git](https://github.com/srgee/ds-template.git) my-new-project
cd my-new-project
rm -rf .git && git init  # Start a fresh git history
```

### 2. Environment setup

This template uses `pip-tools` for deterministic dependencies and `just` as a command runner.

```bash
# Create a virtual environment:
python3 -m venv .venv --upgrade-deps
source venv/bin/activate  # On Windows: venv\Scripts\activate

# Install core tools:
python3 -m pip install pip-tools

# Install dependencies: Instead of installing packages one by one, list your main libraries in requirements.in and run:
just pin-deps   # Generates requirements.txt
just sync-deps  # Installs exactly what's in the lockfile
```

### 3. Project Workflow

To maintain reproducibility, follow this workflow:

- Add a library: Add the name to `requirements.in`.
- Update environment: Run `just upgrade-deps`.
- Explore: Use the notebooks/ directory for EDA.
- Refactor: Move stable code (data cleaning, feature engineering) to src/.

## 🛠 Available Commands (via just)

The following commands are available to simplify your workflow:

| Command                     	| Description                                                                 	|
|-----------------------------	|-----------------------------------------------------------------------------	|
| just pin-deps               	| Compiles requirements.in into a fixed  requirements.txt                     	|
| just sync-deps              	| Synchronize dependencies                                                    	|
| just upgrade-deps           	| Update/upgrade dependencies                                                 	|
| just generate-html notebook 	| Generates HTML report from the given notebook file name (no file extension) 	|