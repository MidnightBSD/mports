PORTNAME=	googler
PORTVERSION=	4.3.2
DISTVERSIONPREFIX=	v
PORTREVISION=	0
CATEGORIES=	www

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Google Search, Google Site Search, Google News from the terminal
WWW=		https://github.com/jarun/googler

LICENSE=	gpl3+
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	xclip:x11/xclip

USES=		python shebangfix
SHEBANG_FILES=	googler
USE_GITHUB=	yes
GH_ACCOUNT=	jarun

NO_BUILD=	yes
NO_ARCH=	yes

PLIST_FILES=	bin/googler share/man/man1/googler.1.gz

post-patch:
	@${SED} -i.bak 's/^\(ENABLE_SELF_UPGRADE_MECHANISM = \)True$$/\1False/' \
		${WRKSRC}/${PORTNAME}

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/${PORTNAME} ${STAGEDIR}/${PREFIX}/bin/${PORTNAME}
	${INSTALL_MAN} ${WRKSRC}/${PORTNAME}.1 ${STAGEDIR}/${PREFIX}/share/man/man1/

.include <bsd.port.mk>
