#! /bin/bash

graph-builder --service.address 0.0.0.0 --upstream.registry.url "$REGISTRY" --upstream.registry.repository "$REPOSITORY" &
policy-engine --service.address 0.0.0.0 --service.port "$PORT"
