PORTNAME=	jailme
PORTVERSION=	0.2.0
CATEGORIES=	sysutils

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Setuid version of jexec to allow normal users access to jails
WWW=		https://github.com/Intermedix/jailme

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

USE_GITHUB=	yes
GH_ACCOUNT=	Intermedix

PLIST_FILES=	"@(,,4751) sbin/jailme"

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/jailme ${STAGEDIR}${PREFIX}/sbin

.include <bsd.port.mk>
