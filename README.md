# PowerChain Maker Docker image building utility #

PowerChain Maker uses Docker to make the setup easy. Most of the dependancies are baked into the image, so users can get going without having to download and install a list of dependancies. If you want to use a different version of these dependancies other than officially supported by PowerChain Maker, build the docker image locally and use with PowerChain Maker. 

> **Usage of PowerChain Maker image building utility is optional. The official docker image is uploaded in docker hub.**
## Quick Start ##
1. Create a temperory directory and clone following three projects
   1. `mkdir powerchain_temp; cd powerchain_temp ` 
   2. `git clone https://github.com/nordicenergy/powerchain-maker-nodemanager.git`
   3. `git clone https://github.com/nordicenergy/powerchain-maker-ui.git`
   4. `git clone https://github.com/nordicenergy/powerchain-maker-image.git` 
   5. PowerChain Maker project is not required to build docker image as it is required only at runtime. 
1. Run `./build_image.sh` inside `powerchain-maker-image` directory. Following are the steps executed automatically by this script. 
   1. Automatically build powerchain-maker-nodemanager using Golang and copy the executable to image.
   2. Automatically build powerchain-maker-ui using Angular and copy HTML, JS, CSS and images. 
   3. Automatically clone PowerChain and copy `geth` and `bootnode` to image.
   4. Download `Constellation` executable and copy to image.
   5. Install Linux libraries.
1. Tag docker image
   * PowerChain maker follows below convention for naming docker image
   nordicenergy/powerchain-maker:`<powerchain-version>`_`<powerchain-maker-version>`  

   E.g. If PowerChain version is 2.0.2 and PowerChain Maker version is 2.1, the docker image tag by convension is **nordicenergy/powerchain-maker:2.0.2_6.2**
   
   * You can pass the name and tag of the docker image as the parameter to the `build_image.sh` script.  

   E.g. `build_image.sh powerchain-maker` or `build_image.sh powerchain-maker 2.0_2.6`

   * If you do not pass any parameters, `build_image.sh` will use the git branch for the PowerChain Maker part of the tag name. 

   E.g. If you are v2.0 branch, the generated image name will be **nordicenergy/powerchain-maker:2.0.2_2.6**

   > Branches `development` and `master` are treated specially.  


Please refer to the source code and edit each libraries versions before you build. Make sure to update the image tag name in qm.variables of PowerChain Maker to use this newly built image.  
