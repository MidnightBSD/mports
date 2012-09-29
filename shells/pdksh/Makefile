# $MidnightBSD: mports/shells/pdksh/Makefile,v 1.3 2009/12/28 20:31:03 laffer1 Exp $

PORTNAME=	pdksh
PORTVERSION=	5.2.14p2
PORTREVISION=	3
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
LICENSE=	agg

GNU_CONFIGURE=	yes
MAN1=		ksh.1

.include <bsd.mport.options.mk>

.if defined(WITH_STATIC)
CONFIGURE_ENV+=	LDSTATIC=-static
.endif

post-patch:
	@(${ECHO_CMD} ",s/v${PORTVERSION:C/p.*//}/v${PORTVERSION:S/p/./}/"; \
		${ECHO_CMD} "wq") | ed -s ${WRKSRC}/version.c


.include <bsd.port.mk>
