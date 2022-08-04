
FROM gcr.io/deeplearning-platform-release/tf-gpu.2-9

#RUN pip install -U segmentation-models

RUN conda install --channel conda-forge geopandas

RUN conda install -c conda-forge dask

RUN conda install -c conda-forge rioxarray

RUN conda install -c anaconda xarray

RUN conda install -c bjrn pandarallel

