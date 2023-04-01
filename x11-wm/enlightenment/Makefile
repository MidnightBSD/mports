PORTNAME=	enlightenment
PORTVERSION=	0.25.4
PORTEPOCH=	2
CATEGORIES=	x11-wm
MASTER_SITES=	http://download.enlightenment.org/rel/apps/${PORTNAME}/
DIST_SUBDIR=	enlightenment

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Artistic and fast X window manager
WWW=		https://www.enlightenment.org/

LICENSE=	bsd2

LIB_DEPENDS=	libefl.so:devel/efl \
		libpulse.so:audio/pulseaudio

USES=		compiler:c11 cpe desktop-file-utils gettext-tools gnome \
		localbase:ldflags meson ninja iconv libtool pathfix pkgconfig \
		tar:xz xorg
USE_XORG=	xcb
USE_LDCONFIG=	yes
INSTALL_TARGET=	install-strip

MESON_ARGS=	-Dsystemd=false -Ddevice-udev=false \
		-Dmount-udisks=false -Dmount-eeze=false -Dbluez5=false \
		-Delput=false -Dgesture-recognition=false

OPTIONS_DEFINE=		NLS EXIF
OPTIONS_DEFAULT=	NLS EXIF
OPTIONS_SUB=		yes

EXIF_DESC=		Exif metadata display support

NLS_USES=		gettext-runtime
NLS_MESON_TRUE=		nls

EXIF_LIB_DEPENDS=	libexif.so:graphics/libexif
EXIF_MESON_TRUE=	libexif


# MESON normalizes ${ARCH} so we cannot use it 'AS IS' without conversion
CURRENT_ARCH=	${ARCH}
.if ${CURRENT_ARCH} == amd64
ENLIGHTENMENT_ARCH=	${OPSYS:tl}-x86_64
.elif ${CURRENT_ARCH} == i386
ENLIGHTENMENT_ARCH=	${OPSYS:tl}-x86
.elif ${CURRENT_ARCH:Marmv?}
ENLIGHTENMENT_ARCH=	${OPSYS:tl}-arm
.else
ENLIGHTENMENT_ARCH=	${OPSYS:tl}-${CURRENT_ARCH:S|amd64|x86_64|}
.endif

ENLIGHTENMENT_VERSION=	0.25.4
PLIST_SUB=              ENLIGHTENMENT_ARCH=${ENLIGHTENMENT_ARCH}-${ENLIGHTENMENT_VERSION}

post-patch:
	${REINPLACE_CMD} -e 's/freebsd/midnightbsd/g' ${WRKSRC}/meson.build

.include <bsd.port.mk>
