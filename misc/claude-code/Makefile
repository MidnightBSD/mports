PORTNAME=	claude-code
DISTVERSION=	2.1.90
CATEGORIES=	misc # machine-learning

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Agentic coding tool from Anthropic that lives in your terminal
WWW=		https://github.com/anthropics/claude-code

LICENSE=	anthropic
LICENSE_PERMS=	dist-mirror pkg-mirror
LICENSE_TEXT=	See https://www.anthropic.com/legal/commercial-terms

FETCH_DEPENDS=	npm:www/npm \
		jq:textproc/jq \
		${LOCALBASE}/share/certs/ca-root-nss.crt:security/ca_root_nss
RUN_DEPENDS=	rg:textproc/ripgrep

USES=		nodejs:run

EXTRACT_SUFX=	.tar.gz

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
	@${MKDIR} ${PREFIX}/lib
	@cd ${WRKSRC} && \
		${COPYTREE_SHARE} node_modules ${PREFIX}/lib
	# update shebang
	${REINPLACE_CMD} -i '' \
		-e "s|#!/usr/bin/env node|#!${TRUE_PREFIX}/bin/node|" \
		${PREFIX}/lib/node_modules/${PACKAGE_NAME}/cli.js
	# set exec bit
	@${CHMOD} +x ${PREFIX}/lib/node_modules/${PACKAGE_NAME}/cli.js
	# create wrapper script that uses system ripgrep
	@${MKDIR} ${PREFIX}/bin
	@${ECHO_CMD} '#!/bin/sh' > ${PREFIX}/bin/claude
	@${ECHO_CMD} 'export USE_BUILTIN_RIPGREP=false' >> ${PREFIX}/bin/claude
	@${ECHO_CMD} 'exec ${TRUE_PREFIX}/lib/node_modules/${PACKAGE_NAME}/cli.js "$$@"' >> ${PREFIX}/bin/claude
	@${CHMOD} +x ${PREFIX}/bin/claude
	# remove bundled ripgrep
	@${RM} -r ${PREFIX}/lib/node_modules/${PACKAGE_NAME}/vendor/ripgrep
	# remove non-BSD audio-capture binaries
	@${RM} -r ${PREFIX}/lib/node_modules/${PACKAGE_NAME}/vendor/audio-capture/arm64-darwin
	@${RM} -r ${PREFIX}/lib/node_modules/${PACKAGE_NAME}/vendor/audio-capture/arm64-win32
	@${RM} -r ${PREFIX}/lib/node_modules/${PACKAGE_NAME}/vendor/audio-capture/x64-darwin
	@${RM} -r ${PREFIX}/lib/node_modules/${PACKAGE_NAME}/vendor/audio-capture/x64-win32

.include <bsd.port.mk>
