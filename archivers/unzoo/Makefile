# New ports collection makefile for:	unzoo
# Date created:				20 Jun 2005
# Whom:					Emanuel Haupt <ehaupt@critical.ch>
#
# $MidnightBSD: mports/archivers/unzoo/Makefile,v 1.2 2007/08/01 19:46:38 laffer1 Exp $
# $FreeBSD: ports/archivers/unzoo/Makefile,v 1.7 2006/08/11 11:02:17 ehaupt Exp $
#

PORTNAME=	unzoo
DISTVERSION=	4.4
PORTREVISION=	1
CATEGORIES=	archivers
MASTER_SITES=	http://critical.ch/distfiles/ \
		http://energy.critical.ch/distfiles/ \
		${MASTER_SITE_LOCAL}
MASTER_SITE_SUBDIR=	ehaupt

PATCH_SITES=  ${MASTER_SITES}
PATCHFILES=   unzoo_4.4-4.diff.gz
PATCH_DIST_STRIP=     -p1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A zoo archive extractor

EXTRA_DEFINES=	-DSYS_IS_UNIX -DSYS_HAS_MKDIR

PLIST_FILES=	bin/unzoo

MAN1=		unzoo.1

.include <bsd.port.pre.mk>

CFLAGS+=	-trigraphs

do-build:
	${CC} ${CFLAGS} ${EXTRA_DEFINES} -o ${WRKSRC}/${PORTNAME} \
		${WRKSRC}/${PORTNAME}.c

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/${PORTNAME} ${TARGETDIR}/bin
	${INSTALL_MAN} ${WRKSRC}/${PORTNAME}.1 ${MAN1PREFIX}/man/man1

.include <bsd.port.post.mk>
