# ex:ts=8
# Ports collection makefile for:  pcc
# Date created:			  May 12, 2008
# Whom:				  Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD: mports/lang/pcc/Makefile,v 1.2 2008/09/01 02:37:59 laffer1 Exp $
#

PORTNAME=	pcc
DATESPEC=	081227
PORTVERSION=	0.9.9.${DATESPEC}
PORTREVISION?=	0
CATEGORIES=	lang
MASTER_SITES=	ftp://pcc.ludd.ltu.se/pub/pcc/ \
		http://pcc.ludd.ltu.se/ftp/pub/pcc/ \
		ftp://226.net120.skekraft.net/pcc/
DISTNAME=	pcc-${DATESPEC}
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	S.C.Johnson's Portable C Compiler
LICENSE=	bsd4
#it's a mix of several BSD licenses, and we'll go worst case.

ONLY_FOR_ARCHS=	i386

WRKSRC=		${WRKDIR}/${PORTNAME}-${DATESPEC}
GNU_CONFIGURE=	yes
CONFIGURE_ENV+=	YACC=${YACC}
CONFIGURE_TARGET= --build=${ARCH}-portbld-freebsd6.0
USE_GMAKE=	yes

PLIST_FILES=	bin/pcc libexec/ccom libexec/cpp \
		man/man1/pcc.1 man/man1/cpp.1 man/man1/ccom.1

pre-configure:
	${MKDIR} ${WRKSRC}/os/freebsd
	${LN} -sf ${FILESDIR}/*.h ${WRKSRC}/os/freebsd

.include <bsd.port.mk>
