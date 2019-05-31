# Manually Install R for Jupyter Notebooks with conda (Preferred)

## R for Jupyter Notebooks (with conda)

### Use conda to create an conda environment with R
1) Create the conda environment containering R with `conda create -c r -n <your_env_name> r-base r-essentials`.  
2) Activate the environment with `conda activate <your_env_name>`.
3) Run `r` in bash to open R in interpretive mode, to verify the install.
4) Quit `r` by running `quit()` in the R interpretive mode.

### Connect your conda environment to Jupyter
1) Activate the environment with `conda activate <your_env_name>`.  
2) Run `r` in bash to open R in interpretive mode.  

3) Run `IRkernel::installspec(name = '<your_env_name>', displayname = '<your_display_name>')`.  
The `displayname` argument is an optional arguement that specifies the name that is displayed in Jupyter Notebook.  
The `name` argument is the name that appears in the Jupyter Kernelspec; this can be anything, but using the name of the conda environment will make is clearer which conda environment is hooked up with each kernel spec.  

4) Run `quit()` to exit and press the "n" key so you don't save a workspace image.  

5) Open jupyter notebook with `jupyter notebook` in bash.  
6) Either open an existing Jupyter Notebook or create a new one and choose the kernel `<your_display_name>` (or `<your_env_name>` if you declined to specify.

### Install a Package that is on a conda channel
1) Activate the environment with `conda activate <your_env_name>`.  
2) Run `conda install -c r r-<package_name>` to install the package if the package is in the main r conda channel or run `conda install -c conda-forge r-<package_name>` if the package is in conda-forge. For other channels, run `conda install -c <channel_name> r-<package_name>`.

### Install a Package that is in CRAN, but not on a conda channel
We'll use this to install some packages that are on CRAN, but not in any of the conda channels. In particular, we'll need to install the `ISLR` package for the data sets. For more detailed information on installing R packages through conda, see [Building R packages with skeleton CRAN](https://docs.conda.io/projects/conda-build/en/latest/user-guide/tutorials/build-r-pkgs.html).

1) Activate the environment with `conda activate <your_env_name>`.   
2) Run `conda skeleton cran <package_name>`. This will create a folder called `r-<package_name>`. For example, for ISLR, run `conda skeleton cran ISLR` and the folder will be called `r-ISLR`.  
3) Run `conda build r-<package_name>` (`conda build r-ISLR` for the ISLR package). This will build the package locally.  
4) Run `conda install --use-local r-<package_name>` (`conda install --use-local r-ISLR` for the ISLR package) to install the package.  
5) Run `conda list` or `conda env export` and check the output to confirm the package was installed.  
