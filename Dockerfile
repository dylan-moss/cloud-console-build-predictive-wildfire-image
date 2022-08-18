FROM gcr.io/deeplearning-platform-release/tf2-gpu.2-7:latest

RUN apt-get update --yes
RUN apt-get install -y python3-pil

ENV CONDA_HOME=/opt/conda
ENV PYTHON=${CONDA_HOME}/bin/python
ENV PIP_HOME=${CONDA_HOME}/bin/pip
ENV PATH=${CONDA_HOME}/bin:${PATH}
ENV NODE_OPTIONS=--max-old-space-size=4096

RUN /opt/conda/bin/pip install --upgrade pip
RUN /opt/conda/bin/pip install --upgrade setuptools
RUN /opt/conda/bin/conda install -c conda-forge jupyter_contrib_nbextensions
RUN /opt/conda/bin/jupyter contrib nbextension install --system
RUN /opt/conda/bin/conda install -c conda-forge nbstripout && \
    /opt/conda/bin/nbstripout --install --system

RUN /opt/conda/bin/pip install --upgrade dask
RUN /opt/conda/bin/pip install --upgrade xarray
RUN /opt/conda/bin/pip install --upgrade netCDF4
RUN /opt/conda/bin/pip install --upgrade bottleneck
RUN /opt/conda/bin/pip install --upgrade pandas-gbq
RUN /opt/conda/bin/pip install --upgrade install pandarallel

RUN /opt/conda/bin/conda install -c conda-forge gdal
RUN /opt/conda/bin/conda install -c conda-forge rasterio
RUN /opt/conda/bin/conda install -c conda-forge rioxarray
RUN /opt/conda/bin/conda install -c conda-forge geopandas

RUN ${CONDA_HOME}/bin/conda install mamba -n base -c conda-forge \
    && ${CONDA_HOME}/bin/mamba install \
    conda \
    cython \
    fastavro \
    fastparquet \
    gcsfs

RUN /opt/conda/bin/jupyter lab build
