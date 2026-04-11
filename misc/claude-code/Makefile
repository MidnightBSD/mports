PORTNAME=	claude-code
DISTVERSION=	2.1.90
PORTREVISION=	0
CATEGORIES=	misc # machine-learning

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Agentic coding tool from Anthropic that lives in your terminal
WWW=		https://github.com/anthropics/claude-code

FETCH_DEPENDS=	npm:www/npm \
		jq:textproc/jq \
		${LOCALBASE}/share/certs/ca-root-nss.crt:security/ca_root_nss
RUN_DEPENDS=	rg:textproc/ripgrep

USES=		nodejs:run

NO_BUILD=	yes
NO_ARCH=	yes

PACKAGE_NAME=	@anthropic-ai/claude-code

FETCH_SCRIPT=	${PORTSDIR}/Tools/scripts/npmjs-fetch-with-dependencies.sh

CLI_JS=		${WRKSRC}/node_modules/${PACKAGE_NAME}/cli.js

do-fetch:
	@if ! [ -f ${DISTDIR}/${PORTNAME}-${DISTVERSION}${EXTRACT_SUFX} ]; then \
		${SETENV} TMPDIR=${WRKDIR} LOCALBASE=${LOCALBASE} ${FETCH_SCRIPT} \
			${PACKAGE_NAME} ${DISTVERSION} \
			${FILESDIR}/package-lock.json \
			${DISTDIR}/${PORTNAME}-${DISTVERSION}${EXTRACT_SUFX}; \
	fi

# Raise API and MCP transport timeouts to 24 hours for slow (e.g. CPU-based) servers
post-extract:
	${REINPLACE_CMD} \
		-e 's/var EP5=60000;/var EP5=86400000;/' \
		-e 's/API_TIMEOUT_MS||String(600000)/API_TIMEOUT_MS||String(86400000)/' \
		-e 's/DEFAULT_TIMEOUT=600000;/DEFAULT_TIMEOUT=86400000;/' \
		${CLI_JS}

do-install:
	# install files
	@${MKDIR} ${STAGEDIR}${PREFIX}/lib
	@cd ${WRKSRC} && \
		${COPYTREE_SHARE} node_modules ${STAGEDIR}${PREFIX}/lib
	# update shebang
	${REINPLACE_CMD} -i '' \
		-e "s|#!/usr/bin/env node|#!${PREFIX}/bin/node|" \
		${STAGEDIR}${PREFIX}/lib/node_modules/${PACKAGE_NAME}/cli.js
	# set exec bit
	@${CHMOD} +x ${STAGEDIR}${PREFIX}/lib/node_modules/${PACKAGE_NAME}/cli.js
	# create wrapper script that uses system ripgrep
	@${MKDIR} ${STAGEDIR}${PREFIX}/bin
	@${ECHO_CMD} '#!/bin/sh' > ${STAGEDIR}${PREFIX}/bin/claude
	@${ECHO_CMD} 'export USE_BUILTIN_RIPGREP=false' >> ${STAGEDIR}${PREFIX}/bin/claude
	@${ECHO_CMD} 'exec ${PREFIX}/lib/node_modules/${PACKAGE_NAME}/cli.js "$$@"' >> ${STAGEDIR}${PREFIX}/bin/claude
	@${CHMOD} +x ${STAGEDIR}${PREFIX}/bin/claude
	# remove bundled ripgrep
	@${RM} -r ${STAGEDIR}${PREFIX}/lib/node_modules/${PACKAGE_NAME}/vendor/ripgrep

.include <bsd.port.mk>
