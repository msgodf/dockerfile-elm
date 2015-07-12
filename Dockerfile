FROM node:latest

RUN npm install elm

RUN update-alternatives --install /usr/local/bin/elm elm /node_modules/elm/bin/elm 1
RUN update-alternatives --install /usr/local/bin/elm-repl elm-repl /node_modules/elm/bin/elm-repl 1
RUN update-alternatives --install /usr/local/bin/elm-reactor elm-reactor /node_modules/elm/bin/elm-reactor 1
RUN update-alternatives --install /usr/local/bin/elm-package elm-package /node_modules/elm/bin/elm-package 1
RUN update-alternatives --install /usr/local/bin/elm-make elm-make /node_modules/elm/bin/elm-make 1

# Installs elm-lang/core
RUN elm-package install -y

# Build anything that elm-make requires to run
RUN elm-make
