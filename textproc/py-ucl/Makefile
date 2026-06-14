PORTNAME=	ucl
DISTVERSION=	0.9.4
CATEGORIES=	textproc python
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	UCL parser and emitter
WWW=		https://github.com/vstakhov/libucl/

LICENSE=	mit
LICENSE_FILE=	${WRKDIR}/libucl-${PORTVERSION}/COPYING

LIB_DEPENDS=	libcurl.so:ftp/curl \
	libucl.so.7:textproc/libucl

USES=		localbase python
USE_GITHUB=	yes
GH_ACCOUNT=	vstakhov
GH_PROJECT=	libucl
USE_PYTHON=	autoplist concurrent distutils

CPPFLAGS+=	-Iuthash

WRKSRC_SUBDIR=	python

.include <bsd.port.mk>
