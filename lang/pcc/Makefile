# Ports collection makefile for:  pcc
# Date created:			  May 12, 2008
# Whom:				  Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD$

PORTNAME=	pcc
PORTVERSION=	1.0.0
PORTREVISION?=	1
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

MAKE_JOBS_UNSAFE=yes

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}
GNU_CONFIGURE=	yes
CONFIGURE_ENV+=	YACC=${YACC}
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd9.1
USE_GMAKE=	yes
CONFIGURE_ARGS+=--mandir=${PREFIX}/man

PLIST_FILES=	bin/pcc libexec/ccom libexec/cpp \
		man/man1/pcc.1.gz man/man1/cpp.1.gz man/man1/ccom.1.gz

pre-configure:
	${MKDIR} ${WRKSRC}/os/freebsd
	${LN} -sf ${FILESDIR}/*.h ${WRKSRC}/os/freebsd

.include <bsd.port.mk>
