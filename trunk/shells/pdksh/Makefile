# $MidnightBSD: mports/shells/pdksh/Makefile,v 1.2 2007/05/17 18:06:26 ctriv Exp $

PORTNAME=	pdksh
PORTVERSION=	5.2.14p2
PORTREVISION=	2
CATEGORIES=	shells
MASTER_SITES=	ftp://ftp.cs.mun.ca/pub/pdksh/ \
		http://gd.tuwien.ac.at/utils/shells/pdksh/ \
		ftp://ftp.lip6.fr/pub/unix/shells/pdksh/ \
		ftp://ftp.demon.net/pub/mirrors/pdksh/
DISTNAME=	${PORTNAME}-${PORTVERSION:C/p.*//}

PATCH_SITES=	${MASTER_SITES}
PATCHFILES=	${DISTNAME}-patches.1 ${DISTNAME}-patches.2
PATCH_DIST_STRIP= -p2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The Public Domain Korn Shell
LICENSE=	agg

MAKE_JOBS_SAFE=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	LDSTATIC=-static
MAN1=		ksh.1

post-patch:
	@(${ECHO_CMD} ",s/v${PORTVERSION:C/p.*//}/v${PORTVERSION:S/p/./}/"; \
		${ECHO_CMD} "wq") | ed -s ${WRKSRC}/version.c


.include <bsd.port.mk>
