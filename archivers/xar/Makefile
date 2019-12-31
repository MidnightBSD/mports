# $MidnightBSD$
# $FreeBSD: ports/archivers/xar/Makefile,v 1.3 2006/12/13 12:41:19 roam Exp $

PORTNAME=	xar
PORTVERSION=	1.6.1
CATEGORIES=	archivers
MASTER_SITES=	https://github.com/downloads/mackyle/xar/ \
		GENTOO

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	OpenDarwin XML eXtensible ARchiver

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		gmake gnome libtool ssl
USE_GNOME=	libxml2
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes

.include <bsd.port.pre.mk>

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/bin/${PORTNAME} \
		${STAGEDIR}${PREFIX}/lib/lib${PORTNAME}.so

.include <bsd.port.post.mk>
