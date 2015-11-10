FROM tkelman/julia64-part2:master
MAINTAINER Tony Kelman <tony@kelman.net>

RUN git clone https://github.com/JuliaLang/julia /home/julia-i686 && \
    cd /home/julia-i686 && \
    echo 'override ARCH = i686' >> Make.user && \
    echo 'override MARCH = pentium4' >> Make.user && \
    DEPS="openblas arpack suitesparse pcre libgit2" && \
    for dep in $DEPS; do \
      make -j2 -C deps install-$dep; \
    done && \
    for dep in $DEPS; do \
      make -C deps distclean-$dep; \
    done
# distclean should leave in place the installed libraries and headers
WORKDIR /home/julia-i686
