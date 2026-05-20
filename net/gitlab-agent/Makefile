PORTNAME=	gitlab-agent
PORTVERSION=	${GITLAB_VERSION}
DISTVERSIONPREFIX=	v
PORTREVISION=	${GITLAB_PORTREVISION} # modify it in www/gitlab/Makefile.common
CATEGORIES=	net

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GitLab Kubernetes agent
WWW=		https://gitlab.com/gitlab-org/cluster-integration/gitlab-agent

LICENSE=	mit

BUILD_DEPENDS=	git>=0:devel/git

USES=		go:modules

GO_MODULE=	gitlab.com/gitlab-org/cluster-integration/gitlab-agent/v18
GO_TARGET=	./cmd/kas:kas

_BUILD_DATE=	$$(date -u "+%Y-%m-%d-%H%M UTC")
GO_BUILDFLAGS=	-tags="tracer_static,tracer_static_jaeger" \
		-ldflags=" \
		-X '${GO_MODULE}/cmd.Version=v${PORTVERSION}' \
		-X '${GO_MODULE}/cmd.Commit=${PORTVERSION}' \
		-X '${GO_MODULE}/cmd.BuildTime=${_BUILD_DATE}'"

PLIST_FILES=	bin/kas

do-install:
	${INSTALL_PROGRAM} ${GO_WRKDIR_BIN}/kas ${PREFIX}/bin/kas

.include "${.CURDIR}/../../www/gitlab/Makefile.common"
.include <bsd.port.mk>
