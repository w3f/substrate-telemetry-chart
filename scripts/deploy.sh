#!/bin/sh

/scripts/deploy.sh helm \
                   --set image.tag="${CIRCLE_TAG}" \
                   substrate-telemetry \
                   w3f/substrate-telemetry
