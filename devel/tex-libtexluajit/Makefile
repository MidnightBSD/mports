PORTNAME=	libtexluajit
PORTVERSION=	2.1.0
CATEGORIES=	devel
MASTER_SITES=	TEX_CTAN/systems/texlive/${TEXLIVE_YEAR}
PKGNAMEPREFIX=	tex-
DISTNAME=	texlive-${TEXLIVE_VERSION}-source
DIST_SUBDIR=	TeX

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	LuaJIT library for TeXLive

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LuaJIT-src/COPYRIGHT

USES=		libtool pathfix pkgconfig tar:xz
USE_LDCONFIG=	yes
USE_TEX=	yes

GNU_CONFIGURE=	yes

INSTALL_TARGET=	install-strip

EXTRACT_AFTER_ARGS=	${EXTRACT_FILES:S,^,${DISTNAME}/,}
EXTRACT_FILES=	build-aux libs/luajit
WRKSRC=		${WRKDIR}/${DISTNAME}/libs/luajit

.include <bsd.port.mk>
