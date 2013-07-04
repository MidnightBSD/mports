# Ports collection makefile for:	giblib
# Date created:				12 Nov 2000
# Whom:					Jeremy Norris <ishmael27@home.com>
#
# $MidnightBSD: mports/graphics/giblib/Makefile,v 1.6 2008/06/01 23:10:29 laffer1 Exp $
# $FreeBSD: ports/graphics/giblib/Makefile,v 1.20 2006/05/07 23:46:02 edwin Exp $
#

PORTNAME=	giblib
PORTVERSION=	1.2.4
PORTREVISION=	5
CATEGORIES=	graphics devel
MASTER_SITES=	http://linuxbrit.co.uk/downloads/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A utility library that includes a wrapper for imlib2
LICENSE=	other

LIB_DEPENDS=	Imlib2.5:${PORTSDIR}/graphics/imlib2

USE_GNOME=	gnomehack  pkgconfig
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes

post-patch:
	@${REINPLACE_CMD} -e 's|: install-docsDATA|:|g' ${WRKSRC}/Makefile.in

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
.for file in AUTHORS ChangeLog README TODO
	${INSTALL_DATA} ${WRKSRC}/${file} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.mk>
