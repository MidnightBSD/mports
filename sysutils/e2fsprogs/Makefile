PORTNAME=	e2fsprogs
CATEGORIES=	sysutils
PORTVERSION=	1.47.0
PORTREVISION=	0
DISTFILES=	# empty

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Wrapper to install e2fsprogs into /sbin

LICENSE=	gpl2+

BUILD_DEPENDS=	e2fsprogs-core=${PORTVERSION}:sysutils/e2fsprogs-core
RUN_DEPENDS=	${BUILD_DEPENDS}

NO_BUILD=	yes
USES=		cpe
CPE_VENDOR=	e2fsprogs_project

do-install:
		${MKDIR} 				${FAKE_DESTDIR}/sbin
		${CP} -p ${LOCALBASE}/sbin/fsck_ext2fs	${FAKE_DESTDIR}/sbin
		${CP} -p ${LOCALBASE}/sbin/e2fsck	${FAKE_DESTDIR}/sbin

.include <bsd.port.mk>
