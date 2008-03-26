# New ports collection makefile for:	mhash
# Date created:		Mon Jun 28 17:59:13 PDT 1999
# Whom:			nsayer@freebsd.org
#
# $MidnightBSD: mports/security/mhash/Makefile,v 1.1 2006/10/27 14:49:52 wintellect Exp $
# $FreeBSD: ports/security/mhash/Makefile,v 1.29 2006/09/20 16:33:24 garga Exp $
#

PORTNAME=	mhash
PORTVERSION=	0.9.9
CATEGORIES=	security
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An easy-to-use library for strong hashes such as MD5 and SHA1
LICENSE=	lgpl

USE_BZIP2=	yes
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=--build=${MACHINE_ARCH}-portbld-freebsd6.0
CONFIGURE_ARGS+=	--with-LDFLAGS="${PTHREAD_LIBS}" --enable-static \
			--with-gnu-ld

MAN3=		mhash.3

PORTDOCS=	example.c skid2-authentication

post-install:
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S,^,${WRKSRC}/doc/,} ${DOCSDIR}
.endif

.include <bsd.port.mk>
