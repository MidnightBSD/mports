# $MidnightBSD: mports/devel/boost-jam/Makefile,v 1.1 2012/09/15 19:26:54 laffer1 Exp $

PORTNAME=	boost-jam
PORTVERSION=	1.48.0
PORTVERSUFFIX=	${PORTVERSION:C/\.[0-9]+$//}
CATEGORIES=	devel
MASTER_SITES=	SF/boost/boost/${PORTVERSION}
DISTNAME=	boost_${PORTVERSION:S/./_/g}

MAINTAINER=	ports@midnightbsd.org
COMMENT=	Build tool from the boost.org
LICENSE=	mit

CONFLICTS=	boost-python-1* boost-1*

USE_BZIP2=	yes

.include <bsd.port.pre.mk>

BJAM=		${WRKSRC}/bjam

post-patch:
	@${REINPLACE_CMD} -e '/toolset cc/,/;/ { /opt --release/d; }' ${WRKSRC}/tools/build/v2/engine/build.jam

do-build:
	cd ${WRKSRC} && ${MAKE_ENV} ./bootstrap.sh --with-toolset=cc --prefix=${PREFIX}

do-install:
	${MKDIR} ${PREFIX}/bin
	${INSTALL_PROGRAM} ${BJAM} ${PREFIX}/bin/

.include <bsd.port.post.mk>
