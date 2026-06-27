PORTNAME=	github-copilot-cli
DISTVERSION=	1.0.48
PORTREVISION=	1
CATEGORIES=	misc # machine-learning
DISTFILES=	${PORTNAME}-${DISTVERSION}${EXTRACT_SUFX}
DIST_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GitHub Copilot CLI brings the power of the coding agent to terminal
WWW=		https://github.com/github/copilot-cli

LICENSE=	GITHUB_COPILOT_CLI
LICENSE_NAME=	GitHub Copilot CLI License
LICENSE_FILE=	${WRKSRC}/node_modules/${PACKAGE_NAME}/LICENSE.md
LICENSE_PERMS=	no-dist-mirror no-dist-sell no-pkg-mirror no-pkg-sell auto-accept

ONLY_FOR_ARCHS=		amd64
ONLY_FOR_ARCHS_REASON=	Upstream package ships x64 assets but no i386 assets

FETCH_DEPENDS=	flock:sysutils/flock \
		npm:www/npm \
		jq:textproc/jq \
		${LOCALBASE}/share/certs/ca-root-nss.crt:security/ca_root_nss
BUILD_DEPENDS=	npm:www/npm \
		libsecret>0:security/libsecret \
		vips>=8.17.2:graphics/vips
RUN_DEPENDS=	libsecret>0:security/libsecret \
		rg:textproc/ripgrep \
		vips>=8.17.2:graphics/vips

USES=		nodejs:run pkgconfig python:build

WRKSRC=		${WRKDIR}/copilot-${DISTVERSION}

PACKAGE_NAME=	@github/copilot

DD=		${DISTDIR}/${DIST_SUBDIR}

FETCH_SCRIPT=	${PORTSDIR}/Tools/scripts/npmjs-fetch-with-dependencies.sh

FETCH_LOCKFILE=	${DD}/fetch.lock

DISTFILES+=	${NODE_HEADERS}${EXTRACT_SUFX}

NODE_HEADERS=	node-v24.13.0-headers

NODE_ARCH=	${ARCH:S/amd64/x64/:S/aarch64/arm64/:S/i386/ia32/:S/powerpc64le/ppc64le/:S/powerpc64/ppc64/:C/armv[67]/arm/} # modeled after electron.mk
PLIST_SUB=	NODE_ARCH=${NODE_ARCH}

DEP_MODULES=			pty sharp keytar node_addon_api
dep_pty_npm_name=		@devm33/node-pty
dep_pty_version=		1.0.9
dep_sharp_npm_name=		sharp
dep_sharp_version=		0.34.4
dep_keytar_npm_name=		keytar
dep_keytar_version=		7.9.0
dep_node_addon_api_npm_name=	node-addon-api
dep_node_addon_api_version=	8.5.0

.for dep in ${DEP_MODULES}
DISTFILES+=	${dep:S/_/-/g}-${dep_${dep}_version}${EXTRACT_SUFX}
.endfor

