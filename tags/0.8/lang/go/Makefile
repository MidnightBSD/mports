# Created by: Devon H. O'Dell <devon.odell@gmail.com>
# $FreeBSD: head/lang/go/Makefile 409632 2016-02-26 19:22:23Z jlaffaye $
# $MidnightBSD$

PORTNAME=	go
PORTVERSION=	1.6
PORTEPOCH=	1
CATEGORIES=	lang
MASTER_SITES=	http://golang.org/dl/
DISTNAME=	go${PORTVERSION}.src

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Go programming language

LICENSE=	bsd3

BUILD_DEPENDS=	go14>=1.4:${PORTSDIR}/lang/go14

#USES=		shebangfix
SHEBANG_LANG=	sh
SHEBANG_FILES=	${WRKSRC}/src/*.bash \
		${WRKSRC}/doc/articles/wiki/*.bash

sh_OLD_CMD=	"/usr/bin/env bash"
sh_CMD=		${SH}

WRKSRC=		${WRKDIR}/go

.include <bsd.port.pre.mk>

.if ${ARCH} == "i386"
GOARCH=386
.elif ${ARCH} == "amd64"
GOARCH=amd64
.else
IGNORE=		unknown arch ${ARCH}
.endif

PLIST_SUB+=	opsys_ARCH=freebsd_${GOARCH}

post-patch:
	@cd ${WRKSRC} && ${FIND} . -name '*.orig' -delete

do-build:
	cd ${WRKSRC}/src && \
		CC=${CC} \
		GOROOT=${WRKSRC} GOROOT_FINAL=${PREFIX}/go \
		GOROOT_BOOTSTRAP=${LOCALBASE}/go14 \
		GOBIN= GOARCH=${GOARCH} GOOS=freebsd \
		${SH} make.bash

do-install:
	@${CP} -a ${WRKSRC} ${STAGEDIR}${PREFIX}
.for f in go gofmt
	@${LN} -sf ${PREFIX}/go/bin/${f} ${STAGEDIR}${PREFIX}/bin/${f}
.endfor

regression-test: build
	cd ${WRKSRC}/src && GOROOT=${WRKSRC} PATH=${WRKSRC}/bin:${PATH} ${SH} run.bash --no-rebuild --banner

.include <bsd.port.post.mk>
