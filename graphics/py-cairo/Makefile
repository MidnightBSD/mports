PORTNAME=	cairo
PORTVERSION=	1.18.1
CATEGORIES=	graphics python
MASTER_SITES=	https://github.com/pygobject/pycairo/releases/download/v${PORTVERSION}/
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	py${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python 2 bindings for Cairo

LICENSE=	lgpl2.1 MPL11
LICENSE_COMB=	multi
LICENSE_FILE_lgpl2.1=  ${WRKSRC}/COPYING-LGPL-2.1
LICENSE_FILE_MPL11=   ${WRKSRC}/COPYING-MPL-1.1

PORTSCOUT=	limitw:1,even

USES=		compiler:c11 gnome pkgconfig python
USE_PYTHON=	distutils py3kplist
USE_GNOME=	cairo

PLIST_SUB=	PORTVER=${PORTVERSION}

post-install:
	@${STRIP_CMD} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/cairo/_cairo*.so

.include <bsd.port.mk>
