PORTNAME=	xfce4-bsdcpufreq-plugin
PORTVERSION=	0.3.1
PORTREVISION=	2
CATEGORIES=	sysutils xfce

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Displays the current CPU clock frequency in the panel

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

LIB_DEPENDS=	libharfbuzz.so:print/harfbuzz

USES=		compiler:c11 gnome pkgconfig xfce
USE_XFCE=	libmenu panel
USE_GNOME=	cairo gdkpixbuf gtk30

PLIST_FILES=	lib/xfce4/panel/plugins/libbsdcpufreq.so \
		share/xfce4/panel/plugins/bsdcpufreq.desktop

USE_GITHUB=	yes
GH_ACCOUNT=	riggs-
GH_TAGNAME=	345edc2

do-install:
	${MKDIR} ${STAGEDIR}${PREFIX}/lib/xfce4/panel/plugins
	${MKDIR} ${STAGEDIR}${PREFIX}/share/xfce4/panel/plugins
	${INSTALL_LIB} ${WRKSRC}/libbsdcpufreq.so ${STAGEDIR}${PREFIX}/lib/xfce4/panel/plugins
	${INSTALL_DATA} ${WRKSRC}/bsdcpufreq.desktop ${STAGEDIR}${PREFIX}/share/xfce4/panel/plugins

.include <bsd.port.mk>
