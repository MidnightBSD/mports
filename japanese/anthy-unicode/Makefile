PORTNAME=	anthy-unicode
DISTVERSION=	1.0.0.20240502
CATEGORIES=	japanese

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for Japanese text input

LICENSE=	gpl2 lgpl2.1
LICENSE_COMB=	multi
LICENSE_FILE_gpl2=	${WRKSRC}/alt-cannadic/COPYING
LICENSE_FILE_lgpl2.1=	${WRKSRC}/COPYING

USES=		autoreconf libtool pkgconfig
USE_GITHUB=	yes
GH_ACCOUNT=	fujiwarat

USE_LDCONFIG=	yes

GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip

CONFLICTS_INSTALL=	ja-anthy

ELISPDIR=	share/emacs/site-lisp/anthy-unicode
PLIST_SUB=	ELISPDIR=${ELISPDIR}

post-install:
	@${MKDIR} ${STAGEDIR}${PREFIX}/${ELISPDIR}
	${INSTALL_DATA} ${WRKSRC}/src-util/*.el ${STAGEDIR}${PREFIX}/${ELISPDIR}
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/ELISP ${STAGEDIR}${DOCSDIR}

.include <bsd.port.mk>
