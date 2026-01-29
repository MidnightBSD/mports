PORTNAME=	npm
PORTVERSION=	10.9.2
CATEGORIES=	www
MASTER_SITES=	FREEBSD_LOCAL/sunpoet
PKGNAMESUFFIX=	${NODEJS_SUFFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Node package manager
WWW=		https://www.npmjs.com/package/npm \
		https://docs.npmjs.com/cli/v10 \
		https://github.com/npm/cli

LICENSE=	artistic2
LICENSE_FILE=	${WRKSRC}/lib/node_modules/npm/LICENSE

RUN_DEPENDS=	gmake:devel/gmake

USES?=		nodejs:22,run
USES+=		cpe python shebangfix tar:xz

NO_ARCH=	yes
NO_BUILD=	yes
REINPLACE_ARGS=	-i ''

CONFLICTS_INSTALL=	npm-node[0-9][0-9]

CPE_VENDOR=	npmjs

PORTSCOUT=	ignore:1

SHEBANG_GLOB=	*.py

post-patch:
	@${REINPLACE_CMD} -e 's|/usr/local|${PREFIX}|' ${WRKSRC}/etc/man.d/npm.conf
	@${REINPLACE_CMD} -e 's|/usr/local|${LOCALBASE}|' ${WRKSRC}/lib/node_modules/npm/node_modules/node-gyp/gyp/gyp
	@${REINPLACE_CMD} -e 's|exec python |exec ${PYTHON_CMD} |' ${WRKSRC}/lib/node_modules/npm/node_modules/node-gyp/gyp/gyp
	@${FIND} ${WRKSRC}/ -name '*.sh' -exec ${REINPLACE_CMD} -e '1 s|/usr/local|${LOCALBASE}|' {} +
	@${FIND} ${WRKSRC}/ -name '*.bak' -delete

do-install:
	cd ${WRKSRC}/ && ${COPYTREE_SHARE} . ${STAGEDIR}${PREFIX}/
	${ECHO_CMD} 'python=${PYTHON_CMD}' > ${STAGEDIR}${PREFIX}/etc/npmrc
	${PYTHON_CMD} -m compileall -d ${TRUE_PREFIX}/lib/node_modules/npm/node_modules/node-gyp/gyp -f ${PREFIX}/lib/node_modules/npm/node_modules/node-gyp/gyp -o 0 -o 1

.include <bsd.port.mk>
