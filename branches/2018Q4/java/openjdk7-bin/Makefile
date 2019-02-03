# $MidnightBSD$

PORTNAME=	openjdk7-bin
PORTVERSION=	7.111.01
PORTREVISION=	1
CATEGORIES=	java
MASTER_SITES=	http://pkg.freebsd.org/freebsd:9:x86:64/latest/All/
DISTFILES=	openjdk-7.111.01_2,1.txz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	OpenJDK 7 FreeBSD binary

LICENSE=	gpl2

CONFLICTS=	openjdk7-1.7*

USES=		tar:xz
ONLY_FOR_ARCH=	amd64
NO_BUILD=	yes

RUN_DEPENDS+=	javavm:java/javavmwrapper \
		dejavu>=2.35:x11-fonts/dejavu

.include <bsd.port.pre.mk>

.if ${OSVERSION} >= 100001
RUN_DEPENDS+=	${LOCALBASE}/lib/compat/libcrypto.so.6:misc/compat9x
.endif

do-install:
	${MV} ${WRKDIR}/usr/local/openjdk7 ${FAKE_DESTDIR}/${LOCALBASE}/

.include <bsd.port.post.mk>
