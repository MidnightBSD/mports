PORTNAME=	powerdxx
DISTVERSION=	0.4.4
PORTREVISION=	2
CATEGORIES=	sysutils
PATCH_SITES=	https://github.com/lonkamikaze/powerdxx/commit/
PATCHFILES=	026a0c4a922f5a4aa289959940e7b9eea18a7663.patch:-p1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	CPU clock speed/frequency daemon
WWW=		https://github.com/lonkamikaze/powerdxx

LICENSE=	iscl
LICENSE_FILE=	${WRKSRC}/LICENSE.md

FAKE_OPTS=	trueprefix

USES=		compiler:c++17-lang

USE_GITHUB=	yes
GH_ACCOUNT=	lonkamikaze
GH_TUPLE=	lonkamikaze:powerdxx:c555acd:powerdxx/gh-pages

USE_LDCONFIG=	yes
MAKE_ARGS=	DOCSDIR="${DOCSDIR}"

OPTIONS_DEFINE=	DOCS

post-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_MAN} ${WRKSRC}/gh-pages/refman.pdf ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
