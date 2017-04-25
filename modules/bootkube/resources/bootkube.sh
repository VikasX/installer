#!/bin/bash

/usr/bin/rkt run \
  --trust-keys-from-https \
  --volume assets,kind=host,source=$(pwd) \
  --mount volume=assets,target=/assets \
  --volume etc-kubernetes,kind=host,source=/etc/kubernetes \
  --mount volume=etc-kubernetes,target=/etc/kubernetes \
  ${bootkube_image} \
  --net=host \
  --dns=host \
  --exec=/bootkube -- start --asset-dir=/assets
