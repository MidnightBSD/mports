# $MidnightBSD$

PORTNAME=	gnome-desktop
PORTVERSION=	3.16.2
PORTREVISION=	1
CATEGORIES=	x11 gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Additional UI API for GNOME 3

LICENSE=	gpl2

USES=		tar:xz

.if defined(REFERENCE_PORT)
PORTSCOUT=	ignore:1
.else
PORTSCOUT=	limitw:1,even

BUILD_DEPENDS=	iso-codes>=0:${PORTSDIR}/misc/iso-codes \
		gsettings-desktop-schemas>=0:${PORTSDIR}/devel/gsettings-desktop-schemas \
		xkeyboard-config>=0:${PORTSDIR}/x11/xkeyboard-config \
		libxkbfile>=0:${PORTSDIR}/x11/libxkbfile \
		itstool:${PORTSDIR}/textproc/itstool \
		python2:${PORTSDIR}/lang/python2 \
		${PYTHON_SITELIBDIR}/libxml2.py:${PORTSDIR}/textproc/py3-libxml2 \
		${LOCALBASE}/lib/python2.7/site-packages/libxml2.py:${PORTSDIR}/textproc/py-libxml2	
RUN_DEPENDS=	iso-codes>=0:${PORTSDIR}/misc/iso-codes \
		gsettings-desktop-schemas>=0:${PORTSDIR}/devel/gsettings-desktop-schemas \
		xkeyboard-config>=0:${PORTSDIR}/x11/xkeyboard-config \
		libxkbfile>=0:${PORTSDIR}/x11/libxkbfile \
		python2:${PORTSDIR}/lang/python2 \
		${PYTHON_SITELIBDIR}/libxml2.py:${PORTSDIR}/textproc/py3-libxml2 \
		${LOCALBASE}/lib/python2.7/site-packages/libxml2.py:${PORTSDIR}/textproc/py-libxml2	

USES+=		bison gettext gmake libtool pathfix pkgconfig python:3
USE_GNOME=	gtk30 intlhack introspection:build referencehack
USE_XORG=	x11 xrandr xext
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-gnome-distributor="MidnightBSD"
CPPFLAGS+=	-I${LOCALBASE}/include
LIBS+=		-L${LOCALBASE}/lib
INSTALL_TARGET=	install-strip

post-patch:
	@${REINPLACE_CMD} -e 's|xsltproc -o| xsltproc --nonet -o|g' \
		${WRKSRC}/desktop-docs/fdl/Makefile.in \
		${WRKSRC}/desktop-docs/gpl/Makefile.in \
		${WRKSRC}/desktop-docs/lgpl/Makefile.in

.include <bsd.port.mk>

.endif
