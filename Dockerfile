FROM node

RUN set -eux; \
  apt-get update && apt-get install -y expect \
  && npm install -g vue-cli nuxt \
  && vue --version \
  && nuxt --version

RUN mkdir /project
WORKDIR /project

COPY init-nuxt.expect .
RUN chmod +x init-nuxt.expect \
  && ./init-nuxt.expect \
  && sed 's#"dev": "nuxt"#"dev": "HOST=0.0.0.0 nuxt"#g' -i package.json \
  && npm install

EXPOSE 3000
VOLUME ["/project"]
CMD ["npm", "run", "dev"]
