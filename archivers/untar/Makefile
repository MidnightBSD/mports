# New ports collection makefile for:    untar
# Date created:         14 Jul 2002
# Whom:                 KIMURA<LEE> Shigekazu <spbz6f99@utopia.ocn.ne.jp>

# $MidnightBSD: mports/archivers/untar/Makefile,v 1.1 2008/04/14 22:12:41 crash Exp $
# $FreeBSD: ports/archivers/untar/Makefile,v 1.9 2007/08/04 11:40:38 gabor Exp $
#

PORTNAME=	untar
PORTVERSION=	1.4
PORTREVISION=	1
CATEGORIES=	archivers
MASTER_SITES=	ftp://ftp.cs.pdx.edu/pub/elvis/
DISTNAME=	${PORTNAME}
EXTRACT_SUFX=	.c
EXTRACT_ONLY=

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lists/Extracts files from a "*.tgz" or "*.gz" archive
LICENSE=        unknown

MAKEFILE=	/usr/share/mk/bsd.prog.mk
NO_WRKSUBDIR=	yes
PLIST_FILES=	bin/untar

MAKE_ENV+=	PROG=untar NOMAN=yes
MAKE_ARGS+=	CFLAGS="${CFLAGS} -D_POSIX_SOURCE" \
		LDFLAGS="${LDFLAGS} -static"

pre-patch:
	@${CP} ${DISTDIR}/untar.c ${WRKSRC}

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/${PORTNAME} ${PREFIX}/bin

.include <bsd.port.mk>
