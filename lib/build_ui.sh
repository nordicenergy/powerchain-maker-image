#!/bin/bash

source lib/common.sh

if [ ! -d "../powerchain-maker-ui" ]; then
	echo -e $RED"Source code for NodeManager UI not found in parent directory. Please clone powerchain-maker-ui."$COLOR_END
	exit 1
fi

rm -rf powerchain-maker-ui
cp -r ../powerchain-maker-ui powerchain-maker-ui

pushd powerchain-maker-ui > /dev/null

branch=$(git branch | grep \* | cut -d ' ' -f2-)
echo $CYAN"Building QM UI "$branch" ..."$COLOR_END
popd > /dev/null

docker run -it --rm \
    -v $(pwd)/powerchain-maker-ui/webApp:/powerchain-maker-ui \
    -w /powerchain-maker-ui \
    nordicenergy/cicd \
    /bin/sh -c 'npm install ; ng build --aot'

## Change the owneship of directory
chownDir 'powerchain-maker-ui'

echo $CYAN"Building QM UI "$branch" Completed."$COLOR_END
