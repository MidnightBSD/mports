# $MidnightBSD$
# $FreeBSD: head/www/npm/Makefile 328866 2013-09-30 20:25:47Z sunpoet $

PORTNAME=	npm
PORTVERSION=	2.14.7
PORTREVISION=	1
CATEGORIES=	www
MASTER_SITES=	FREEBSD_LOCAL/sunpoet

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Node package manager

LICENSE=	mit

RUN_DEPENDS=	gmake:${PORTSDIR}/devel/gmake

OPTIONS_SINGLE=	BACKEND
OPTIONS_SINGLE_BACKEND=	NODE NODE012 NODE4
OPTIONS_DEFAULT=NODE
NODE_DESC=    Use www/node as backend
NODE012_DESC= Use www/node012 as backend
NODE4_DESC=   Use www/node4 as backend

NO_BUILD=	yes
REINPLACE_ARGS=	-i ''
USES=		cpe python:2 tar:xz

MANPREFIX=	${PREFIX}/lib/node_modules/npm

CPE_VENDOR=	npmjs
CPE_PRODUCT=	node_packaged_modules

NODE_RUN_DEPENDS=	node>=0.8.0:${PORTSDIR}/www/node
NODE012_RUN_DEPENDS=	node012>=0.8.0:${PORTSDIR}/www/node012
NODE4_RUN_DEPENDS=	node4>=0.8.0:${PORTSDIR}/www/node4

BUILD_DEPENDS+=	${RUN_DEPENDS}

.include <bsd.mport.options.mk>

post-patch:
	@${SED} -i '' -e 's|node cli.js|& --cache ${WRKDIR}/.cache |; /^install: / s| docclean||' ${WRKSRC}/Makefile
	@${SED} -i '' -e 's|install -g -f|install -g -f --prefix=${FAKE_DESTDIR}${PREFIX}|' ${WRKSRC}/Makefile
	@${SED} -i '' -e 's|linkBins, linkMans|linkBins|' ${WRKSRC}/lib/build.js
	@${ECHO_CMD} "MANPATH ${PREFIX}/lib/node_modules/npm/man" > ${WRKDIR}/npm.conf

do-install:
	mkdir ${WRKDIR}/home
	cd ${WRKSRC} && HOME=${WRKDIR}/home node cli.js --cache /usr/mports/www/npm/work/.cache  install -g -f --prefix=/usr/mports/www/npm/work/fake-inst-amd64/usr/local

post-install:
	@${INSTALL_DATA} ${WRKDIR}/npm.conf ${PREFIX}/etc/man.d/npm.conf
	@${CHMOD} +x ${PREFIX}/lib/node_modules/npm/bin/node-gyp-bin/node-gyp
	@${REINPLACE_CMD} -e 's|${FAKE_DESTDIR}||g' ${PREFIX}/lib/node_modules/npm/Makefile

# maintainer section:
# require: bash, git, gmake, node

MS_DISTNAME=	${PORTNAME}-${MS_VERSION}
MS_TAGS=	${MS_WRKSRC}/tags
MS_VERSION=	`${CAT} ${MS_VERSIONFILE}`
MS_VERSIONFILE=	${MS_WRKSRC}/.version
MS_WRKSRC=	${WRKSRC}/tmp

GITHUB_PROJECT=	${PORTNAME}
GITHUB_TAGSURL=	https://github.com/isaacs/npm/tags
GITHUB_TARBALL=	https://github.com/${GITHUB_USER}/${GITHUB_PROJECT}/archive/${GITHUB_VERSION}.tar.gz
GITHUB_USER=	isaacs
GITHUB_VERSION=	v${MS_VERSION}

maketar: do-clean extract
	@${MKDIR} ${MS_WRKSRC}/
	@${FETCH_BINARY} ${FETCH_ARGS:C/A//} -o ${MS_WRKSRC}/tags ${GITHUB_TAGSURL}
	@${GREP} -o '/${GITHUB_USER}/${GITHUB_PROJECT}/archive/[^"]*\.tar\.gz' ${MS_WRKSRC}/tags | ${HEAD} -1 | ${CUT} -d/ -f5 | ${SED} 's|^v||; s|\.tar\.gz$$||' > ${MS_VERSIONFILE}
	@${ECHO_MSG} "*** Updating from ${PORTVERSION} to ${MS_VERSION} ..."
	@${FETCH_BINARY} ${FETCH_ARGS:C/A//} -o ${MS_WRKSRC}/${MS_DISTNAME}.tar.gz ${GITHUB_TARBALL}
	@${MKDIR} ${MS_WRKSRC}/${MS_DISTNAME}/
	@${TAR} -xf ${MS_WRKSRC}/${MS_DISTNAME}.tar.gz -C ${MS_WRKSRC}/${MS_DISTNAME}/ --strip-components 1
	@${SED} -i '' -e '/manRoot/ s|, "share"||' ${MS_WRKSRC}/${MS_DISTNAME}/lib/build.js ${MS_WRKSRC}/${MS_DISTNAME}/lib/unbuild.js
	@${SED} -i '' -e '1 s|#!/bin/bash|#!${LOCALBASE}/bin/bash|' ${MS_WRKSRC}/${MS_DISTNAME}/scripts/doc-build.sh
	@${GREP} -lr share/man ${MS_WRKSRC}/${MS_DISTNAME}/doc/ ${MS_WRKSRC}/${MS_DISTNAME}/scripts/ | ${XARGS} -I % ${SED} -i '' 's|share/man|man|g' %
	@cd ${MS_WRKSRC}/${MS_DISTNAME}/ && ${GMAKE}
	@${FIND} ${MS_WRKSRC}/${MS_DISTNAME}/ -type d -exec ${CHMOD} 755 '{}' \;
	@${FIND} ${MS_WRKSRC}/${MS_DISTNAME}/ -type f -exec ${CHMOD} 644 '{}' \;
	@${FIND} ${MS_WRKSRC}/${MS_DISTNAME}/ -type f -name '*.sh' -exec ${CHMOD} 755 '{}' \;
	@cd ${MS_WRKSRC}/ && ${TAR} -Jcf ${MS_DISTNAME}.tar.xz ${MS_DISTNAME}/
	@${SED} -i '' -e '/^PORTVERSION=/ s|${PORTVERSION}|'${MS_VERSION}'|; /^PORTREVISION=/d' ${.CURDIR}/Makefile
	@sudo ${INSTALL} -m 644 ${MS_WRKSRC}/${PORTNAME}-${MS_VERSION}.tar.xz ${DISTDIR}/
	@cd ${.CURDIR}/ && ${MAKE} makesum

.include <bsd.port.mk>
