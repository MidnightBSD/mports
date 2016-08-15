# $MidnightBSD$

PORTNAME=	json-c
PORTVERSION=	0.12
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	JSON (JavaScript Object Notation) implementation in C

LICENSE=	mit

CONFLICTS_INSTALL=	cocaine-core-[0-9]*

GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
USE_LDCONFIG=	yes
USES=		gmake libtool pathfix pkgconfig

USE_GITHUB=	yes
GH_ACCOUNT=	${PORTNAME}
GH_COMMIT=	2a03577
GH_PROJECT=	${PORTNAME}
GH_TAGNAME=	${PORTNAME}-${PORTVERSION}-20140410

WRKSRC=		${WRKDIR}/json-c-json-c-0.12-20140410

post-patch:
	@${REINPLACE_CMD} -e 's| -Werror||g' ${WRKSRC}/Makefile.in

.include <bsd.port.mk>
