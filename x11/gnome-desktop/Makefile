# $MidnightBSD: mports/x11/gnome-desktop/Makefile,v 1.5 2009/08/29 22:41:14 laffer1 Exp $

PORTNAME=	gnome-desktop
PORTVERSION=	2.26.2
PORTREVISION?=	0
CATEGORIES=	x11 gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Additional UI API for GNOME 2
LICENSE=	gpl2

USE_BZIP2=	yes

.if !defined(REFERENCE_PORT)

RUN_DEPENDS=	${pygnome2_DETECT}:${PORTSDIR}/x11-toolkits/py-gnome2

USE_XORG=	xpm
USE_GNOME=	gnomeprefix gnomehack intlhack libgnomeui gnomedocutils \
		ltverhack referencehack
GNOME_DESKTOP_VERSION=2
USE_GETTEXT=	yes
USE_GMAKE=	yes
USE_BISON=	build
USE_PYTHON=	yes
INSTALLS_OMF=	yes
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool:22
CONFIGURE_ARGS=	--with-gnome-distributor="MidnightBSD" \
		--with-kde-datadir=${LOCALBASE}/share
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

MAN1=	gnome-about.1

post-patch:
	@${REINPLACE_CMD} -e 's|xsltproc -o| xsltproc --nonet -o|g' \
		${WRKSRC}/desktop-docs/fdl/Makefile.in \
		${WRKSRC}/desktop-docs/gpl/Makefile.in \
		${WRKSRC}/desktop-docs/lgpl/Makefile.in

.include <bsd.port.mk>

.endif
