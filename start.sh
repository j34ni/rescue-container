#!/bin/bash

# Activate conda environment
. /opt/conda/etc/profile.d/conda.sh && conda activate base

echo "========================================"
echo "✅ Conda 'base' environment activated"
echo "Python version: $(python --version)"
echo "You can now work with xarray, netcdf4, etc."
echo "========================================"

# If user passed a command, run it. Otherwise start interactive shell
if [ $# -gt 0 ]; then
    exec "$@"
else
    exec bash --login
fi
