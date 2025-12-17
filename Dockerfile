FROM cr.ttyuyin.com/zt/model-service-mintlify:v0.0.1
# FROM cr.ttyuyin.com/public/node:22

COPY services/mintlify /docs/
WORKDIR /docs/

# RUN npm i -g mint

CMD ["mint", "dev", "--port", "8080"]