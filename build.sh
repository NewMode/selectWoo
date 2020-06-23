#!/bin/bash

UGLIFY_CMD="uglifyjs dist/js/select2.js -o dist/js/select2.min.js"

UGLIFY_CMD="$UGLIFY_CMD && uglifyjs dist/js/select2.full.js -o dist/js/select2.full.min.js"
UGLIFY_CMD="$UGLIFY_CMD && uglifyjs dist/js/selectWoo.full.js -o dist/js/selectWoo.full.min.js"
UGLIFY_CMD="$UGLIFY_CMD && uglifyjs dist/js/selectWoo.js -o dist/js/selectWoo.min.js"

docker run --rm --name node-uglify -v "$PWD":/usr/src/app -w /usr/src/app node \
  bash -c "npm install uglify-js && npm link uglify-js && $UGLIFY_CMD"
