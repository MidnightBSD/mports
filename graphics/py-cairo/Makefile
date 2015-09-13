# $MidnightBSD$

PORTNAME=	cairo
PORTVERSION=	1.10.0
CATEGORIES=	graphics python
MASTER_SITES=	http://cairographics.org/releases/
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	py2${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python 2 bindings for Cairo

LICENSE=	lgpl

USE_PYTHON=	2
USES=		pkgconfig python:2 shebangfix tar:bzip2
USE_GNOME=	cairo
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
CONFIGURE_ENV=	PYTHON=${LOCALBASE}/bin/${PYTHON_CMD} \
		PREFIX=${PREFIX}

python_OLD_CMD?=	/usr/bin/env python
python_CMD?=		${LOCALBASE}/bin/python2
SHEBANG_FILES=		examples/*.py examples/*/*.py test/*.py

do-configure:
	@cd ${WRKSRC} && ${SETENV} ${CONFIGURE_ENV} ${PYTHON_CMD} \
		./waf configure

do-build:
	@cd ${WRKSRC} && ${PYTHON_CMD} ./waf

do-install:
	cd ${WRKSRC} && ${PYTHON_CMD} ./waf install --destdir=${FAKE_DESTDIR}

post-install:
	cd ${PREFIX} && ${PYTHON_CMD} ${PYTHON_LIBDIR}/compileall.py \
		-d ${PYTHONPREFIX_SITELIBDIR} -f ${PYTHONPREFIX_SITELIBDIR:S;${TRUE_PREFIX}/;;}
	cd ${PREFIX} && ${PYTHON_CMD} -O ${PYTHON_LIBDIR}/compileall.py \
		-d ${PYTHONPREFIX_SITELIBDIR} -f ${PYTHONPREFIX_SITELIBDIR:S;${TRUE_PREFIX}/;;}
	${STRIP_CMD} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/cairo/_cairo.so

.include <bsd.port.mk>
