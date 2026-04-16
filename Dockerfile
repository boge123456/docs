FROM cr.ttyuyin.com/public/node:22

RUN npm i -g mint

COPY services/mintlify /docs/
WORKDIR /docs/

CMD ["mint", "dev", "--port", "8080"]