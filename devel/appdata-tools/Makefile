# $MidnightBSD$

PORTNAME=	appdata-tools
PORTVERSION=	0.1.8
CATEGORIES=	devel
DIST_SUBDIR=	gnome3

WRKSRC=		${WRKDIR}/hughsie-appdata-tools-${GH_COMMIT}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	AppData is a subset of AppStream

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libsoup-2.4.so:${PORTSDIR}/devel/libsoup \
		libappstream-glib.so:${PORTSDIR}/devel/appstream-glib

GH_ACCOUNT=	hughsie
GH_PROJECT=	appdata-tools
GH_COMMIT=      c1238e3
GH_TAGNAME=	${GH_COMMIT}

GNU_CONFIGURE=	yes
PATHFIX_MAKEFILEIN=	Makefile.am
#CONFIGURE_ARGS=	--enable-introspection=yes
USE_GITHUB=	yes
USES=		autoreconf:build gettext gmake libtool pathfix pkgconfig
USE_GNOME=	gdkpixbuf2 glib20 intltool introspection:build
USE_LDCONFIG=	yes

post-patch:
	@${REINPLACE_CMD} -e 's|-Wclobbered||g ; \
		s|-Wempty-body||g ; \
		s|-Wignored-qualifiers||g ; \
		s|-Wtype-limits||g ; \
		s|-Wmissing-parameter-type||g' \
		${WRKSRC}/configure.ac

pre-configure:
	(cd ${WRKSRC} && ${SETENV} NOCONFIGURE=yes ${SH} ./autogen.sh)
	${REINPLACE_CMD} 's/DATADIRNAME=lib/DATADIRNAME=share/' \
		${WRKSRC}/configure

.include <bsd.port.mk>
