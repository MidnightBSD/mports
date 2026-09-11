PORTNAME=	typescript
DISTVERSION=	5.9.3
CATEGORIES=	lang
MASTER_SITES=	https://registry.npmjs.org/${PORTNAME}/-/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Superset of JavaScript that compiles to JavaScript output
WWW=		https://www.typescriptlang.org/

LICENSE=	Apache-2.0

USES=		nodejs:run tar:tgz

NO_ARCH=	yes
NO_BUILD=	yes

WRKSRC=		${WRKDIR}/package

post-patch:
	${FIND} ${WRKSRC}/bin -type f | ${XARGS} \
		${REINPLACE_CMD} -i "" -e 's|../lib|${LOCALBASE}/lib/node_modules/${PORTNAME}|'

do-install:
	${MKDIR} ${PREFIX}/lib/node_modules/${PORTNAME}
	${INSTALL_SCRIPT} ${WRKSRC}/bin/tsc ${PREFIX}/bin
	${INSTALL_SCRIPT} ${WRKSRC}/bin/tsserver ${PREFIX}/bin
	cd ${WRKSRC}/lib && ${COPYTREE_SHARE} . ${PREFIX}/lib/node_modules/${PORTNAME}

.include <bsd.port.mk>
