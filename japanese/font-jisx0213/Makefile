PORTNAME=	jisx0213
PORTVERSION=	20040425
CATEGORIES=	japanese x11-fonts
MASTER_SITES=	FREEBSD_LOCAL/hrs
PKGNAMEPREFIX=	ja-font-
DISTFILES=	jiskan16-2004-1.bdf.gz jiskan16-2000-1.bdf.gz \
		jiskan16-2000-2.bdf.gz K14-2004-1.bdf.gz \
		K14-2000-1.bdf.gz K14-2000-2.bdf.gz \
		K12-1.bdf.gz K12-2.bdf.gz \
		jiskan24-2000-1.bdf.gz jiskan24-2000-2.bdf.gz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Japanese jisx0213 fonts
WWW=		http://www12.ocn.ne.jp/~imamura/jisx0213.html

LICENSE=	publicdom

BUILD_DEPENDS=	mkbold:x11-fonts/mkbold-mkitalic \
		bdftopcf:x11-fonts/bdftopcf

USES=		fonts
FONTPATHSPEC=	${FONTNAME}:unscaled:pri=60
NO_ARCH=	yes
NO_WRKSUBDIR=	yes
EXTRACT_CMD=	${GZCAT}
EXTRACT_BEFORE_ARGS=
EXTRACT_AFTER_ARGS=	> ${WRKSRC}/$${file%.gz}
MAKE_ENV=	FONTSDIR="${FONTSDIR}"
MAKEFILE=	${FILESDIR}/Makefile

.include <bsd.port.mk>
