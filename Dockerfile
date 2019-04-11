FROM nginx:alpine
COPY index.html /usr/share/nginx/html
COPY main.css /usr/share/nginx/html