PORTNAME=	sysctlview
PORTVERSION=	2.1
CATEGORIES=	deskutils

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Graphical sysctl MIB explorer
WWW=		https://gitlab.com/alfix/sysctlview/

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

LIB_DEPENDS=	libsysctlmibinfo2.so:devel/libsysctlmibinfo2
RUN_DEPENDS=	xdg-open:devel/xdg-utils

USES=		compiler:c++11-lang gnome pkgconfig
USE_GITLAB=	yes
GL_ACCOUNT=	alfix
GL_TAGNAME=	6ef5c821f66d92c2a1ca3fc964b511425dacd18e
USE_GNOME=	atk atkmm cairo cairomm gdkpixbuf glib20 glibmm gtk30 gtkmm30 \
		libsigc++20 pango pangomm

DESKTOP_ENTRIES=	"Sysctlview" \
			"Show and set the kernel state" \
			"sysctlview" \
			"sysctlview" \
			"System;" \
			false

.include <bsd.port.pre.mk>

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/sysctlview ${STAGEDIR}${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/sysctlview.1 ${STAGEDIR}${PREFIX}/share/man/man1
.for i in 16 22 24 32 36 48 64 72 96 128 192 256
	@${MKDIR} ${STAGEDIR}${PREFIX}/share/icons/hicolor/${i}x${i}/apps/
	${INSTALL_DATA} ${WRKSRC}/icon/sysctlview-${i}.png \
		${STAGEDIR}${PREFIX}/share/icons/hicolor/${i}x${i}/apps/sysctlview.png
.endfor
	@${MKDIR} ${STAGEDIR}${PREFIX}/share/icons/hicolor/scalable/apps/
	${INSTALL_DATA} ${WRKSRC}/icon/sysctlview.svg \
		${STAGEDIR}${PREFIX}/share/icons/hicolor/scalable/apps/sysctlview.svg

.include <bsd.port.post.mk>
