# Created by: Manuel Creach <manuel.creach@icloud.com>

PORTNAME=	libnfs
PORTVERSION=	4.0.0
DISTVERSIONPREFIX=	${PORTNAME}-
CATEGORIES=	net

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Client library for accessing NFS shares over a network

LICENSE=	gpl3 lgpl2.1
LICENSE_COMB=	multi
LICENSE_FILE=	${WRKSRC}/COPYING

PLIST_SUB=	SHLIB=${SHLIB}
SHLIB=		13

GNU_CONFIGURE=	yes
USES=		autoreconf gmake libtool pkgconfig
USE_LDCONFIG=	yes
USE_GITHUB=	yes
GH_ACCOUNT=	sahlberg

CONFIGURE_ARGS=	--disable-werror

post-patch:
	${REINPLACE_CMD} 's|$$(libdir)/\(pkgconfig\)|$$(prefix)/libdata/\1|' \
		${WRKSRC}/Makefile.am

.include <bsd.port.mk>
