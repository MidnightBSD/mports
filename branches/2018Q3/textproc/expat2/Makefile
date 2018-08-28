# $MidnightBSD$

PORTNAME=	expat
PORTVERSION=	2.2.1
PORTREVISION=	0
CATEGORIES=	textproc
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	XML 1.0 parser written in C

LICENSE=	other

GNU_CONFIGURE=	yes
ALL_TARGET=	default
USES=		libtool pathfix tar:bzip2
USE_LDCONFIG=	yes

post-patch:
	@${REINPLACE_CMD} -e '/^DESTDIR =/d' ${WRKSRC}/Makefile.in

post-install:
	${LN} -s libexpat.so.1 ${STAGEDIR}${PREFIX}/lib/libexpat.so.6

.include <bsd.port.mk>
