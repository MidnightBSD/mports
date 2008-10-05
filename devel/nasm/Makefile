# New ports collection makefile for:	nasm
# Date created:        7 April 1998
# Whom:                Murray Stokely <murray@cdrom.com>
#
# $MidnightBSD: mports/devel/nasm/Makefile,v 1.7 2008/10/04 16:23:47 laffer1 Exp $
# $FreeBSD: ports/devel/nasm/Makefile,v 1.28 2006/05/04 21:40:56 edwin Exp $
#

PORTNAME=	nasm
PORTVERSION=	2.03
PORTEPOCH=	1
CATEGORIES=	devel lang
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	nasm
DISTFILES=	${DISTNAME}${EXTRACT_SUFX}  ${DISTNAME}-xdoc${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	General-purpose multi-platform x86 and x86-64 assembler
LICENSE=	gpl2

USE_BZIP2=	yes
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=--build=${MACHINE_ARCH}-portbld-freebsd6.0
DESTDIRNAME=	INSTALLROOT
INSTALL_TARGET=	install install_rdf
MAN1=		nasm.1 ndisasm.1 \
		ldrdf.1 rdf2bin.1 rdf2com.1 rdfdump.1 rdflib.1 rdx.1

post-install:
	${LN} -sf nasm ${PREFIX}/bin/${DISTNAME}
.ifndef(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	${INSTALL_MAN} ${WRKSRC}/doc/nasmdoc.txt ${DOCSDIR}
.endif

.include <bsd.port.mk>
