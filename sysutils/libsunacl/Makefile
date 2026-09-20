PORTNAME=	libsunacl
PORTVERSION=	1.0.1
CATEGORIES=	sysutils
MASTER_SITES=	https://github.com/freenas/libsunacl/releases/download/v${PORTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Wrapper providing SunOS NFSv4 ACL API
LICENSE=	bsd2

FAKE_OPTS=	trueprefix

USES=		uidfix
USE_LDCONFIG=	yes
PLIST_FILES=	include/sunacl.h lib/libsunacl.a lib/libsunacl.so.1 lib/libsunacl.so
MAKE_ENV=	WITHOUT_PROFILE=yes

.include <bsd.port.pre.mk>

.if ${OSVERSION} < 4000
IGNORE=		no NFSv4 ACL support before MidnightBSD 0.4
.endif

.include <bsd.port.post.mk>
