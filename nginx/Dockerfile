FROM nginx:latest
COPY nginx/config/bots.d /etc/nginx/bots.d
COPY nginx/config/conf.d /etc/nginx/conf.d
COPY nginx/config/headers.d /etc/nginx/headers.d
COPY nginx/config/ssl /etc/nginx/ssl
COPY nginx/config/nginx.conf /etc/nginx/nginx.conf
COPY nginx/config/deny.d /etc/nginx/deny.d
EXPOSE 80
EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]