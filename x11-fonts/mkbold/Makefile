# Created by: KOMATSU Shinichiro

PORTNAME=	mkbold
PORTVERSION=	1.0
PORTREVISION=	2
CATEGORIES=	x11-fonts
MASTER_SITES=	PORTS_JP
EXTRACT_SUFX=	.bz2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl script to make BDF font bold

LICENSE=	unknown

CONFLICTS=	mkbold-mkitalic-[0-9]*

PLIST_FILES=	bin/mkbold
USES=		shebangfix perl5 tar:bzip2
SHEBANG_FILES=	mkbold
EXTRACT_CMD=	${BZCAT}
EXTRACT_BEFORE_ARGS=	#
EXTRACT_AFTER_ARGS=	> ${WRKSRC}/mkbold
NO_WRKSUBDIR=	yes
NO_BUILD=	yes

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/mkbold ${STAGEDIR}${PREFIX}/bin

.include <bsd.port.mk>
