PORTNAME=	pytorch
DISTVERSIONPREFIX=	v
DISTVERSION=	2.15.0
CATEGORIES=	ai
MASTER_SITES=	https://github.com/pytorch/pytorch/releases/download/v${DISTVERSION}/
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTFILES=	${PORTNAME}-${DISTVERSIONFULL}${EXTRACT_SUFX} # the main tarball disappears when GH_xx tags are added w/out this line
DIST_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	PyTorch: Tensors and dynamic neural networks in Python
WWW=		https://pytorch.org/ \
		https://github.com/pytorch/pytorch

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

BROKEN_i386=	build fails: DispatchStub.cpp:162:29: [0m[0;1;31merror: [0m[1muse of undeclared identifier 'AVX2'[0m

BUILD_DEPENDS=	cmake:devel/cmake-core \
		gmake:devel/gmake \
		pybind11>0:devel/pybind11 \
		${PYTHON_PKGNAMEPREFIX}numpy>=1.16:math/py-numpy@${PY_FLAVOR} \
		${LOCALBASE}/include/fxdiv.h:devel/fxdiv \
		${PYTHON_PKGNAMEPREFIX}filelock>0:sysutils/py-filelock@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}fsspec>0:filesystems/py-fsspec@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}hypothesis>0:devel/py-hypothesis@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}Jinja2>0:devel/py-Jinja2@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}optree>0:devel/py-optree@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}packaging>=24.2:devel/py-packaging@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}psutil>0:sysutils/py-psutil@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pyyaml>0:devel/py-pyyaml@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}requests>0:www/py-requests@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}scikit-build-core>=1.0:devel/py-scikit-build-core@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}six>0:devel/py-six@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}sympy>=1.13.3:math/py-sympy@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}typing-extensions>=4.13.0:devel/py-typing-extensions@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>0:devel/py-wheel@${PY_FLAVOR}
LIB_DEPENDS=	libabsl_base.so:devel/abseil \
		libonnx.so:ai/onnx \
		libopenblas.so:math/openblas \
		libprotobuf.so:devel/protobuf \
		libsleef.so:math/sleef
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}filelock>0:sysutils/py-filelock@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}fsspec>=0.8.5:filesystems/py-fsspec@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}Jinja2>0:devel/py-Jinja2@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}networkx>=2.5.1:math/py-networkx@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}numpy>=1.16:math/py-numpy@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools>0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}sympy>=1.13.3:math/py-sympy@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}typing-extensions>=4.13.0:devel/py-typing-extensions@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pyyaml>0:devel/py-pyyaml@${PY_FLAVOR}
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}astunparse>0:devel/py-astunparse@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}dill>0:devel/py-dill@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}protobuf>0:devel/py-protobuf@${PY_FLAVOR} # optional dependencies
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}expecttest>0:devel/py-expecttest@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-rerunfailures>0:devel/py-pytest-rerunfailures@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-xdist>0:devel/py-pytest-xdist@${PY_FLAVOR}

USES=		compiler:c++17-lang localbase:ldflags mpi:openmpi python:3.11+ python-setuptools:78 shebangfix
USE_PYTHON=	pep517 autoplist

SHEBANG_FILES=	torch/utils/hipify/hipify_python.py # installed executable, unlike with the pre-2.14 setuptools build
USE_LDCONFIG=	${PYTHON_SITELIBDIR}/torch/lib

# The Python package is named "torch" not "pytorch"
PYDISTUTILS_PKGNAME=	torch
PEP517_INSTALL_CMD=	${PYTHON_CMD} -m installer --destdir ${FAKE_DESTDIR} --prefix ${TRUE_PREFIX} ${BUILD_WRKSRC}/dist/torch-${DISTVERSION}-*.whl

USE_GITHUB=	nodefault
GH_TUPLE=	pytorch:cpuinfo:bc3c01e:cpuinfo/cpuinfo-with-freebsd-support # https://github.com/pytorch/cpuinfo/pull/230/commits

MAKE_ENV=	USE_NINJA=no # ninja breaks for some reason
MAKE_ENV+=	BUILD_TEST=0 # ninja breaks for some reason
MAKE_ENV+=	USE_MKLDNN=0 # disable MKLDNN that doesn't exist, see https://github.com/pytorch/pytorch/issues/100957
MAKE_ENV+=	USE_CUDNN=0
MAKE_ENV+=	USE_LAPACK=1 # needed on FreeBSD to run w/out GPU
MAKE_ENV+=	USE_QNNPACK=0
MAKE_ENV+=	USE_DISTRIBUTED=1
# point FindMPI at the openmpi requested by USES=mpi, otherwise it picks up the
# mpicc/mpicxx wrappers that net/mpich installs into LOCALBASE/bin, which link
# libmpi/libmpicxx from mpich and drag in lang/gcc14 via the wrapper's -rpath
MAKE_ENV+=	CMAKE_ARGS="-DMPI_C_COMPILER=${MPI_HOME}/bin/mpicc -DMPI_CXX_COMPILER=${MPI_HOME}/bin/mpicxx -DCMAKE_CXX_COMPILER_CLANG_SCAN_DEPS=/usr/bin/clang-scan-deps" \
		MAX_JOBS=${MAKE_JOBS_NUMBER}
