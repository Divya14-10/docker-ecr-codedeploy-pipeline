FROM nginx:alpine
COPY index.html error.html /usr/share/nginx/html/
EXPOSE 80
