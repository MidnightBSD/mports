# New ports collection makefile for:	sysutils/uif2iso
# Date created:				27 Jan 2008
# Whom:					Martin Tournoij <carpetsmoker@xs4all.nl>
#
# $MidnightBSD$
# $FreeBSD: ports/sysutils/uif2iso/Makefile,v 1.3 2008/03/31 07:30:00 jadawin Exp $
#

PORTNAME=	uif2iso
PORTVERSION=	0.1.3
CATEGORIES=	sysutils
MASTER_SITES=	http://www.carpetsmoker.net/distfiles/ \
		http://www.xs4all.nl/distfiles/ \
		http://www.rwxrwxrwx.net/distfiles/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Convert MagicISO UIF files to ISO9660
LICENSE=	gpl2

PLIST_FILES=	bin/uif2iso
PORTDOCS=	uif2iso.txt

do-build:
	${CC} -o ${WRKSRC}/${PORTNAME} ${CFLAGS} -lz -lssl ${WRKSRC}/uif2iso.c

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/uif2iso ${PREFIX}/bin/
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/uif2iso.txt ${DOCSDIR}
.endif

.include <bsd.port.mk>
