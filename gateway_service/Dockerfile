FROM node:16.3.0

COPY . /code
WORKDIR /code

RUN npm install

ENTRYPOINT [ "npm" ]
CMD [ "start" ]