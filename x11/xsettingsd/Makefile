PORTNAME=	xsettingsd
DISTVERSIONPREFIX=	v
DISTVERSION=	1.0.0-2
PORTREVISION=	2
DISTVERSIONSUFFIX=	-g1b2bcca
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Daemon that implements the XSETTINGS specification
WWW=		https://github.com/derat/xsettingsd

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		compiler:c++11-lang pkgconfig scons xorg
USE_GITHUB=	yes
GH_ACCOUNT=	derat
USE_XORG=	x11

PLIST_FILES=	bin/dump_xsettings \
		bin/xsettingsd \
		share/man/man1/dump_xsettings.1.gz \
		share/man/man1/xsettingsd.1.gz

.include <bsd.port.pre.mk>

.if ${CHOSEN_COMPILER_TYPE} == gcc
pre-configure:
	${REINPLACE_CMD} -e 's|-Wno-narrowing||' ${WRKSRC}/SConstruct
.endif

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/dump_xsettings ${WRKSRC}/xsettingsd \
		${STAGEDIR}${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/dump_xsettings.1 ${WRKSRC}/xsettingsd.1 \
		${STAGEDIR}${PREFIX}/share/man/man1

.include <bsd.port.post.mk>
