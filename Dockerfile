FROM ubuntu:22.04

# Install system dependencies
RUN apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends ca-certificates tzdata wget && \
    rm -rf /var/lib/apt/lists/*

# Install Miniforge
RUN wget -q -nc --no-check-certificate -P /var/tmp https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh && \
    bash /var/tmp/Miniforge3-Linux-x86_64.sh -b -p /opt/conda && \
    rm /var/tmp/Miniforge3-Linux-x86_64.sh

# Install Python + pinned scientific stack
RUN . /opt/conda/etc/profile.d/conda.sh && \
    mamba install -y -c conda-forge \
        python=3.12.13 \
        cartopy=0.25.0 \
        cftime=1.6.5 \
        h5netcdf=1.8.1 \
        matplotlib=3.10.9 \
        netcdf4=1.7.4 \
        pandas=3.0.3 \
        seaborn=0.13.2 \
        sparse=0.18.0 \
        xarray=2026.4.0 && \
    conda clean -afy

# Environment
ENV PATH="/opt/conda/bin:$PATH"
ENV TZ="Europe/Oslo"

# Copy and setup start script
COPY start.sh /opt/start.sh
RUN chmod +x /opt/start.sh

ENTRYPOINT ["/opt/start.sh"]
CMD ["bash"]
