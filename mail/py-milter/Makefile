# Created by: Vsevolod Lobko <seva@sevasoft.kiev.ua>

PORTNAME=	milter
PORTVERSION=	1.0.4
DISTVERSIONPREFIX=	${GH_PROJECT}-
CATEGORIES=	mail python
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python interface to Sendmail milter API

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

.if !exists(/usr/lib/libmilter.so)
LIB_DEPENDS=	libmilter.so:mail/libmilter
CFLAGS+=	-I${LOCALBASE}/include
.endif

USES=	python

USE_GITHUB=	yes
GH_ACCOUNT=	sdgathman
GH_PROJECT=	py${PORTNAME}
USE_PYTHON=	distutils autoplist flavors

NO_TEST=	yes

post-install:
	${STRIP_CMD} ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/milter.so

.include <bsd.port.mk>
