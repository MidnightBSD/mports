# Created by: kmoore@FreeBSD.org
# $FreeBSD: head/sysutils/docker-freebsd/Makefile 407239 2016-01-25 20:23:57Z rakuco $
# $MidnightBSD$

PORTNAME=	docker-freebsd
PORTVERSION=	20150625
CATEGORIES=	sysutils

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Docker containment system

LICENSE=	apache2
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	go>=1.4:${PORTSDIR}/lang/go \
		bash:${PORTSDIR}/shells/bash \
		sqlite3:${PORTSDIR}/databases/sqlite3
RUN_DEPENDS=	go>=1.4:${PORTSDIR}/lang/go \
		bash:${PORTSDIR}/shells/bash \
		sqlite3:${PORTSDIR}/databases/sqlite3

USE_GITHUB=	yes
GH_ACCOUNT=	kvasdopil
GH_PROJECT=	docker
GH_TAGNAME=	582db78

WRKSRC=		${WRKDIR}/docker-${GH_TAGNAME}

PLIST_FILES=	bin/docker
USE_RC_SUBR=	docker

do-build:
	@cd ${WRKSRC} && export AUTO_GOPATH=1 && export DOCKER_GITCOMMIT=${GH_TAGNAME} && ./hack/make.sh binary

do-install:
	@${MKDIR} ${STAGEDIR}${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/bundles/latest/binary/docker ${STAGEDIR}${PREFIX}/bin/

.include <bsd.port.mk>
