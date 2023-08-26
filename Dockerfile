FROM nginx:latest

COPY develeap-test-task.html /usr/share/nginx/html/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
