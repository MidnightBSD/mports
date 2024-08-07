PORTNAME=	i3lock-color
DISTVERSION=	2.13.c.4
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Enhanced i3lock with higher capacity
WWW=		https://github.com/Raymo111/i3lock-color

LICENSE=	bsd3

BUILD_DEPENDS=	${LOCALBASE}/bin/pam_helper:security/pam_helper
LIB_DEPENDS=	libev.so:devel/libev \
		libfontconfig.so:x11-fonts/fontconfig \
		libfreetype.so:print/freetype2 \
		libxcb-image.so:x11/xcb-util-image \
		libxcb-keysyms.so:x11/xcb-util-keysyms \
		libxcb-util.so:x11/xcb-util \
		libxcb-xrm.so:x11/xcb-util-xrm \
		libxkbcommon.so:x11/libxkbcommon \
		libxkbfile.so:x11/libxkbfile

USES=		autoreconf gmake gnome iconv jpeg localbase pkgconfig tar:bzip2 xorg
USE_CSTD=	c99
USE_GCC=	yes
USE_GITHUB=	yes
GH_ACCOUNT=	Raymo111
USE_GNOME=	cairo
USE_XORG=	x11 xcb xext xinerama xorgproto xrandr xt

GNU_CONFIGURE=	yes

MAKE_ARGS=	PREFIX="${PREFIX}" X11LIB="${LOCALBASE}/lib" \
		X11INC="${LOCALBASE}/include" CC="${CC}"

LDFLAGS+=	${ICONV_LIB}

CONFLICTS_INSTALL=	i3lock

PLIST_FILES=	"@(,,4755) bin/i3lock" \
		share/man/man1/i3lock.1.gz

OPTIONS_DEFINE=	DOCS

DOC_FILES=	CHANGELOG README.md
DOCS_PLIST_FILES=	${DOC_FILES:S|^|${DOCSDIR_REL}/|}

post-install:
	@${STRIP_CMD} ${FAKE_DESTDIR}/${LOCALBASE}/bin/i3lock
	@${RM} ${FAKE_DESTDIR}/${LOCALBASE}/etc/pam.d/i3lock

post-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${DOC_FILES:S|^|${WRKSRC}/|} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
