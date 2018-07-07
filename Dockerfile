FROM node

RUN set -eux; \
  apt-get update \
  && apt-get install -y expect \
  && npm install -g \
      yarn \
      @vue/cli \
      @vue/cli-init \
      nuxt \
  && vue --version \
  && nuxt --version \
  && yarn --version

WORKDIR /

COPY init-nuxt.expect .
RUN chmod +x init-nuxt.expect \
  && ./init-nuxt.expect \
  && cd project \
  && sed 's#"dev": "nuxt"#"dev": "HOST=0.0.0.0 nuxt"#g' -i package.json \
  && yarn

WORKDIR /project
EXPOSE 3000
VOLUME ["/project"]
CMD ["yarn", "dev"]

