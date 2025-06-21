FROM nginx:alpine

COPY html/index.html /usr/share/nginx/html/
COPY html/*/ /usr/share/nginx/html/
# RUN chmod -R 755 /usr/share/nginx/html
