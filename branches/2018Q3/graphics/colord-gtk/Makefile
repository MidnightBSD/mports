# Created by: Koop Mast <kwm@FreeBSD.org>
# $MidnightBSD$
# $FreeBSD: head/graphics/colord-gtk/Makefile 393607 2015-08-05 19:13:24Z kwm $

PORTNAME=	colord-gtk
PORTVERSION=	0.1.26
CATEGORIES=	graphics
MASTER_SITES=	http://www.freedesktop.org/software/colord/releases/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Manage color profiles to accurately color input/output devices

LICENSE=	lgpl3

BUILD_DEPENDS=	colord>=0.1.20:${PORTSDIR}/graphics/colord
LIB_DEPENDS=	libcolord.so:${PORTSDIR}/graphics/colord \
		libpolkit-gobject-1.so:${PORTSDIR}/sysutils/polkit \
		libdbus-1.so:${PORTSDIR}/devel/dbus \
		liblcms2.so:${PORTSDIR}/graphics/lcms2

USE_GNOME=	gtk30 intlhack introspection:build
USES=		gettext gmake libtool pathfix pkgconfig tar:xz
USE_SQLITE=	3
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--enable-gtk-doc-html=no
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
INSTALL_TARGET=	install-strip

OPTIONS_SUB=	yes
OPTIONS_DEFINE=	MANPAGES
OPTIONS_DEFAULT=MANPAGES

MANPAGES_BUILD_DEPENDS=	docbook2html:${PORTSDIR}/textproc/docbook-utils \
			docbook-sgml>0:${PORTSDIR}/textproc/docbook-sgml

.include <bsd.mport.options.mk>

post-patch:
	@${REINPLACE_CMD} -e 's|-Wclobbered||g' \
		-e 's|-Wempty-body||g' \
		-e 's|-Wignored-qualifiers||g' \
		-e 's|-Wtype-limits||g' \
		-e 's|-Wmissing-parameter-type||g' \
		${WRKSRC}/configure

.if ! ${PORT_OPTIONS:MMANPAGES}
	@${REINPLACE_CMD} -e "s|2MAN_TRUE=$$|2MAN_TRUE='#'|g ; \
		s|2MAN_FALSE='#'|2MAN_FALSE=|g" ${WRKSRC}/configure
.endif

.include <bsd.port.mk>
