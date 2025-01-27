############ DEV ############
FROM golang:1.23.0-alpine3.20 AS dev

RUN apk add git nodejs neovim ripgrep build-base wget --update
RUN git clone https://github.com/NvChad/starter ~/.config/nvim

RUN mkdir /workspace
WORKDIR /workspace

EXPOSE 3000
EXPOSE 40000

############ PROD ############
FROM gcr.io/distroless/static-debian12

COPY ./build/demo /demo

CMD [ "/demo" ]