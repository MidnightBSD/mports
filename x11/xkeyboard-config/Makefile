PORTNAME=	xkeyboard-config
DISTVERSION=	2.48
PORTREVISION=	0
CATEGORIES=	x11
MASTER_SITES=	XORG/individual/data/${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X Keyboard Configuration Database
WWW=		https://freedesktop.org/wiki/Software/XKeyboardConfig/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest>0:devel/py-pytest@${PY_FLAVOR} \
		libxkbcommon>0:x11/libxkbcommon

USES=		meson gnome localbase pathfix perl5 python:build tar:xz

NO_ARCH=	yes
USE_GNOME=	libxslt:build
USE_PERL5=	build

TEST_ENV=	XKBCOMMON_LIB_PATH=${LOCALBASE}/lib/libxkbcommon.so

MESON_ARGS=	-Dxorg-rules-symlinks=true
BINARY_ALIAS=	python3=${PYTHON_CMD}

OPTIONS_DEFINE=	ETERSOFT NLS X11
OPTIONS_DEFAULT=	X11
OPTIONS_SUB=	yes

NLS_USES=		gettext-tools iconv
NLS_MESON_TRUE=	nls

ETERSOFT_DESC=	Add pre-1918 Russian letters to typographic layout
ETERSOFT_EXTRA_PATCHES=	${FILESDIR}/etersoft-patch-symbols-typo

X11_BUILD_DEPENDS=	xkbcomp:x11/xkbcomp
X11_DESC=		XKB keyboard description compiler support

post-install:
	@${MKDIR} ${FAKE_DESTDIR}/var/lib/xkb
	@${LN} -sf /var/lib/xkb ${PREFIX}/share/xkeyboard-config-2/compiled

.include <bsd.port.mk>
