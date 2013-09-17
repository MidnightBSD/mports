# $MidnightBSD$

PORTNAME=	libsunacl
PORTVERSION=	1.0
CATEGORIES=	sysutils
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Wrapper providing SunOS NFSv4 ACL API
LICENSE=	bsd2

FAKE_OPTS=	trueprefix

USE_LDCONFIG=	yes
PLIST_FILES=	include/sunacl.h lib/libsunacl.a lib/libsunacl.so.1 lib/libsunacl.so

.include <bsd.port.pre.mk>

.if ${OSVERSION} < 4000
IGNORE=		no NFSv4 ACL support before MidnightBSD 0.4
.endif

.if !defined(NO_PROFILE)
PLIST_FILES+=	lib/libsunacl_p.a
.endif

.include <bsd.port.post.mk>
