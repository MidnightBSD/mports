# $MidnightBSD: mports/devel/yajl/Makefile,v 1.1 2012/03/01 13:20:54 laffer1 Exp $

PORTNAME=	yajl
PORTVERSION=	2.0.4
PORTREVISION=	1
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A Portable JSON parsing and serialization library in ANSI C
LICENSE=	bsd2

USE_GITHUB=	yes
GH_ACCOUNT=	lloyd
GH_COMMIT=	fee1ebe



USE_LDCONFIG=	yes
USE_CMAKE=	yes

PLIST_SUB=	VERSION=${PORTVERSION}

post-patch:
	@${REINPLACE_CMD} -e "s,share/pkgconfig,libdata/pkgconfig,g" \
		${WRKSRC}/src/CMakeLists.txt

.include <bsd.port.mk>
