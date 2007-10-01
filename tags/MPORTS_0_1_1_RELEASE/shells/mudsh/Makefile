# New ports collection makefile for:   mudsh
# Date created:        28 February 2001
# Whom:                George Reid <greid@ukug.uk.freebsd.org>
#
# $MidnightBSD: mports/shells/mudsh/Makefile,v 1.1 2006/09/18 13:33:11 laffer1 Exp $
# $FreeBSD: ports/shells/mudsh/Makefile,v 1.7 2003/11/05 12:06:21 linimon Exp $
#

PORTNAME=	mudsh
PORTVERSION=	20010311
CATEGORIES=	shells
MASTER_SITES=	http://www.xirium.com/tech/mud-shell/download/
DISTNAME=	mudsh
EXTRACT_SUFX=
EXTRACT_ONLY=

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An "intelligent" game-like shell

NO_WRKSUBDIR=	yes

NO_BUILD=	yes

post-extract:
	@${CP} ${DISTDIR}/${DISTNAME} ${WRKSRC}

do-patch:
	@(${SED} -e 's,/usr/local/bin/perl,${PERL},1' ${WRKSRC}/${DISTNAME} \
		> ${WRKDIR}/foo && ${MV} ${WRKDIR}/foo ${WRKSRC}/${DISTNAME})

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/${DISTNAME} ${PREFIX}/bin


.include <bsd.port.mk>
