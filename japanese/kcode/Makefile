PORTNAME=	kcode
DISTVERSION=	1.0
PORTREVISION=	2
CATEGORIES=	japanese
MASTER_SITES=	http://www.irori.org/dl/tool/
EXTRACT_SUFX=	.gz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Handy utility to show codepoint information of given characters
WWW=		https://www.irori.org/tool/kcode.html

LICENSE=	NONE

USES=		shebangfix perl5
USE_PERL5=	extract run
NO_WRKSUBDIR=	yes
NO_ARCH=	yes
NO_BUILD=	yes
SHEBANG_FILES=	kcode

PLIST_FILES=	bin/kcode share/man/ja/man1/kcode.1.gz

do-extract:
	${MKDIR} ${WRKSRC}
	${GZCAT} ${DISTDIR}/${DIST_SUBDIR}/${DISTFILES} > ${WRKSRC}/kcode

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/kcode ${STAGEDIR}${PREFIX}/bin
	pod2man -u ${WRKSRC}/kcode ${WRKSRC}/kcode.1
	${MKDIR} ${STAGEDIR}${PREFIX}/share/man/ja/man1
	${INSTALL_MAN} ${WRKSRC}/kcode.1 ${STAGEDIR}${PREFIX}/share/man/ja/man1

.include <bsd.port.mk>
