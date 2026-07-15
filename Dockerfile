# syntax = docker/dockerfile:1
# socialbankers.org — static marketing site served by nginx, deployed with Kamal
# onto the same EC2 host as the portal (routed by the shared kamal-proxy).
FROM nginx:1.27-alpine

COPY nginx.conf /etc/nginx/conf.d/default.conf

# Only the web files enter the image (kept explicit so no config/docs leak in).
COPY index.html about.html membership.html contact.html /usr/share/nginx/html/
COPY assets /usr/share/nginx/html/assets

EXPOSE 80
