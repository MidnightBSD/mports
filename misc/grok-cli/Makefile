PORTNAME=	grok-cli
DISTVERSION=	0.0.34
CATEGORIES=	misc

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Open-source AI agent bringing Grok to your terminal
WWW=		https://github.com/superagent-ai/grok-cli

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/node_modules/${PACKAGE_NAME}/LICENSE

FETCH_DEPENDS=	npm:www/npm \
		jq:textproc/jq \
		${LOCALBASE}/share/certs/ca-root-nss.crt:security/ca_root_nss
RUN_DEPENDS=	rg:textproc/ripgrep

USES=		nodejs:run

NO_BUILD=	yes
NO_ARCH=	yes

PACKAGE_NAME=	@vibe-kit/grok-cli

FETCH_SCRIPT=	${PORTSDIR}/Tools/scripts/npmjs-fetch-with-dependencies.sh

do-fetch:
	@if ! [ -f ${DISTDIR}/${PORTNAME}-${DISTVERSION}${EXTRACT_SUFX} ]; then \
		${SETENV} TMPDIR=${WRKDIR} LOCALBASE=${LOCALBASE} ${FETCH_SCRIPT} \
			${PACKAGE_NAME} ${DISTVERSION} \
			${FILESDIR}/package-lock.json \
			${DISTDIR}/${PORTNAME}-${DISTVERSION}${EXTRACT_SUFX}; \
	fi

do-install:
	# install files
	@${MKDIR} ${PREFIX}/lib
	@cd ${WRKSRC} && \
		${COPYTREE_SHARE} node_modules ${PREFIX}/lib
	# update shebang
	${REINPLACE_CMD} -i '' \
		-e "s|#!/usr/bin/env node|#!${TRUE_PREFIX}/bin/node|" \
		${PREFIX}/lib/node_modules/${PACKAGE_NAME}/dist/index.js
	# set exec bit
	@${CHMOD} +x ${PREFIX}/lib/node_modules/${PACKAGE_NAME}/dist/index.js
	# create wrapper script
	@${MKDIR} ${PREFIX}/bin
	@${ECHO_CMD} '#!/bin/sh' > ${PREFIX}/bin/grok
	@${ECHO_CMD} 'exec ${TRUE_PREFIX}/lib/node_modules/${PACKAGE_NAME}/dist/index.js "$$@"' >> ${PREFIX}/bin/grok
	@${CHMOD} +x ${PREFIX}/bin/grok
	@${FIND} -s ${PREFIX}/lib/node_modules -not -type d | \
		${SED} "s,^${PREFIX}/,," >> ${TMPPLIST}
	@${FIND} -s -d ${PREFIX}/lib/node_modules -type d | \
		${SED} "s,^${PREFIX}/,@dir ," >> ${TMPPLIST}

.include <bsd.port.mk>
