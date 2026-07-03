PORTNAME=	blogwatcher
DISTVERSIONPREFIX=	v
DISTVERSION=	0.0.2
CATEGORIES=	misc

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Stay on top of your favorite blogs
WWW=		https://github.com/Hyaxia/blogwatcher

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		go:1.24+,modules

GO_MODULE=	github.com/Hyaxia/blogwatcher
GO_TARGET=	./cmd/${PORTNAME}

BROKEN_i386=	fails to build: vendored modernc.org/libc has 32-bit size_t type mismatches

PLIST_FILES=	bin/${PORTNAME}

.include <bsd.port.mk>
