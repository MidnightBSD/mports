# Created by: Tobias Kortkamp <t@tobik.me>
# $FreeBSD: head/java/intellij-pty4j/Makefile 415356 2016-05-16 19:07:06Z bsam $
# $MidnightBSD$

PORTNAME=	intellij-pty4j
PORTVERSION=	0.5
PORTREVISION=	1
CATEGORIES=	java devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	FreeBSD-compatible replacement for IntelliJ's bundled Pty4J

LICENSE=	epl
LICENSE_FILE=	${WRKSRC}/LICENSE

USE_GITHUB=	yes
GH_ACCOUNT=	idea4bsd
GH_PROJECT=	pty4j
GH_TAGNAME=	5d29b891bca0ddf122fc51e3ce066fe421b47b54

WRKSRC=		${WRKDIR}/${GH_PROJECT}-${GH_TAGNAME}

USES=	gmake

.include "${.CURDIR}/../intellij/common.mk"

.include <bsd.mport.options.mk>

# The directory we need to install Pty4J's native library in depends
# on the install target's architecture.  We rebuild libpty.so instead
# of using one of the bundled ones which are FreeBSD 10.x only.
.if ${ARCH} == "amd64"
PTY4J_ARCH=	x86_64
.elif ${ARCH} == "i386"
PTY4J_ARCH=	x86
.else
PTY4J_ARCH=
.endif

.if ${PTY4J_ARCH} != ""
# Despite what the name might suggest using the linux_x86_64 target
# will always build libpty.so for the native platform.
BUILD_WRKSRC=	${WRKSRC}/native
MAKEFILE=	Makefile_freebsd
ALL_TARGET=	linux_x86_64
PLIST_FILES+=	${IDEA_HOME_REL}/lib/libpty/freebsd/${PTY4J_ARCH}/libpty.so
.else
# If native Pty4J support is missing IntelliJ IDEA will still work but
# without the ability to open terminals.
NO_BUILD=	yes
.endif

do-install:
.if ${PTY4J_ARCH} != ""
	${MKDIR} ${STAGEDIR}${IDEA_HOME}/lib/libpty/freebsd/${PTY4J_ARCH}
# See above why we always use freebsd/x86_64/ here
	${INSTALL_LIB} ${WRKSRC}/os/freebsd/x86_64/libpty.so ${STAGEDIR}${IDEA_HOME}/lib/libpty/freebsd/${PTY4J_ARCH}/
.endif

.include <bsd.port.mk>
