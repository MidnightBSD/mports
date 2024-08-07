PORTNAME=	wmii
PORTVERSION=	3.9.2
CATEGORIES=	x11-wm
MASTER_SITES=	http://dl.suckless.org/wmii/
PKGNAMESUFFIX=	-devel
DISTNAME=	${PORTNAME}+ixp-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Dynamic, minimalist window manager for X11
WWW=		https://code.google.com/p/wmii/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

LIB_DEPENDS=	libixp.so:devel/libixp

CONFLICTS=	wmii

USES=		pkgconfig python:run shebangfix tar:tbz xorg
SHEBANG_FILES=	alternative_wmiircs/python/wmiirc
USE_XORG=	x11 xext xrandr xrender xinerama xft

MAKE_ARGS=	PREFIX="${TRUE_PREFIX}" INCLUDE="${LOCALBASE}/include" \
		CC="${CC} -c" LD="${CC}" LIBIXP="-lixp" STATIC="" \
		MAN="${PREFIX}/share/man" DOC="${DOCSDIR}"
MAKE_ENV=	noisycc=1	# unmute build commands, useful for logs

OPTIONS_DEFINE=	DOCS

post-patch:
# Link against `devel/libixp' from ports and drop extraneous build options
	@${REINPLACE_CMD} -e '/libixp/d' ${WRKSRC}/Makefile
	@${REINPLACE_CMD} -e 's,/usr/lib,${LOCALBASE}/lib, ; /^CFLAGS +=/d' \
		${WRKSRC}/config.mk

post-install:
	@${RM} ${STAGEDIR}${DOCSDIR}/LICENSE
.for f in bin/wimenu bin/wmii bin/wmii9menu bin/wmiir lib/libwmii_hack.so
	@${STRIP_CMD} ${STAGEDIR}${PREFIX}/${f}
.endfor

.include <bsd.port.mk>
