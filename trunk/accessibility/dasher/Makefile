# $MidnightBSD$

PORTNAME=	dasher
PORTVERSION=	4.10.1
PORTEPOCH=	2
CATEGORIES=	accessibility editors x11 gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Information efficient text-entry interface
LICENSE=	gpl2

BUILD_DEPENDS=	rarian-sk-config:${PORTSDIR}/textproc/rarian
RUN_DEPENDS=	rarian-sk-config:${PORTSDIR}/textproc/rarian

USE_BZIP2=	yes
USE_GETTEXT=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomeprefix gnomehack intlhack gnomehier libgnomeui atspi \
		libwnck gnomedocutils
WANT_GNOME=	yes
GNU_CONFIGURE=	yes
INSTALLS_ICONS=	yes
INSTALLS_OMF=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

GCONF_SCHEMAS=	dasher.schemas
MAN1=		dasher.1

.include <bsd.port.pre.mk>

CONFIGURE_ARGS+=	--disable-speech

post-patch:
	@${REINPLACE_CMD} -e 's|-O2||g' ${WRKSRC}/configure
	@${FIND} ${WRKSRC} -name "Makefile.in" | ${XARGS} ${REINPLACE_CMD} -e \
		's|-O2||g'
.if ${OSVERSION} >= 700042
	@${REINPLACE_CMD} -e 's|__gnu_cxx::lldiv|lldiv|' \
	    	${WRKSRC}/Src/DasherCore/DasherViewSquare.cpp
.endif

.include <bsd.port.post.mk>
