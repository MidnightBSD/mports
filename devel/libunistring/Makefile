PORTNAME=	libunistring
DISTVERSION=	1.1
CATEGORIES=	devel
MASTER_SITES=	GNU

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Unicode string library
WWW=		https://www.gnu.org/software/libunistring/

LICENSE=	gfdl gpl3 lgpl3+
LICENSE_COMB=	multi

USES=		charsetfix gmake iconv libtool tar:xz
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
INFO=		${PORTNAME}

OPTIONS_DEFINE=	DOCS
CONFIGURE_ARGS=	--disable-static

.ifdef QEMU_EMULATING
# XXX bug 224740: configure hangs: GSlice: failed to allocate 496 bytes (alignment: 512)
CONFIGURE_ENV+=	gl_cv_func_printf_enomem=no
.endif

.include <bsd.port.mk>
