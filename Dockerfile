FROM haskell:8.8.3

WORKDIR /work

COPY stack.yaml waiwai.cabal /work/
RUN stack build --only-dependencies

COPY . /work/
RUN stack build && stack install

CMD waiwai-exe -p $PORT