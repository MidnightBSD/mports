PORTNAME=	libglvnd
DISTVERSION=	1.7.0
CATEGORIES=	graphics
MASTER_SITES=	https://gitlab.freedesktop.org/glvnd/${PORTNAME}/uploads/c24806c283070dc70700234ca8ffacf8/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GL Vendor-Neutral Dispatch library
WWW=		https://gitlab.freedesktop.org/glvnd/libglvnd

LICENSE=	Apache-2.0 mit
LICENSE_COMB=	multi

USES=		compiler:c++11-lib localbase meson pkgconfig
USE_LDCONFIG=	yes

OPTIONS_DEFINE=	X11
OPTIONS_DEFAULT=X11
OPTIONS_SUB=	yes

X11_USES=		xorg
X11_USE=		XORG=x11,xext,xorgproto
X11_MESON_ENABLED=	x11 glx

NO_TEST=	yes
MESON_DISABLED=	tests

.include <bsd.mport.options.mk>

.if ${ARCH} == powerpc || ${ARCH} == riscv64
MESON_ARGS+=	-Dasm=disabled
.endif

.if ${ARCH} == powerpc
MESON_ARGS+=	-Dtls=false
.endif

# Lots of software expects gl.pc even when it can build with EGL only
post-install-X11-off:
	${LN} -s opengl.pc ${FAKE_DESTDIR}${PREFIX}/libdata/pkgconfig/gl.pc

.include <bsd.port.mk>
