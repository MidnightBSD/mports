# $MidnightBSD$

PORTNAME=	dasher
PORTVERSION=	4.10.1
PORTREVISION=	4
PORTEPOCH=	2
CATEGORIES=	accessibility editors x11 gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Information efficient text-entry interface

LICENSE=	gpl2

BUILD_DEPENDS=	rarian-sk-config:${PORTSDIR}/textproc/rarian
LIB_DEPENDS=	libogg.so:${PORTSDIR}/audio/libogg
RUN_DEPENDS=	rarian-sk-config:${PORTSDIR}/textproc/rarian

USES=		gettext gmake pathfix pkgconfig tar:bzip2
USE_GNOME=	gnomeprefix intlhack libgnomeui atspi \
		libwnck gnomedocutils
GNU_CONFIGURE=	yes
INSTALLS_ICONS=	yes
INSTALLS_OMF=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

GCONF_SCHEMAS=	dasher.schemas

CONFIGURE_ARGS+=	--disable-speech

post-patch:
	@${REINPLACE_CMD} -e 's|-O2||g' ${WRKSRC}/configure
	@${FIND} ${WRKSRC} -name "Makefile.in" | ${XARGS} ${REINPLACE_CMD} -e \
		's|-O2||g'
	@${REINPLACE_CMD} -e 's|__gnu_cxx::lldiv|lldiv|' \
	    	${WRKSRC}/Src/DasherCore/DasherViewSquare.cpp

.include <bsd.port.mk>
