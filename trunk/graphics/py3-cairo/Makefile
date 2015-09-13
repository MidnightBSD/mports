# $MidnightBSD$

PORTNAME=	cairo
PORTVERSION=	1.10.0
CATEGORIES=	graphics python
MASTER_SITES=	http://cairographics.org/releases/
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	py${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python 3 bindings for Cairo

LICENSE=	gpl3
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		pkgconfig python:3 shebangfix tar:bzip2
USE_GNOME=	cairo
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

python_OLD_CMD?=	/usr/bin/env python
python_CMD?=		${LOCALBASE}/bin/python${PYTHON_VER}
SHEBANG_FILES=		examples/*.py examples/*/*.py test/*.py

PLIST_SUB+=	PYTVER=${PYTHON_VER:S/.//}

post-patch:
	@${REINPLACE_CMD} -e 's|python %s|${PYTHON_CMD} %s|g' \
		${WRKSRC}/test/examples_test.py

do-configure:
# Run waf configure twice, once to extract waflib and patch and then actual configure
	@cd ${WRKSRC} && ${SETENV} ${CONFIGURE_ENV} ${PYTHON_CMD} \
		./waf configure || :
	@cd ${WRKSRC}/.waf3-1.6.4-e3c1e08604b18a10567cfcd2d02eb6e6/ && \
		${PATCH} -p1 < ${FILESDIR}/pycairo-1.10.0-waf-py3_4.patch
	@cd ${WRKSRC} && ${SETENV} ${CONFIGURE_ENV} ${PYTHON_CMD} \
		./waf configure

do-build:
	@cd ${WRKSRC} && ${PYTHON_CMD} ./waf

do-install:
	@cd ${WRKSRC} && ${PYTHON_CMD} ./waf install --destdir=${FAKE_DESTDIR}

post-install:
	@${RM} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/cairo/__init__.py[co]
	cd ${PREFIX} && ${PYTHON_CMD} ${PYTHON_LIBDIR}/compileall.py \
		-d ${PYTHONPREFIX_SITELIBDIR} -f ${PYTHONPREFIX_SITELIBDIR:S;${PREFIX}/;;}
	cd ${PREFIX} && ${PYTHON_CMD} -O ${PYTHON_LIBDIR}/compileall.py \
		-d ${PYTHONPREFIX_SITELIBDIR} -f ${PYTHONPREFIX_SITELIBDIR:S;${PREFIX}/;;}
	${STRIP_CMD} ${PYTHON_SITELIBDIR}/cairo/_cairo.so

.include <bsd.port.mk>
