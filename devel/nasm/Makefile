# $MidnightBSD: mports/devel/nasm/Makefile,v 1.14 2011/12/16 02:00:49 laffer1 Exp $

PORTNAME=	nasm
PORTVERSION=	2.09.10
PORTREVISION=	1
PORTEPOCH=	1
CATEGORIES=	devel lang
MASTER_SITES=	http://www.nasm.us/pub/nasm/releasebuilds/${PORTVERSION}/
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} ${DISTNAME}-xdoc${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	General-purpose multi-platform x86 and x86-64 assembler
LICENSE=	gpl2

USE_BZIP2=	yes
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	${MACHINE_ARCH}-portbld-freebsd7.0
DESTDIRNAME=  INSTALLROOT
INSTALL_TARGET=	install install_rdf
# Fixes parallel builds
USE_GMAKE=    yes 

MAN1=		ldrdf.1 nasm.1 ndisasm.1 rdf2bin.1 rdf2com.1 rdf2ihx.1 \
		rdf2ith.1 rdf2srec.1 rdfdump.1 rdflib.1 rdx.1
PORTDOCS=	*

post-install:
.ifndef(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	${INSTALL_MAN} ${WRKSRC}/doc/nasmdoc.txt ${DOCSDIR}
.endif

.include <bsd.port.mk>
