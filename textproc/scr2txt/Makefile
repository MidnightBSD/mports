# New ports collection makefile for:	scr2txt
# Date created:				18 May 2001
# Whom:					nik
#
# $MidnightBSD: mports/textproc/scr2txt/Makefile,v 1.2 2007/05/18 18:42:18 ctriv Exp $
# $FreeBSD: ports/textproc/scr2txt/Makefile,v 1.5 2006/04/15 06:46:10 linimon Exp $
#

PORTNAME=	scr2txt
PORTVERSION=	1.2
CATEGORIES=	textproc

MASTER_SITES=	${MASTER_SITE_LOCAL}
MASTER_SITE_SUBDIR= nik
NO_WRKSUBDIR=	yes

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Converts the output of "vidcontrol -p" to text
LICENSE=        gpl2
MAN1=		scr2txt.1
MANCOMPRESSED=	yes
PLIST_FILES=	bin/scr2txt

do-install:	
	@cd ${WRKSRC}; ${MAKE} BINDIR=${PREFIX}/bin SHAREDIR=${PREFIX} install

.include <bsd.port.mk>
