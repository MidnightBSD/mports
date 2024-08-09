PORTNAME=	xtail
PORTVERSION=	2.1
CATEGORIES=	misc
MASTER_SITES=	http://www.unicom.com/sw/xtail/ \
		http://utenti.gufi.org/~gmarco/files/distfiles/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Watches the growth of files or directories
WWW=		https://www.unicom.com/sw/xtail/

LICENSE=	unknown

HAS_CONFIGURE=	yes

PLIST_FILES=	bin/xtail share/man/man1/xtail.1.gz

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/xtail ${PREFIX}/bin
	${INSTALL_DATA} ${WRKSRC}/xtail.1 ${PREFIX}/share/man/man1

.include <bsd.port.mk>
