# Drone-Trivy 
Repo for Trivy server and client.
Images are built and pushed across to quay.

## Trivy Server.
* Trivy server Image is built to be used as standalone deployment. 
    + This can be packaged using Helm charts. It runs and listens on the default port 4954.
    + The server downloads the database every 12 hours by default.

## Trivy Client.
* Trivy Client Image is built to be used as a plugin in a CI/CD Step. 
    + The implementation requires the Triver server is reachable and it's listening.
    + The Scan step is configured to send the desired commands to the Trivy server as follows:
        - image - If Image is being sent to the Triver server for vulnerabilities scanning.
        token - The token to be used for authentication to the Triver server.
        <ignore-unfixed> - Whether to ignore the vulnerabilities without fixes.
        server - The Trivy server address to connect to.
        severity - The severity of the vulnerabilities to scan for.
        <image-name> - The image to scan.
