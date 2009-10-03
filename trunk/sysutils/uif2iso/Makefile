# New ports collection makefile for:	sysutils/uif2iso
# Date created:				27 Jan 2008
# Whom:					Martin Tournoij <carpetsmoker@xs4all.nl>
#
# $MidnightBSD: mports/sysutils/uif2iso/Makefile,v 1.1 2008/08/24 21:47:44 laffer1 Exp $
# $FreeBSD: ports/sysutils/uif2iso/Makefile,v 1.3 2008/03/31 07:30:00 jadawin Exp $
#

PORTNAME=	uif2iso
PORTVERSION=	0.1.7a
CATEGORIES=	sysutils
MASTER_SITES=	http://www.xs4all.nl/distfiles/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Convert MagicISO UIF files to ISO9660
LICENSE=	gpl2

PLIST_FILES=	bin/uif2iso
PORTDOCS=	uif2iso.txt

post-patch:
	@${REINPLACE_CMD} 's|exit(1)|exit(0)|' ${WRKSRC}/uif2iso.c
	@${REINPLACE_CMD} 's|/usr/local|${PREFIX}|' ${WRKSRC}/Makefile

post-install:
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/uif2iso.txt ${DOCSDIR}
.endif

# Original files from author contain no version number and are not in
# a separate directory.
.if defined(MAINTAINER)
distfile:
	rm -fr /tmp/${PORTNAME}-${PORTVERSION}
	mkdir /tmp/${PORTNAME}-${PORTVERSION}
	cd /tmp/${PORTNAME}-${PORTVERSION} && \
	fetch http://aluigi.altervista.org/mytoolz/${PORTNAME}.zip && \
	tar xf ${PORTNAME}.zip && \
	mv src/* . && \
	rm -rf ${PORTNAME}.zip *.exe src && \
	chmod 664 *
	cd /tmp && \
	tar cf ${PORTNAME}-${PORTVERSION}.tar.gz ${PORTNAME}-${PORTVERSION}
	rm -fr /tmp/${PORTNAME}-${PORTVERSION}
.endif

.include <bsd.port.mk>
