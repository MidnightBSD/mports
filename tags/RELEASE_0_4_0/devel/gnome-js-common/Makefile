# $MidnightBSD$
# $FreeBSD: ports/devel/gnome-js-common/Makefile,v 1.3 2010/05/31 01:58:12 ade Exp $

PORTNAME=	gnome-js-common
PORTVERSION=	0.1.2
CATEGORIES=	devel gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME JavaScript common modules and tests
LICENSE=	gpl3

USE_BZIP2=	yes
GNU_CONFIGURE=	yes
USE_GMAKE=	yes
USE_GETTEXT=	yes
USE_GNOME=	gnomehack intltool

PORTDOCS=	AUTHORS COPYING INSTALL NEWS README ChangeLog

post-patch:
	@${REINPLACE_CMD} -e 's|== x|= x|g' \
		${WRKSRC}/configure
.if !defined(NOPORTDOCS)
	@${REINPLACE_CMD} -e 's|$${prefix}/share/doc/gnome_js_common|${DOCSDIR}|' \
		${WRKSRC}/Makefile.in
.else
	@${REINPLACE_CMD} -e 's|install-gnome_js_commondocDATA ||g' ${WRKSRC}/Makefile.in
.endif

.include <bsd.port.mk>
