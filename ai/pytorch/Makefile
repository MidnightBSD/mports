PORTNAME=	pytorch
DISTVERSIONPREFIX=	v
DISTVERSION=	2.13.0
PORTREVISION=	1
CATEGORIES=	ai # machine-learning
MASTER_SITES=	https://github.com/pytorch/pytorch/releases/download/v${DISTVERSION}/
DIST_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tensors and dynamic neural networks in Python (C++ library)
WWW=		https://pytorch.org/

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

BROKEN_i386=	compilation fails: error: use of undeclared identifier 'AVX2'

BUILD_DEPENDS=	${LOCALBASE}/include/fxdiv.h:devel/fxdiv \
		${PYTHON_PKGNAMEPREFIX}packaging>=0:devel/py-packaging@${PY_FLAVOR} \
		${PY_SETUPTOOLS}
LIB_DEPENDS=	libabsl_base.so:devel/abseil \
		libblis.so:math/blis \
		libfmt.so:devel/libfmt \
		libopenblas.so:math/openblas \
		libmpi_cxx.so:net/openmpi4 \
		libonnx.so:ai/onnx \
		libpthreadpool.so:devel/pthreadpool \
		libprotobuf.so:devel/protobuf \
		libsleef.so:math/sleef

USES=		compiler:c++17-lang cmake:noninja gmake localbase:ldflags python # requires python even with PYTHON=off

CMAKE_OFF=	BUILD_CUSTOM_PROTOBUF USE_CUDA USE_ROCM  USE_NNPACK USE_QNNPACK USE_PYTORCH_QNNPACK \
		USE_FBGEMM # workaround recommended by the upstream here: https://github.com/pytorch/pytorch/issues/28337
CMAKE_OFF+=	BUILD_TEST BUILD_AOT_INDUCTOR_TEST
CMAKE_ON=	USE_SYSTEM_PYBIND11 \
		USE_SYSTEM_SLEEF \
		USE_SYSTEM_ONNX # see other USE_SYSTEM_xx in CMakeLists.txt
CMAKE_ON+=	ONNX_USE_LITE_PROTO # workaround for the protobuf-related failure described here: https://github.com/onnx/optimizer/issues/38
CMAKE_ARGS=	-DPSIMD_SOURCE_DIR=${WRKSRC}/third_party/psimd \
		-DPYTHON_EXECUTABLE=${PYTHON_CMD}

LDFLAGS+=	-lexecinfo \
		-pthread

BINARY_ALIAS=	make=${GMAKE} git=true

OPTIONS_DEFINE=		PYTHON DISTRIBUTED # PYTHON only provides python support for the py-PyTorch port - it's not a python binding
OPTIONS_DEFAULT=	PYTHON
OPTIONS_SUB=		yes

DISTRIBUTED_DESC=	Distributed training support (gloo, MPI, tensorpipe)

# USE_LIBUV rides along with USE_DISTRIBUTED rather than being a separate knob:
# gloo's only other transport is tcp, which is Linux-only because it uses
# epoll(2), so without libuv gloo would be built with no transport at all.
DISTRIBUTED_CMAKE_BOOL=	USE_DISTRIBUTED USE_LIBUV

PYTHON_CMAKE_BOOL=	BUILD_PYTHON
PYTHON_PY_DEPENDS=	${PYNUMPY} \
			${PYTHON_PKGNAMEPREFIX}typing-extensions>0:devel/py-typing-extensions@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}pyyaml>=0:devel/py-pyyaml@${PY_FLAVOR}
PYTHON_BUILD_DEPENDS=	${PYTHON_PY_DEPENDS} \
			${PY_SETUPTOOLS} \
			pybind11>0:devel/pybind11
PYTHON_RUN_DEPENDS=	${PYTHON_PY_DEPENDS}

.include <bsd.port.pre.mk>

.if ${ARCH} == "amd64"
PLIST_SUB+=	AMD64=""
.else
PLIST_SUB+=	AMD64="@comment "
.endif

post-patch:
	# replace malloc.h -> stdlib.h in many places
	@cd ${WRKSRC} && for f in $$(${GREP} -rl "include <malloc\.h>" * | ${GREP} -E "\.(c|cpp|h|hpp)$$"); do \
	  ${REINPLACE_CMD} -i'' -E "s|include <malloc\.h>|include <stdlib.h>|" $$f; \
	done
	# remove bundled fmt
	@${RM} -r ${WRKSRC}/third_party/fmt

post-install:
	# functorch.so is installed back into the source directory, see https://github.com/pytorch/pytorch/issues/91524
	@${RM} $$(${FIND} ${FAKE_DESTDIR} -name functorch.so)
	# Remove build artifacts installed with absolute paths
	@${RM} -r ${FAKE_DESTDIR}${WRKDIR} || true
	# https://github.com/pytorch/pytorch/issues/24417
	@${FIND} ${FAKE_DESTDIR} -type d -empty -delete

.include <bsd.port.post.mk>
