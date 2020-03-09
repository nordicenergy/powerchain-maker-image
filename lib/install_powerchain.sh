#!/bin/bash

source qm.variables
source lib/common.sh

echo $CYAN"Building PowerChain, "$powerchain_version"..."$COLOR_END

rm -rf powerchain

docker run -ti --rm -v ${HOME}:/root -v $(pwd):/git alpine/git clone https://github.com/jpmorganchase/powerchain.git
docker run -ti --rm -v ${HOME}:/root -v $(pwd):/git -w /git/powerchain alpine/git checkout $powerchain_version
docker run -it --rm -v $(pwd)/powerchain:/powerchain -w /powerchain golang:1.10.2 make all

## Change the owneship of powerchain directory
chownDir 'powerchain'

echo $CYAN"Building PowerChain, "$powerchain_version" Completed."$COLOR_END
