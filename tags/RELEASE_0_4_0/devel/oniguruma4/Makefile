# New ports collection makefile for:	oniguruma4
# Date created:		31 January 2003
# Whom:			Akinori MUSHA aka knu <knu@idaemons.org>
#
# $MidnightBSD: mports/devel/oniguruma4/Makefile,v 1.3 2007/10/31 20:11:56 laffer1 Exp $
# $FreeBSD: ports/devel/oniguruma4/Makefile,v 1.37 2007/02/11 21:02:15 dinoex Exp $
#

PORTNAME=	oniguruma
PORTVERSION=	4.7.0
PORTREVISION=	1
CATEGORIES=	devel textproc
MASTER_SITES=	http://www.geocities.jp/kosako3/oniguruma/archive/
DISTNAME=	onig-${PORTVERSION}
DIST_SUBDIR=	ruby
PKGNAMESUFFIX=	4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A BSDL Regular Expressions library compatible with POSIX/GNU/Perl
LICENSE=	agg

CONFLICTS=	oniguruma-2.*
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
DOCS=		HISTORY README doc/*

post-patch:
	${REINPLACE_CMD} -e 's|echo aout|echo elf|' \
		${WRKSRC}/configure

post-configure:
	${SED} -e 's|%%PREFIX%%|${PREFIX}|' \
		${FILESDIR}/onig-config > ${WRKSRC}/onig-config

post-install:
	${INSTALL_SCRIPT} ${WRKSRC}/onig-config ${PREFIX}/bin/
.if !defined(NOPORTDOCS)
	${MKDIR} ${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/sample/*.c ${WRKSRC}/sample/Makefile* \
		${EXAMPLESDIR}/
	${MKDIR} ${DOCSDIR}
.for f in ${DOCS}
	${INSTALL_DATA} ${WRKSRC}/${f} ${DOCSDIR}/
.endfor
.endif

.include <bsd.port.mk>
