# New ports collection makefile for:	bisongen
# Date created:				August 8th 2005
# Whom:					Frerich Raabe <frerich.raabe@gmx.de>
#
# $MidnightBSD: mports/devel/bisongen/Makefile,v 1.1 2008/04/01 03:23:04 laffer1 Exp $
# $FreeBSD: ports/devel/bisongen/Makefile,v 1.3 2007/07/30 09:41:08 alexbl Exp $
#

PORTNAME=	bisongen
PORTVERSION=	0.8.0b1
CATEGORIES=	devel python
MASTER_SITES=	ftp://ftp.fourthought.com/pub/BisonGen/
DISTNAME=	BisonGen-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A general-purpose parser generator for Python
LICENSE=	other
#apache 1.1 like

USE_BZIP2=	yes
USE_PYTHON=	yes
USE_PYDISTUTILS=yes
PYDISTUTILS_PKGNAME=	BisonGen

post-install:
	${MKDIR} ${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/examples/simple/* ${EXAMPLESDIR}

.include <bsd.port.mk>
