PORTNAME=	yarn
DISTVERSIONPREFIX=	v
DISTVERSION=	1.22.18
CATEGORIES=	www
MASTER_SITES=	https://yarnpkg.com/downloads/${PORTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Package manager for node, alternative to npm

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

USES?=		nodejs:run
USES+=		cpe
CPE_VENDOR=	${PORTNAME}pkg

CONFLICTS_INSTALL?=	yarn-node17 yarn-node16 yarn-node14

OPTIONS_DEFINE=	HADOOPCOMPAT
HADOOPCOMPAT_DESC=	hadoop2 compatibility, the yarn script is excluded

OPTIONS_SUB=	yes

HADOOPCOMPAT_CONFLICTS_INSTALL_OFF=	hadoop2*

NO_ARCH=	yes
NO_BUILD=	yes

post-patch:
	@${RM} ${WRKSRC}/bin/*.cmd
	@${REINPLACE_CMD} -i '' \
		-e 's|"installationMethod": "tar"|"installationMethod": "pkg"|g' \
		${WRKSRC}/package.json
	@${REINPLACE_CMD} -i '' -e 's%Linux)%Linux|MidnightBSD)%g' \
		${WRKSRC}/bin/yarn

do-install:
	${MKDIR} ${PREFIX}/lib/node_modules/yarn
	(cd ${WRKSRC}/ && ${COPYTREE_SHARE} . ${PREFIX}/lib/node_modules/yarn)
	${RLN} ${PREFIX}/lib/node_modules/yarn/bin/yarn.js \
		${PREFIX}/bin/yarn.js
	${RLN} ${PREFIX}/lib/node_modules/yarn/bin/yarnpkg \
		${PREFIX}/bin/yarnpkg

do-install-HADOOPCOMPAT-off:
	${RLN} ${FAKE_DESTDIR}${PREFIX}/lib/node_modules/yarn/bin/yarn \
		${FAKE_DESTDIR}${PREFIX}/bin/yarn

.include <bsd.port.mk>
