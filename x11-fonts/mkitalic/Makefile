# Created by: KOMATSU Shinichiro

PORTNAME=	mkitalic
PORTVERSION=	1.0
CATEGORIES=	x11-fonts
MASTER_SITES=	PORTS_JP
EXTRACT_SUFX=	.bz2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl script to make BDF font italic

LICENSE=	unknown

CONFLICTS=	mkbold-mkitalic-[0-9]*

PLIST_FILES=	bin/mkitalic
EXTRACT_CMD=	${BZCAT}
EXTRACT_BEFORE_ARGS=	#
EXTRACT_AFTER_ARGS=	> ${WRKSRC}/mkitalic
NO_WRKSUBDIR=	yes
USES=		shebangfix perl5 tar:bzip2
SHEBANG_FILES=	mkitalic
NO_BUILD=	yes

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/mkitalic ${STAGEDIR}${PREFIX}/bin

.include <bsd.port.mk>
