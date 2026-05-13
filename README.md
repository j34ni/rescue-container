# RESCUE-container

[![DOI](https://zenodo.org/badge/doi/10.5281/zenodo.20155316.svg)](https://zenodo.org/doi/10.5281/zenodo.20155316)

Container coming with packages needed for post-processing (like xarray, netcdf4, h5netcdf, pandas, matplotlib, cartopy, etc.) pinned to specific versions.

# Pull the container

## With Docker:
```
docker pull ghcr.io/j34ni/rescue:13c2f957b41140f704be4b41b78f2105b88062a7
```

## With Apptainer / Singularity
```
apptainer pull rescue.sif docker://ghcr.io/j34ni/rescue:13c2f957b41140f704be4b41b78f2105b88062a7
```

# How to use it

## Interactive session

### Docker:
```
docker run -it --rm \
  -v $(pwd):/data \
  ghcr.io/j34ni/rescue:13c2f957b41140f704be4b41b78f2105b88062a7
```

### Apptainer / Singularity:
```
apptainer run --bind $(pwd):/data rescue.sif
```

The `-v $(pwd):/data` (Docker) or `--bind $(pwd):/data` (Apptainer / Singularity) is very important: it makes your current folder available inside the container as `/data`. This way you can read and write NetCDF files.

## Run a Python script directly

### Docker
```
docker run --rm -v $(pwd):/data ghcr.io/j34ni/rescue:13c2f957b41140f704be4b41b78f2105b88062a7 python /data/my_script.py
```

### Singularity
```
apptainer exec --bind $(pwd):/data rescue.sif python /data/my_script.py
```

Important Notes:

- The container can both read and write NetCDF files (including append mode);
- All your files should be placed in the folder you mounted (in the example provided it will show up in `/data` inside the container):
- The Conda environment base is activated automatically when the container starts (if not then run `source /opt/start.sh` to activate it manually).