MAKE_ENV+=	PYTORCH_BUILD_VERSION=${DISTVERSION} PYTORCH_BUILD_NUMBER=1
LDFLAGS+=	-lexecinfo
LDFLAGS_powerpc64=	-pthread
LDFLAGS_powerpc64le=	-pthread

BINARY_ALIAS=	make=${GMAKE}

TEST_ENV=	${MAKE_ENV} PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR} \
		TORCHINDUCTOR_CACHE_DIR=${WRKDIR}/torchinductor_cache
TEST_WRKSRC=	${WRKSRC}/test

OPTIONS_DEFINE=		VULKAN
OPTIONS_DEFAULT=	VULKAN # VULKAN is experimental in PyTorch and only simple computations work
VULKAN_DESC=		Enable the Vulkan backend

VULKAN_MAKE_ENV=	USE_VULKAN=1 USE_VULKAN_SHADERC_RUNTIME=1 USE_VULKAN_WRAPPER=0 # see https://docs.pytorch.org/tutorials/unstable/vulkan_workflow.html
VULKAN_BUILD_DEPENDS=	glslc:graphics/shaderc \
			vulkan-headers>0:graphics/vulkan-headers
VULKAN_LIB_DEPENDS=	libvulkan.so:graphics/vulkan-loader

CONFLICTS_BUILD=	mpich # binaries are still linked with mpich when it is present

.include <bsd.mport.options.mk>

.if ${ARCH} == aarch64
# torch's many dlopen'd shared libraries (OpenMP, mimalloc, cpuinfo, etc.) require
# more initial-exec TLS than rtld's small default dlopen reserve, see rtld(1)
TEST_ENV+=	LD_STATIC_TLS_EXTRA=4096
.endif

post-extract:
	# upstream ships a stray *.orig file that 'make makepatch' would otherwise
	# mistake for a patch baseline and turn into a bogus binary patch
	@${RM} ${WRKSRC}/third_party/aiter/hsa/gfx950/pa/pa_bf16_noquant_gqa8_1tg_4w.co.orig

post-patch:
	@cd ${WRKSRC} && \
		${RM} -r third_party/cpuinfo third_party/fbgemm/external/cpuinfo && \
		${CP} -r cpuinfo-with-freebsd-support third_party/cpuinfo && \
		${CP} -r cpuinfo-with-freebsd-support third_party/fbgemm/external/cpuinfo
	# change hardcoded compiler in torch/_inductor/config.py
	@${REINPLACE_CMD} -e 's|"g++"|"${CXX}"|' \
		${WRKSRC}/torch/_inductor/config.py

do-install: # port should be moved to 'torch', but keep this for now with the hardcoded 'torch' name
	@${MKDIR} ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}
	@cd ${INSTALL_WRKSRC} && ${SETENVI} ${WRK_ENV} ${MAKE_ENV} ${PEP517_INSTALL_CMD}
	@${PYTHON_CMD} -B ${PORTSDIR}/Mk/scripts/strip_RECORD.py \
		${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/torch-${DISTVERSION}*.dist-info/RECORD >> ${_PYTHONPKGLIST}
	@${REINPLACE_CMD} \
		-e '/\.pyc$$/d' \
		-e 's|^|${PYTHONPREFIX_SITELIBDIR}/|' \
		-e 's|^${PYTHONPREFIX_SITELIBDIR}/../../../etc/|etc/|' \
		-e 's|^${PYTHONPREFIX_SITELIBDIR}/../../../bin/|bin/|' \
		-e 's|^${PYTHONPREFIX_SITELIBDIR}/../../../include/|include/|' \
		-e 's|^${PYTHONPREFIX_SITELIBDIR}/../../../lib/|lib/|' \
		-e 's|^${PYTHONPREFIX_SITELIBDIR}/../../../libdata/|libdata/|' \
		-e 's|^${PYTHONPREFIX_SITELIBDIR}/../../../libexec/|libexec/|' \
		-e 's|^${PYTHONPREFIX_SITELIBDIR}/../../../man/|man/|' \
		-e 's|^${PYTHONPREFIX_SITELIBDIR}/../../../sbin/|sbin/|' \
		-e 's|^${PYTHONPREFIX_SITELIBDIR}/../../../share/|share/|' \
			${_PYTHONPKGLIST}
	@cd ${FAKE_DESTDIR}${TRUE_PREFIX} && ${FIND} lib -name '*.pyc' >> ${_PYTHONPKGLIST}

do-test:
	@cd ${TEST_WRKSRC} && ${SETENV} ${TEST_ENV} ${PYTHON_CMD} run_test.py

test-quick: # tests basic training+inference functionality
	@cd ${TEST_WRKSRC} && ${SETENV} ${TEST_ENV} ${PYTHON_CMD} ${FILESDIR}/example.py

# tests as of 2.14.0: 231 passed 6 skipped

.include <bsd.port.mk>
