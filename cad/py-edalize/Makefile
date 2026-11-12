PORTNAME=	edalize
DISTVERSION=	0.6.8
CATEGORIES=	cad python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for interfacing EDA tools
WWW=		https://github.com/olofk/edalize

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools-scm>=7.1:devel/py-setuptools-scm@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}Jinja2>=3:devel/py-Jinja2@${PY_FLAVOR} \
		gmake:devel/gmake \
		yosys:cad/yosys
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}vunit-hdl>0:cad/py-vunit-hdl@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pandas>0:math/py-pandas@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pyparsing>0:devel/py-pyparsing@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest>=8.4.2,1:devel/py-pytest@${PY_FLAVOR}

USES=		python:3.9+ python-setuptools:78 shebangfix
USE_PYTHON=	autoplist pep517 pytest

SHEBANG_FILES=	scripts/el_docker tests/mock_commands/*

NO_ARCH=	yes

post-patch:
	# Keep the build-runner name while substituting executable invocations.
	@${GREP} -rl '"make"' ${WRKSRC}/edalize | ${GREP} -v '/flows/edaflow.py$$' | ${XARGS} ${REINPLACE_CMD} -i '' -e 's|"make"|"${GMAKE}"|'
	@${REINPLACE_CMD} -i '' -e 's|) make -f|) ${GMAKE} -f|' ${WRKSRC}/tests/tools/verilator/Makefile ${WRKSRC}/tests/tools/verilator/minimal/Makefile ${WRKSRC}/tests/flows/sim/with_cocotb/Makefile
	@${GREP} -rl '"python3"' ${WRKSRC} | ${XARGS} ${REINPLACE_CMD} -i '' -e 's|"python3"|"${PYTHON_CMD}"|'
	@${GREP} -rl 'shell python3 ' ${WRKSRC} | ${XARGS} ${REINPLACE_CMD} -i '' -e 's|shell python3 |shell ${PYTHON_CMD} |'
	@${GREP} -rl '$$(shell which python3)' ${WRKSRC} | ${XARGS} ${REINPLACE_CMD} -i '' -e 's|$$(shell which python3)|${PYTHON_CMD}|'
	@${REINPLACE_CMD} -i '' -e 's|/usr/bin/env python3|${PYTHON_CMD}|' ${WRKSRC}/tests/mock_commands/vcs

.include <bsd.port.pre.mk>

.if ${PYTHON_REL} < 31000
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}importlib-metadata>=1.4:devel/py-importlib-metadata@${PY_FLAVOR}
.endif

.include <bsd.port.post.mk>