do-fetch:
	@${MKDIR} ${DD}
	@exec 9>${FETCH_LOCKFILE} && flock -x 9 && \
	if ! [ -f ${DD}/${PORTNAME}-${DISTVERSION}${EXTRACT_SUFX} ]; then \
		${ECHO} "====> Fetching ${PORTNAME}-${DISTVERSION}${EXTRACT_SUFX}" && \
		${SETENV} TMPDIR=${WRKDIR} LOCALBASE=${LOCALBASE} ${FETCH_SCRIPT} \
			${PACKAGE_NAME} ${DISTVERSION} \
			${FILESDIR}/package-lock.json \
			${DD}/${PORTNAME}-${DISTVERSION}${EXTRACT_SUFX}; \
	fi && \
	if ! [ -f ${DD}/${NODE_HEADERS}${EXTRACT_SUFX} ]; then \
		${ECHO} "====> Fetching ${NODE_HEADERS}${EXTRACT_SUFX}" && \
		${FETCH_CMD} -q https://nodejs.org/download/release/v${NODE_HEADERS:S/node-v//:S/-headers//}/${NODE_HEADERS}${EXTRACT_SUFX} \
			-o ${DD}/${NODE_HEADERS}${EXTRACT_SUFX}; \
	fi && \
	if ! [ -f ${DD}/pty-${dep_pty_version}${EXTRACT_SUFX} ]; then \
		${ECHO} "====> Fetching dependency pty" && \
		${SETENV} TMPDIR=${WRKDIR} LOCALBASE=${LOCALBASE} ${FETCH_SCRIPT} \
			${dep_pty_npm_name} ${dep_pty_version} \
			${FILESDIR}/package-lock-pty.json \
			${DD}/pty-${dep_pty_version}${EXTRACT_SUFX}; \
	fi && \
	if ! [ -f ${DD}/sharp-${dep_sharp_version}${EXTRACT_SUFX} ]; then \
		${ECHO} "====> Fetching dependency sharp" && \
		${SETENV} TMPDIR=${WRKDIR} LOCALBASE=${LOCALBASE} ${FETCH_SCRIPT} \
			${dep_sharp_npm_name} ${dep_sharp_version} \
			${FILESDIR}/package-lock-sharp.json \
			${DD}/sharp-${dep_sharp_version}${EXTRACT_SUFX}; \
	fi && \
	if ! [ -f ${DD}/keytar-${dep_keytar_version}${EXTRACT_SUFX} ]; then \
		${ECHO} "====> Fetching dependency keytar" && \
		${SETENV} TMPDIR=${WRKDIR} LOCALBASE=${LOCALBASE} ${FETCH_SCRIPT} \
			${dep_keytar_npm_name} ${dep_keytar_version} \
			${FILESDIR}/package-lock-keytar.json \
			${DD}/keytar-${dep_keytar_version}${EXTRACT_SUFX}; \
	fi && \
	if ! [ -f ${DD}/node-addon-api-${dep_node_addon_api_version}${EXTRACT_SUFX} ]; then \
		${ECHO} "====> Fetching dependency node-addon-api" && \
		${SETENV} TMPDIR=${WRKDIR} LOCALBASE=${LOCALBASE} ${FETCH_SCRIPT} \
			${dep_node_addon_api_npm_name} ${dep_node_addon_api_version} \
			${FILESDIR}/package-lock-node-addon-api.json \
			${DD}/node-addon-api-${dep_node_addon_api_version}${EXTRACT_SUFX}; \
	fi

post-extract:
	# Extract node-addon-api and install into sharp/node_modules
	# the tarball has a nested structure, so we need to move the inner directory
	@${MV} \
		${WRKDIR}/${dep_node_addon_api_npm_name}-${dep_node_addon_api_version}/node_modules/${dep_node_addon_api_npm_name} \
		${WRKDIR}/${dep_sharp_npm_name}-${dep_sharp_version}/node_modules/${dep_sharp_npm_name}/node_modules/node-addon-api

post-patch:
	# set version
	${REINPLACE_CMD} -i '' \
		-e 's|qg.default.createElement(U,{color:e.MUTED},"v",t)|qg.default.createElement(U,{color:e.MUTED},"v","${PORTVERSION}")|g' \
		${WRKSRC}/node_modules/@github/copilot/index.js
	# keytar bundles node-addon-api 4.3.0, whose napi.h initializes
	# TypedArray::unknown_array_type with static_cast<napi_typedarray_type>(-1).
	# Clang 16+ (FreeBSD 16-CURRENT) rejects this as "not a constant expression"
	# because -1 falls outside the valid range [0,15] of the enum.
	# Adding 'inline' makes it a C++17 inline static data member whose
	# initialiser is no longer required to be a constant expression.
	@${REINPLACE_CMD} -i '' \
		-e "s/static const napi_typedarray_type unknown_array_type = /static inline const napi_typedarray_type unknown_array_type = /" \
		${WRKSRC}/../keytar-${dep_keytar_version}/node_modules/keytar/node_modules/node-addon-api/napi.h
	@${REINPLACE_CMD} -i '' \
		-e 's|version:"unknown"|version:"${PORTVERSION}"|g' \
		${WRKSRC}/node_modules/${PACKAGE_NAME}/app.js

