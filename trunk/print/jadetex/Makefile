# $MidnightBSD: mports/print/jadetex/Makefile,v 1.4 2010/05/05 23:58:31 laffer1 Exp $

PORTNAME=		jadetex
PORTVERSION=		3.13
PORTREVISION=		4
CATEGORIES=		print
MASTER_SITES=		${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	jadetex

MAINTAINER=		ports@MidnightBSD.org
COMMENT=		A TeX backend for Jade, for typesetting SGML documents
LICENSE=		unknown

BUILD_DEPENDS+=		etex:${PORTSDIR}/print/teTeX-base
LIB_DEPENDS+=		png15:${PORTSDIR}/graphics/png
RUN_DEPENDS+=		etex:${PORTSDIR}/print/teTeX-base

TEXMFMAIN=              ${PREFIX}/share/texmf

#MAKE_ENV=		TEXMFCNF=${FILESDIR}:${TETMFMAIN}/web2c

MESSAGE=		${PKGDIR}/pkg-message
PKGMESSAGE=		${WRKDIR}/pkg-message

MAN1=			jadetex.1 pdfjadetex.1

pre-patch:
	@${SED} -e 's,%%LOCALBASE%%,${PREFIX},' ${MESSAGE} > ${PKGMESSAGE}

do-install:
	@cd ${WRKSRC}; \
	 ${MKDIR} ${TEXMFMAIN}/web2c; \
	 ${INSTALL_DATA} jadetex.fmt pdfjadetex.fmt ${TEXMFMAIN}/web2c; \
	 ${MKDIR} -m 555 ${TEXMFMAIN}/tex/jadetex; \
	 ${INSTALL_DATA} dsssl.def jadetex.ltx ${TEXMFMAIN}/tex/jadetex; \
	 ${INSTALL_MAN} ${MAN1} ${MANPREFIX}/man/man1
	@${LN} -sf ${PREFIX}/bin/etex ${PREFIX}/bin/jadetex
	@${LN} -sf ${PREFIX}/bin/pdfetex ${PREFIX}/bin/pdfjadetex

.include <bsd.port.mk>
