# $MidnightBSD$

PORTNAME=	openhbci
PORTVERSION=	0.9.17.2
PORTREVISION=	2
CATEGORIES=	finance
MASTER_SITES= 	SF/${PORTNAME}/${PORTNAME}/0.9.17
DISTNAME=	openhbci-0.9.17-2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	HBCI is a bank-independent homebanking standard

LICENSE=	lgpl

USES=		libtool
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
USE_LDCONFIG=	yes

WRKSRC=		${WRKDIR}/${PORTNAME}-0.9.17

post-patch:
	@${REINPLACE_CMD} -e 's|-lstdc++||' \
		${WRKSRC}/configure \
		${WRKSRC}/src/openhbci/Makefile.in \
		${WRKSRC}/src/openhbci/core/Makefile.in

.include <bsd.port.mk>
