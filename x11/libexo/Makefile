PORTNAME=	libexo
PORTVERSION=	0.12.11
CATEGORIES=	x11 xfce
MASTER_SITES=	XFCE
DISTNAME=	exo-${DISTVERSIONFULL}
DIST_SUBDIR=	xfce4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Application library for the Xfce desktop environment

LICENSE=	gpl2 lgpl2.1
LICENSE_COMB=	multi

LIB_DEPENDS=	libfontconfig.so:x11-fonts/fontconfig \
		libfreetype.so:print/freetype2
BUILD_DEPENDS=	p5-URI>=1.70:net/p5-URI
RUN_DEPENDS=	p5-URI>=1.70:net/p5-URI

USES=		compiler:c11 desktop-file-utils gettext-tools gmake gnome \
		libtool pathfix perl5 pkgconfig tar:bzip2 xfce xorg
USE_GNOME=	cairo glib20 gtk30 intltool
USE_LDCONFIG=	yes
USE_XFCE=	libmenu
USE_XORG=	ice sm x11

WRKSRC=		${WRKDIR}/${DISTNAME}
GNU_CONFIGURE=	yes
INSTALLS_ICONS=	yes
INSTALL_TARGET=	install-strip
CONFIGURE_ARGS=	--without-html-dir --disable-silent-rules

OPTIONS_DEFINE=	GTK2 NLS
OPTIONS_DEFAULT=	GTK2
OPTIONS_SUB=	yes

GTK2_USE=	gnome=gtk20
GTK2_CONFIGURE_ENABLE=	gtk2

NLS_CONFIGURE_ENABLE=	nls
NLS_USES=		gettext-runtime

.include <bsd.port.mk>
