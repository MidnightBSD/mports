PORTNAME=	gtkglext
PORTVERSION=	1.2.0
PORTREVISION=	7
CATEGORIES=	x11-toolkits
MASTER_SITES=	SF
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	OpenGL extension to GTK+

LICENSE=	lgpl2.1 # or later
LICENSE_FILE=	${WRKSRC}/COPYING.LIB

GNU_CONFIGURE=	yes
USES=		gettext gmake gnome gl iconv libtool pathfix pkgconfig tar:bzip2 xorg
USE_GL=		glu
USE_GNOME=	gtk20 pangox-compat
USE_LDCONFIG=	yes
INSTALL_TARGET=	install-strip

OPTIONS_DEFINE=	DOCS

post-patch:
	@${REINPLACE_CMD} -e \
		'/^SUBDIRS/s|docs||' ${WRKSRC}/Makefile.in
	@${FIND} ${WRKSRC} -name "Makefile.in" | ${XARGS} ${REINPLACE_CMD} -e \
		's|-DGTK_DISABLE_DEPRECATED||g ; \
		 s|-DGDK_DISABLE_DEPRECATED||g'

post-install:
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/docs/reference/gtkglext/html/* ${STAGEDIR}${DOCSDIR}/

.include <bsd.port.mk>
