PORTNAME=	gigolo
PORTVERSION=	0.5.3
PORTREVISION=	2
CATEGORIES=	sysutils
MASTER_SITES=	XFCE/apps

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Frontend to easily manage filesystem connections
WWW=		https://docs.xfce.org/apps/gigolo/start

LICENSE=	gpl2

BUILD_DEPENDS=	p5-XML-Parser>=0:textproc/p5-XML-Parser
LIB_DEPENDS=	libharfbuzz.so:print/harfbuzz

USES=		gettext-tools gmake gnome pkgconfig tar:bzip2 xfce xorg
USE_GNOME=	cairo gdkpixbuf2 gtk30 gvfs intltool
USE_XORG=	x11

GNU_CONFIGURE=	yes

PORTDOCS=	AUTHORS ChangeLog NEWS THANKS TODO

OPTIONS_DEFINE=	DOCS NLS
OPTIONS_SUB=	yes

NLS_CONFIGURE_ENABLE=	nls
NLS_USES=	gettext-runtime

post-patch:
	@${REINPLACE_CMD} -e 's|^DOCFILES.*|DOCFILES =|' \
		${WRKSRC}/Makefile.in
	@${REINPLACE_CMD} -e \
		's|$$(prefix)/$$(DATADIRNAME)/locale|$$(datarootdir)/locale|' \
		${WRKSRC}/po/Makefile.in.in

post-install:
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/|} ${DOCSDIR}

.include <bsd.port.mk>
