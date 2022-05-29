# Description

Nginx reverse proxy is used as the entrypoint for all traffic and used to route traffic to other services.

## Path based routing rule

1. `/graphql` -> `gateway_service` (graphql endpoint)
2. `/*` -> `event_service` (frontend + websocket)
