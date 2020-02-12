#!/bin/bash
source lib/common.sh

if [ ! -d "../powerchain-maker-nodemanager" ]; then
	echo -e $RED"Source code for NodeManager not found in parent directory. Please clone powerchain-maker-nodemanager."$COLOR_END
	exit 1
fi



rm -rf powerchain-maker-nodemanager
cp -r ../powerchain-maker-nodemanager powerchain-maker-nodemanager



pushd powerchain-maker-nodemanager > /dev/null

branch=$(git branch | grep \* | cut -d ' ' -f2-)
echo $CYAN"Building Node Manager "$branch" ..."$COLOR_END
popd > /dev/null

docker run -it --rm \
    -v $(pwd)/powerchain-maker-nodemanager:/go/src/github.com/nordicenergy/powerchain-maker-nodemanager \
    golang:1.10.2 \
    /bin/sh -c 'cd /go/src/github.com/nordicenergy/powerchain-maker-nodemanager ; go get ./... ; go build'

## Change the owneship of directory
chownDir 'powerchain-maker-nodemanager'

echo $CYAN"Building Node Manager "$branch" Completed."$COLOR_END
