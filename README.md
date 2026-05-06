# IBM_Docling_Linux_Robust

A local Docling workspace with Linux install/setup guidance and examples for converting PDFs using the `docling` package.  Utilizes python's ability to use virtual environment isolation.  

## Files

- `Docling Local.py` - Example Python script showing how to use `docling` in both online and local-only modes.
- `Docling Setup Linux.sh` - Shell setup instructions for creating a virtual environment and installing `docling` on Linux.
- `requirements.txt` - Optional package list that can be generated from the virtual environment.
- `models/` - Local directory for downloaded Docling model artifacts.

## Setup (Linux)

1. Change into the repository (change from my file structure):
   ```bash
   cd "~/DataSci/PythonWorkArea/IBMDocling/IBMDoclingVenv"
   ```
2. Create and activate a Python virtual environment:
   ```bash
   python3 -m venv venv
   source "venv/bin/activate"
   ```
3. Install `docling`:
   ```bash
   venv/bin/python3 -m pip install docling
   ```
4. Download the local model artifacts (change from my file structure):
   ```bash
   docling-tools models download --all -o "~/DataSci/PythonWorkArea/IBMDocling/IBMDoclingVenv/models"
   ```

## Running Locally

### Option 1: Internet-connected mode

Use `Docling Local.py` with a URL input to convert an online PDF:

```python
from docling.document_converter import DocumentConverter

source = "https://arxiv.org/pdf/2408.09869"
converter = DocumentConverter()
doc = converter.convert(source).document
print(doc.export_to_markdown())
```

### Option 2: Local-only mode

When disconnected from the internet, use a downloaded PDF and local model artifacts:

```python
from docling.datamodel.base_models import InputFormat
from docling.datamodel.pipeline_options import RapidOcrOptions, PdfPipelineOptions
from docling.document_converter import DocumentConverter, PdfFormatOption
import os

strUserID = os.getlogin()
#  (change from my file structure):
artifacts_path = "~/DataSci/PythonWorkArea/IBMDocling/IBMDoclingVenv/models"
pipeline_options = PdfPipelineOptions(artifacts_path=artifacts_path)

doc_converter = DocumentConverter(
    format_options={
        InputFormat.PDF: PdfFormatOption(pipeline_options=pipeline_options)
    }
)

#  Note:  Needs /home and userID.  (change from my file structure):
source = "/home/" + strUserID + "/DataSci/PythonWorkArea/IBMDocling/IBMDoclingVenv/2408.09869v5.pdf"
result = doc_converter.convert(source)
print(result.document.export_to_markdown())
```

## Generating `requirements.txt`

To export installed packages from the virtual environment:

```bash
venv/bin/python3 -m pip freeze > requirements.txt
```

Then install dependencies on another machine with:

```bash
venv/bin/python3 -m pip install -r requirements.txt
```

## Notes

- Optionally set the local model artifacts path with the `DOCLING_ARTIFACTS_PATH` environment variable.
- This README is based on the existing `Docling Local.py` and `Docling Setup Linux.sh` files in this folder.

