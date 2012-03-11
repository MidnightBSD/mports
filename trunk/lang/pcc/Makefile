# Ports collection makefile for:  pcc
# Date created:			  May 12, 2008
# Whom:				  Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD: mports/lang/pcc/Makefile,v 1.5 2011/04/26 04:29:05 laffer1 Exp $

PORTNAME=	pcc
PORTVERSION=	1.0.0
PORTREVISION?=	0
CATEGORIES=	lang
MASTER_SITES=	ftp://pcc.ludd.ltu.se/pub/pcc-releases/ \
		http://pcc.ludd.ltu.se/ftp/pub/pcc-releases/ \
		ftp://226.net120.skekraft.net/pcc-releases/
DISTNAME=	pcc-${PORTVERSION}
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The Portable C Compiler
LICENSE=	bsd4
#it's a mix of several BSD licenses, and we'll go worst case.

ONLY_FOR_ARCHS=	i386 amd64

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}
GNU_CONFIGURE=	yes
CONFIGURE_ENV+=	YACC=${YACC}
CONFIGURE_TARGET= --build=${ARCH}-portbld-freebsd7.0
USE_GMAKE=	yes

PLIST_FILES=	bin/pcc libexec/ccom libexec/cpp \
		man/man1/pcc.1 man/man1/cpp.1 man/man1/ccom.1

pre-configure:
	${MKDIR} ${WRKSRC}/os/freebsd
	${LN} -sf ${FILESDIR}/*.h ${WRKSRC}/os/freebsd

.include <bsd.port.mk>
