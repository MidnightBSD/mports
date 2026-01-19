PORTNAME=	k9s
DISTVERSIONPREFIX=	v
DISTVERSION=	0.50.16
CATEGORIES=	sysutils

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Kubernetes command-line tool
WWW=		https://github.com/derailed/k9s

LICENSE=	Apache-2.0

NOT_FOR_ARCHS=	i386

USES=		go:modules
GO_MODULE=	github.com/derailed/k9s
GO_BUILDFLAGS=	-ldflags="-X github.com/derailed/k9s/cmd.version=${DISTVERSIONFULL} \
		-X github.com/derailed/k9s/cmd.date=$$(date +'%Y-%m-%dT%H:%M:%SZ') \
		-X github.com/derailed/k9s/cmd.commit=3c37ca2197ca48591566d1f599b7b3a50d54a408"

PLIST_FILES=	bin/${PORTNAME}

NO_TEST=	yes

.include <bsd.port.mk>
