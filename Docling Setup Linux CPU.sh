#  Linux install and setup

#  Note:  (change from my file structure)
cd "~/DataSci/PythonWorkArea/IBMDocling/IBMDoclingVenv"

#  Initial venv creation
python3 -m venv venv

#  Very specific to the venv created - verify before activating.
source "venv/bin/activate"

#  Install docling - defaults to RapidOCR
venv/bin/python3 -m pip install docling

#  Download the docling models to use locally
#  Note:  (change from my file structure)
docling-tools models download --all -o "~/DataSci/PythonWorkArea/IBMDocling/IBMDoclingVenv/models"

#
#  ---------- Optional ----------
#
#  Set environment variable for local model use
#  Linux:
#  export DOCLING_ARTIFACTS_PATH=</path/to/models>

#  Windows:
#  set DOCLING_ARTIFACTS_PATH=<C:\path\to\models>"

#
#  ---------- Running Python ----------
#
venv/bin/python3
