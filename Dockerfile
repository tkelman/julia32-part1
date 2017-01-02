FROM staticfloat/julia_workerbase_ubuntu16_04:x86

RUN git clone https://github.com/JuliaLang/julia /src/julia-i686
WORKDIR /src/julia-i686
RUN echo 'override ARCH = i686' >> Make.user && \
    echo 'override MARCH = pentium4' >> Make.user && \
    echo 'override LLVM_ASSERTIONS = 1' >> Make.user && \
    make -j `nproc`
