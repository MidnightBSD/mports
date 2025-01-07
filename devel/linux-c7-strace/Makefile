PORTNAME=	strace
PORTVERSION=	4.24
DISTVERSIONSUFFIX=	-7.el7_9
PORTREVISION=	4
CATEGORIES=	devel

MAINTAINER=	poprts@MidnightBSD.org
COMMENT=	System call tracer (CentOS ${LINUX_DIST_VER})
WWW=		https://sourceforge.net/projects/strace/

LICENSE=	other

RUN_DEPENDS=	${LINUXBASE}/usr/lib/libdw.so.1:devel/linux-c7-elfutils-libs

USES=		cpe linux:c7
USE_LINUX_RPM=	nolib

CPE_VENDOR=	strace_project

.include <bsd.mport.options.mk>

.if ${ARCH} == aarch64
RUN_DEPENDS=	${LINUXBASE}/usr/lib64/libdw.so.1:devel/linux-c7-elfutils-libs
.else
RUN_DEPENDS=	${LINUXBASE}/usr/lib/libdw.so.1:devel/linux-c7-elfutils-libs
.endif

.include <bsd.port.mk>
