PORTNAME=	mona
PORTVERSION=	2.90
CATEGORIES=	japanese x11-fonts
MASTER_SITES=	SF/monafont/monafont/monafont-${PORTVERSION}
PKGNAMEPREFIX=	ja-font-
DISTNAME=	monafont-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	12,14,16-dot Kanji fonts
WWW=		https://monafont.sourceforge.net/

LICENSE=	publicdom

BUILD_DEPENDS=	bdftopcf:x11-fonts/bdftopcf \
		mkfontscale>=0:x11-fonts/mkfontscale

USES=		fonts perl5 tar:bzip2
FONTPATHSPEC=	${FONTNAME}:unscaled:pri=60
USE_PERL5=	build
NO_ARCH=	yes
MAKE_ENV=	FONTSDIR="${FONTSDIR}"
ALL_TARGET=	bdf

post-install:
	${INSTALL_DATA} ${FILESDIR}/fonts.alias ${STAGEDIR}${FONTSDIR}

.include <bsd.port.mk>
