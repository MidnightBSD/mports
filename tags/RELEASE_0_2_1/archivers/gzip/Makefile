# New ports collection makefile for:	gzip
# Date created:				27 July 2002
# Whom:					cyrille.lefevre@laposte.net
#
# $MidnightBSD: mports/archivers/gzip/Makefile,v 1.4 2007/08/01 01:30:35 laffer1 Exp $
# $FreeBSD: ports/archivers/gzip/Makefile,v 1.16 2006/05/03 05:14:01 edwin Exp $
#

PORTNAME=	gzip
PORTVERSION=	1.3.12
PORTREVISION=	3
CATEGORIES=	archivers
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A compression utility designed to be a replacement for compress
LICENSE=	gpl2

GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.0
CONFIGURE_ARGS+=	--infodir=${LOCALBASE}/info \
		--mandir=${MANPREFIX}/man

MAN1=	gunzip.1 gzexe.1 gzip.1 zcat.1 zcmp.1 zdiff.1 zforce.1 \
	zgrep.1 zless.1 zmore.1 znew.1
INFO=	gzip

DOC_FILES=	AUTHORS COPYING INSTALL NEWS README README-alpha \
		THANKS TODO

post-configure:
	@${REINPLACE_CMD} -e 's|^SHELL =.*|SHELL=/bin/sh|' ${WRKSRC}/Makefile

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
.for file in ${DOC_FILES}
	@${INSTALL_DATA} ${WRKSRC}/${file} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.mk>
