PORTNAME=	powerdxx
DISTVERSION=	0.4.4
CATEGORIES=	sysutils

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	CPU clock speed/frequency daemon

LICENSE=	iscl

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