do-build:
	# Create directory for FreeBSD prebuilds
	@${MKDIR} ${WRKSRC}/node_modules/${PACKAGE_NAME}/prebuilds/freebsd-x64
	@${ECHO_MSG} "====> Building pty..."
	@cd ${WRKDIR}/node-pty-${dep_pty_version}/node_modules/${dep_pty_npm_name} && \
		${SETENV} AR=/usr/bin/llvm-ar HOME=${WRKDIR} CFLAGS="-I${LOCALBASE}/include" CXXFLAGS="-I${LOCALBASE}/include" \
			npm rebuild --nodedir=${LOCALBASE} && \
		${CP} build/Release/pty.node ${WRKSRC}/node_modules/${PACKAGE_NAME}/prebuilds/freebsd-x64/
	@${ECHO_MSG} "====> Building sharp..."
	@cd ${WRKDIR}/sharp-${dep_sharp_version}/node_modules/${dep_sharp_npm_name}/src && \
		${SETENV} AR=/usr/bin/llvm-ar HOME=${WRKDIR} PYTHON=${PYTHON_CMD} CXXFLAGS="-I${LOCALBASE}/include" \
			node-gyp configure build --nodedir=${WRKDIR}/${NODE_HEADERS:S/-headers//} && \
		${MKDIR} ${WRKSRC}/node_modules/${PACKAGE_NAME}/node_modules/@img/sharp-freebsd-${NODE_ARCH} && \
		${CP} build/Release/sharp-freebsd-${NODE_ARCH}.node ${WRKSRC}/node_modules/${PACKAGE_NAME}/node_modules/@img/sharp-freebsd-${NODE_ARCH}/sharp.node
	@${ECHO_MSG} "====> Building keytar..."
	@cd ${WRKDIR}/keytar-${dep_keytar_version}/node_modules/${dep_keytar_npm_name} && \
		${SETENV} AR=/usr/bin/llvm-ar HOME=${WRKDIR} CFLAGS="-I${LOCALBASE}/include" CXXFLAGS="-I${LOCALBASE}/include" \
			npm rebuild --nodedir=${LOCALBASE} && \
		${CP} build/Release/keytar.node ${WRKSRC}/node_modules/${PACKAGE_NAME}/prebuilds/freebsd-x64/

do-install:
	# install files
	cd ${WRKSRC} && \
		${COPYTREE_SHARE} . ${PREFIX}/lib
	# remove *.node files for other OSes
	@${FIND} ${PREFIX}/lib/node_modules/${PACKAGE_NAME} -name "*\\.node" | \
		${GREP} -v freebsd | \
		${XARGS} ${RM}
	# remove files for other OSes
	@${FIND} ${PREFIX}/lib/node_modules/${PACKAGE_NAME} -name "*linux*" | ${XARGS} ${RM} -r
	@${FIND} ${PREFIX}/lib/node_modules/${PACKAGE_NAME} -name "*win32*" | ${XARGS} ${RM} -r
	@${FIND} ${PREFIX}/lib/node_modules/${PACKAGE_NAME} -name "*darwin*" | ${XARGS} ${RM} -r
	# remove unnecessary files
	@${FIND} ${PREFIX}/lib -type f -and -name "*package*.json" -delete
	@${FIND} ${PREFIX}/lib -type f -and -name "README.md" -delete
	@${FIND} ${PREFIX}/lib -type f -and -name "LICENSE.md" -delete
	# update shebang to use system node
	@${REINPLACE_CMD} -i '' \
		-e "s|#!/usr/bin/env node|#!${TRUE_PREFIX}/bin/node|" \
		${PREFIX}/lib/node_modules/${PACKAGE_NAME}/index.js \
		${PREFIX}/lib/node_modules/${PACKAGE_NAME}/npm-loader.js
	# set exec bit
	@${CHMOD} +x ${PREFIX}/lib/node_modules/${PACKAGE_NAME}/npm-loader.js
	# create symlink in bin
	@${MKDIR} ${PREFIX}/bin
	@${LN} -s ../lib/node_modules/.bin/copilot ${PREFIX}/bin/copilot
	# strip native modules
	@${FIND} ${PREFIX}/lib/node_modules/${PACKAGE_NAME} -name "*.node" | ${XARGS} ${STRIP_CMD}

.include <bsd.port.mk>
