PORTNAME=	pixman
PORTVERSION=	0.42.2
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Low-level pixel manipulation library
WWW=		http://pixman.org

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

PORTSCOUT=	limitw:1,even

USES=		compiler:c11 cpe perl5 tar:xz xorg-cat:lib
USE_PERL5=	build
CONFIGURE_ARGS=	--disable-gtk
INSTALL_TARGET=	install-strip

# Build the library exclusively, thus disabling the demos and the tests (which
# do not get installed anyway).  This is to workaround a problem in powerpc64
# where the build of the tests crashes ld; see PR bin/202284.
MAKE_ARGS=	SUBDIRS=pixman

.include <bsd.port.pre.mk>

.if ${ARCH} == "armv6" || ${ARCH} == "armv7"
BUILD_DEPENDS+=	${LOCALBASE}/bin/as:devel/binutils
CONFIGURE_ENV+=	CCASFLAGS="${CFLAGS} -B${LOCALBASE}/bin -no-integrated-as"
LLD_UNSAFE=	yes
.endif

.if ${ARCH} == "powerpc64" || ${ARCH} == "powerpc"
CONFIGURE_ARGS+=	--disable-vmx
.endif

.include <bsd.port.post.mk>
