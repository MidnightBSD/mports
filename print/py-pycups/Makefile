PORTNAME=	pycups
PORTVERSION=	2.0.1
CATEGORIES=	print python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	CUPS bindings for Python
WWW=		https://github.com/zdohnal/pycup

LICENSE=	gpl2 gpl3
LICENSE_COMB=	dual

LIB_DEPENDS=	libcups.so:print/cups

USES=		iconv localbase python
USE_PYTHON=	autoplist concurrent distutils

.include <bsd.port.pre.mk>

post-patch:
	@${REINPLACE_CMD} -e 's|^\(VERSION=\).*$$|\1${PORTVERSION}|' ${WRKSRC}/Makefile
.if empty(ICONV_LIB)
	@${REINPLACE_CMD} -e 's| or sys.platform.startswith("freebsd"):|:|' ${WRKSRC}/setup.py
.endif

pre-configure:
	@${REINPLACE_CMD} -e 's|/usr/local|${LOCALBASE}|g' ${WRKSRC}/cupsconnection.c
	@${REINPLACE_CMD} -e 's|#ifdef __SVR4|#ifdef __FreeBSD__|' ${WRKSRC}/cupsppd.c

post-install:
	${STRIP_CMD} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/cups*.so

.include <bsd.port.post.mk>
