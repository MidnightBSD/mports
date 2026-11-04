PORTNAME=	yamlfmt
DISTVERSIONPREFIX=	v
DISTVERSION=	0.16.0
PORTREVISION=	2
CATEGORIES=	textproc

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple command line tool for formatting yaml files
WWW=		https://github.com/google/yamlfmt

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		go:modules
GO_MODULE=	github.com/google/yamlfmt
GO_TARGET=	./cmd/yamlfmt

PLIST_FILES=	${GO_TARGET:T:S,^,bin/,}

.include <bsd.port.mk>
