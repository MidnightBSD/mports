# $MidnightBSD$

PORTNAME=	ldconfig_compat
PORTVERSION=	1.0
PORTREVISION=	9
CATEGORIES=	misc
MASTER_SITES=	# none
DISTFILES=	# none

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Ldconfig compatibility script
LICENSE=	unknown

NO_BUILD=	yes
SUB_FILES=	ldconfig_compat.sh
USE_RC_SUBR=	yes

LOCAL_DIRS=	${LDCONFIG_DIR} \
		${LDCONFIG32_DIR}

SUB_LIST=	LDCONFIG_DIR=${LDCONFIG_DIR} \
		LDCONFIG32_DIR=${LDCONFIG32_DIR}

.if !defined(WITHOUT_X11)
LOCAL_PREFIXES=	${PREFIX} ${X11BASE}
.else
LOCAL_PREFIXES=	${PREFIX}
.endif

.include <bsd.port.pre.mk>
.include "${.CURDIR}/bsd.ldconfig.mk"

do-fetch:
	@${DO_NADA}

do-install:
	@${INSTALL_SCRIPT} ${WRKDIR}/ldconfig_compat.sh ${PREFIX}/etc/rc.d/ldconfig_compat
	@${ECHO_CMD} "etc/rc.d/ldconfig_compat" >> ${TMPPLIST}

.include <bsd.port.post.mk>
