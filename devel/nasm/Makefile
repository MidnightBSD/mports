# $MidnightBSD: mports/devel/nasm/Makefile,v 1.9 2009/01/04 20:03:31 ctriv Exp $

PORTNAME=	nasm
PORTVERSION=	2.05.01
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
CONFIGURE_TARGET=--build=${MACHINE_ARCH}-portbld-freebsd6.1
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
