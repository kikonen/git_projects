#!/usr/bin/env bash

export DOCKER_ENV=base
. $(realpath $(dirname $0))/base_env.sh

IGNORE=$(cat $ROOT_DIR/ignore.txt | sort)
#PROJECTS=$(cat $ROOT_DIR/repositories.txt | sort)

PROJECTS=$(comm -3 <(cat $ROOT_DIR/repositories.txt | sort) <(cat $ROOT_DIR/ignore.txt | sort))


echo "---------------------------"
echo "IGNORE PROJECTS:"
echo "$IGNORE"
echo "---------------------------"
echo "CLONE PROJECTS:"
echo "$PROJECTS"
echo "---------------------------"

echo "$PROJECTS" | tr ' ' '\n' | while read PROJECT_NAME; do
    PROJECT_PATH=$(echo $PROJECT_NAME | awk '{ gsub(".*/", "") ; print $0 }')
    PROJECT_DIR="${PROJECTS_DIR}/${PROJECT_PATH}"

    if [[ ! -d $PROJECT_DIR ]]; then
        echo "CLONE: $PROJECT_NAME"
        PROJECT_URL="git@github.com:${PROJECT_NAME}.git"
        $(cd $PROJECTS_DIR && git clone $PROJECT_URL)
    else
        echo "EXIST: $PROJECT_PATH"
    fi
done

bash -e $SCRIPT_DIR/setup_projects.sh "$@"
