PORTNAME=	npm
PORTVERSION=	9.9.0
CATEGORIES=	www
MASTER_SITES=	FREEBSD_LOCAL/sunpoet
PKGNAMESUFFIX=	${NODEJS_SUFFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Node package manager
WWW=		https://www.npmjs.com/package/npm \
		https://github.com/npm/cli

LICENSE=	artistic2
LICENSE_FILE=	${WRKSRC}/lib/node_modules/npm/LICENSE

RUN_DEPENDS=	gmake:devel/gmake

USES?=		nodejs:18,run
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

do-install:
	cd ${WRKSRC}/ && ${COPYTREE_SHARE} . ${PREFIX}/
	${ECHO_CMD} 'python=${PYTHON_CMD}' > ${PREFIX}/etc/npmrc
	${PYTHON_CMD} -m compileall -d ${PREFIX}/lib/node_modules/npm/node_modules/node-gyp/gyp/pylib/gyp -f ${PREFIX}/lib/node_modules/npm/node_modules/node-gyp/gyp/pylib/gyp
	${PYTHON_CMD} -O -m compileall -d ${PREFIX}/lib/node_modules/npm/node_modules/node-gyp/gyp/pylib/gyp -f ${PREFIX}/lib/node_modules/npm/node_modules/node-gyp/gyp/pylib/gyp

.include <bsd.port.mk>
