PORTNAME=	pdksh
PORTVERSION=	5.2.14p2
PORTREVISION=	6
CATEGORIES=	shells
MASTER_SITES=	http://gd.tuwien.ac.at/utils/shells/pdksh/ \
		ftp://ftp.lip6.fr/pub/unix/shells/pdksh/ \
		ftp://ftp.demon.net/pub/mirrors/pdksh/
DISTNAME=	${PORTNAME}-${PORTVERSION:C/p.*//}

PATCH_SITES=	${MASTER_SITES}
PATCHFILES=	${DISTNAME}-patches.1 ${DISTNAME}-patches.2
PATCH_DIST_STRIP=	-p2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The Public Domain Korn Shell
WWW=		http://www.cs.mun.ca/~michael/pdksh/

LICENSE=	bsd3

OPTIONS_DEFINE=	STATIC

GNU_CONFIGURE=	yes
CPP+=	-P

STATIC_CONFIGURE_ENV+=	LDSTATIC=-static

post-patch:
	@(${ECHO_CMD} ",s/v${PORTVERSION:C/p.*//}/v${PORTVERSION:S/p/./}/"; \
		${ECHO_CMD} "wq") | ed -s ${WRKSRC}/version.c

.include <bsd.port.mk>
