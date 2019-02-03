# $MidnightBSD$
# $FreeBSD: ports/devel/gnome-js-common/Makefile,v 1.3 2010/05/31 01:58:12 ade Exp $

PORTNAME=	gnome-js-common
PORTVERSION=	0.1.2
PORTREVISION=	2
CATEGORIES=	devel gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME JavaScript common modules and tests

LICENSE=	gpl3

GNU_CONFIGURE=	yes
USE_GNOME=	intltool
USES=		pathfix pkgconfig gettext gmake tar:bzip2

PORTDOCS=	AUTHORS COPYING INSTALL NEWS README ChangeLog

OPTIONS_DEFINE=	DOCS

.include <bsd.mport.options.mk>

post-patch:
	@${REINPLACE_CMD} -e 's|== x|= x|g' \
		${WRKSRC}/configure
.if ${PORT_OPTIONS:MDOCS}
	@${REINPLACE_CMD} -e 's|$${prefix}/share/doc/gnome_js_common|${DOCSDIR}|' \
		${WRKSRC}/Makefile.in
.else
	@${REINPLACE_CMD} -e 's|install-gnome_js_commondocDATA ||g' ${WRKSRC}/Makefile.in
.endif

.include <bsd.port.mk>
