PORTNAME=	npm
PORTVERSION=	5.10.0
PORTREVISION=	1
CATEGORIES=	www
MASTER_SITES=	FREEBSD_LOCAL/sunpoet

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Node package manager

LICENSE=	apache2
LICENSE_FILE=	${WRKSRC}/lib/node_modules/npm/LICENSE

RUN_DEPENDS=	gmake:devel/gmake

CONFLICTS_INSTALL?=	npm-node4 npm-node6 npm-node8 npm2 npm3 npm4

OPTIONS_SINGLE=	BACKEND
OPTIONS_SINGLE_BACKEND=	NODE NODE6 NODE8
OPTIONS_DEFAULT=NODE
NODE_DESC=	Use Node.js 13.x (www/node) as backend
NODE10_DESC=	Use Node.js 10.x (www/node6) as backend
NODE8_DESC=	Use Node.js 8.x (www/node8) as backend

NO_ARCH=	yes
NO_BUILD=	yes
REINPLACE_ARGS=	-i ''
USES=		cpe python:2.7,run shebangfix tar:xz

CPE_VENDOR=	npmjs
CPE_PRODUCT=	node_packaged_modules

SHEBANG_GLOB=	*.py
SHEBANG_FILES=	lib/node_modules/npm/node_modules/node-gyp/gyp/samples/samples

NODE_RUN_DEPENDS=	node>=0.8.0:www/node
NODE8_RUN_DEPENDS=	node8>=0.8.0:www/node8
NODE10_RUN_DEPENDS=	node10>=0.8.0:www/node10

.include <bsd.port.pre.mk>

.if ${ARCH} == "i386"
# Workaround for kernel bug 178881
EXTRA_PATCHES+=	${PATCHDIR}/extra-patch-bug-178881
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|/usr/local|${PREFIX}|' ${WRKSRC}/etc/man.d/npm.conf
	@${REINPLACE_CMD} -e 's|/usr/local|${LOCALBASE}|' ${WRKSRC}/lib/node_modules/npm/node_modules/node-gyp/gyp/gyp
	@${FIND} ${WRKSRC}/ -name '*.sh' -exec ${REINPLACE_CMD} -e '1 s|/usr/local|${LOCALBASE}|' {} +

do-install:
	cd ${WRKSRC}/ && ${COPYTREE_SHARE} . ${STAGEDIR}${PREFIX}/

.include <bsd.port.post.mk>
