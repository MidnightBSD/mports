PORTNAME=	ncspot
DISTVERSIONPREFIX=	v
DISTVERSION=	1.3.2
PORTREVISION=	1
CATEGORIES=	audio

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Ncurses Spotify client
WWW=		https://github.com/hrkfdn/ncspot

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	bindgen:devel/rust-bindgen-cli
LIB_DEPENDS=	libdbus-1.so:devel/dbus

USES=		cargo ssl
USE_GITHUB=	yes
GH_ACCOUNT=	hrkfdn

CARGO_FEATURES=	--no-default-features termion_backend

PLIST_FILES=	bin/ncspot
PORTDOCS=	README.md

OPTIONS_DEFINE=		CLIPBOARD DOCS MPRIS NOTIFY
OPTIONS_DEFAULT=	CLIPBOARD MPRIS NOTIFY PORTAUDIO
OPTIONS_MULTI=		BACKEND
OPTIONS_MULTI_BACKEND=	PORTAUDIO PULSEAUDIO

CLIPBOARD_DESC=	Support for accessing X11 clipboard
MPRIS_DESC=	D-Bus MPRIS support

CLIPBOARD_USES=		python:build xorg
CLIPBOARD_USE=		XORG=xcb
CLIPBOARD_BINARY_ALIAS=	python3=${PYTHON_CMD}
CLIPBOARD_VARS=		CARGO_FEATURES+=share_clipboard

MPRIS_VARS=	CARGO_FEATURES+=mpris

NOTIFY_VARS=	CARGO_FEATURES+=notify

PORTAUDIO_LIB_DEPENDS=	libportaudio.so:audio/portaudio
PORTAUDIO_VARS=		CARGO_FEATURES+=portaudio_backend

PULSEAUDIO_LIB_DEPENDS=	libpulse.so:audio/pulseaudio
PULSEAUDIO_USES=	localbase:ldflags
PULSEAUDIO_VARS=	CARGO_FEATURES+=pulseaudio_backend

post-install:
	${STRIP_CMD} ${PREFIX}/bin/ncspot

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_MAN} ${WRKSRC}/README.md ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
