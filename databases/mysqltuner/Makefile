PORTNAME=	mysqltuner
PORTVERSION=	2.6.0
DISTVERSIONPREFIX=	v
CATEGORIES=	databases

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Assist you with MySQL Configuration
WWW=		https://github.com/major/MySQLTuner-perl

LICENSE=	gpl3
LICENSE_FILE=	${WRKSRC}/LICENSE

OPTIONS_DEFINE=	DOCS

USES=		perl5 shebangfix
NO_ARCH=	yes
NO_BUILD=	yes
USE_GITHUB=	yes
GH_ACCOUNT=	major
GH_PROJECT=	MySQLTuner-perl

PLIST_FILES=	bin/${PORTNAME}

SHEBANG_FILES=	${PORTNAME}.pl

PORTDOCS=	CONTRIBUTING INTERNALS README USAGE

do-install:
	${MKDIR} ${STAGEDIR}${PREFIX}/bin
	${INSTALL_SCRIPT} ${WRKSRC}/${PORTNAME}.pl ${STAGEDIR}${PREFIX}/bin/${PORTNAME}

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
.for doc in ${PORTDOCS}
	${INSTALL_DATA} ${WRKSRC}/${doc}.md ${FAKE_DESTDIR}${DOCSDIR}/${doc}
.endfor

.include <bsd.port.mk>
